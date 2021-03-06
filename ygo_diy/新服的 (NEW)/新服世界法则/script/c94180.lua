local m=94180
local cm=_G["c"..m]
cm.name="逆转炼成阵"
function cm.initial_effect(c)
	aux.AddCodeList(c,94020)
		--change effect
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_ACTIVATE)
	e2:SetCode(EVENT_CHAINING)
	e2:SetCountLimit(1,m+EFFECT_COUNT_CODE_OATH)
	e2:SetCondition(cm.chcon)
	e2:SetTarget(cm.chtg)
	e2:SetOperation(cm.chop)
	c:RegisterEffect(e2)
end
function cm.allneedfilter(c)
	return c:IsFaceup() and c:IsCode(94020)
end
function cm.cfilter(c)
	return c:IsSetCard(0x9401) and not c:IsStatus(STATUS_BATTLE_DESTROYED)
end
function cm.chcon(e,tp,eg,ep,ev,re,r,rp)
	return re:IsActiveType(TYPE_SPELL+TYPE_TRAP) and rp==1-tp and 
	Duel.IsExistingMatchingCard(cm.allneedfilter,tp,LOCATION_ONFIELD,0,1,nil)
end
function cm.chtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.CheckReleaseGroupEx(tp,cm.cfilter,1,nil) end
end
function cm.chop(e,tp,eg,ep,ev,re,r,rp)
	local g=Group.CreateGroup()
	Duel.ChangeTargetCard(ev,g)
	Duel.ChangeChainOperation(ev,cm.repop)
end
function cm.repop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectReleaseGroupEx(1-tp,cm.cfilter,1,1,nil)
	Duel.Release(g,REASON_EFFECT)
end