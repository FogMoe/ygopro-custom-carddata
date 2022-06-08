local m=95500
local cm=_G["c"..m]
cm.name="机械化 里奥勒斯龙"
function cm.initial_effect(c)
		--special summon rule
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetRange(LOCATION_HAND)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_SPSUM_PARAM)
	e1:SetTargetRange(POS_FACEUP,1)
	e1:SetCondition(cm.spcon)
	e1:SetOperation(cm.spop)
	c:RegisterEffect(e1)
end
function cm.spfilter(c)
	return c:IsSetCard(0x9901) and c:IsAbleToGrave() and c:IsType(TYPE_MONSTER)
end
function cm.spcon(e,c,tp)
	if c==nil then return true end
	return Duel.IsExistingMatchingCard(cm.spfilter,tp,LOCATION_HAND,0,1,nil) and Duel.GetLocationCount(1-tp,LOCATION_MZONE)>0
end
function cm.spop(e,tp,eg,ep,ev,re,r,rp,c)
	if Duel.BreakEffect() then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
		local g=Duel.SelectMatchingCard(tp,cm.spfilter,tp,LOCATION_HAND,0,1,1,nil)
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end
