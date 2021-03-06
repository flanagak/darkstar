-----------------------------------------
-- ID: 5648
-- Item: Grilled Lik
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Accuracy +2
-- Attack +8
----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5648)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 4)
    target:addMod(dsp.mod.MND, -3)
    target:addMod(dsp.mod.ACC, 2)
    target:addMod(dsp.mod.ATT, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4)
    target:delMod(dsp.mod.MND, -3)
    target:delMod(dsp.mod.ACC, 2)
    target:delMod(dsp.mod.ATT, 8)
end
