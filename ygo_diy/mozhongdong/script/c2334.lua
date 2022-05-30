--魔钟洞的魔石
function c2334.initial_effect(c)
		--Activate
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_ACTIVATE)
	e2:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e2)

	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON+CATEGORY_TOKEN)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_SZONE)
	e1:SetCountLimit(1)
	e1:SetTarget(c2334.sptg)
	e1:SetCondition(c2334.negcon)
	e1:SetOperation(c2334.spop)   
	c:RegisterEffect(e1)
end
function c2334.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end   
	Duel.SetOperationInfo(0,CATEGORY_TOKEN,nil,1,0,0)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,0,0)
end
function c2334.cfilter(c)
	return c:IsFaceup() and c:IsCode(76375976)
end
function c2334.negcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(c2334.cfilter,tp,LOCATION_SZONE,0,1,nil)	end
function c2334.spop(e,tp,eg,ep,ev,re,r,rp,c)
	
		local token=Duel.CreateToken(tp,2335)
		Duel.SpecialSummonStep(token,0,tp,1-tp,false,false,POS_FACEUP_ATTACK)
	
	Duel.SpecialSummonComplete()
end
