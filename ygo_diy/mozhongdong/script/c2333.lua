--魔钟洞的战士
function c2333.initial_effect(c)

	--disable effect
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_CHAIN_SOLVING)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCondition(c2333.condition)
	e3:SetOperation(c2333.disop)   
	c:RegisterEffect(e3)
		--atkup
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(c2333.val)
	c:RegisterEffect(e1)
		--immune
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_IMMUNE_EFFECT)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(c2333.indcon)
	e2:SetValue(c2333.efilter)
	c:RegisterEffect(e2)
end
function c2333.efilter(e,te)
	return te:GetOwner()~=e:GetOwner()
end
function c2333.indcon(e)
	return Duel.IsExistingMatchingCard(c2333.filter,e:GetHandlerPlayer(),LOCATION_SZONE,0,1,nil)
end

function c2333.condition(e,tp,eg,ep,ev,re,r,rp)
	return re:GetHandler():IsCode(76375976)
end
function c2333.val(e,c)
	return Duel.GetMatchingGroupCount(c2333.filter,c:GetControler(),LOCATION_SZONE,LOCATION_SZONE,e:GetHandler())*400
end
function c2333.filter(c)
	return c:IsFaceup() and c:IsCode(76375976)
end


function c2333.disop(e,tp,eg,ep,ev,re,r,rp)
	local tl=Duel.GetChainInfo(ev,CHAININFO_TRIGGERING_LOCATION)
	if bit.band(tl,LOCATION_SZONE)~=0 and re:IsActiveType(TYPE_SPELL) and re:GetHandler():IsCode(76375976) then
	Duel.NegateEffect(ev)
	end
end