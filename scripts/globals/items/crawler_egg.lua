-----------------------------------------
-- ID: 4357
-- Item: crawler_egg
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health 10
-- Magic 10
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4357)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 10)
    target:addMod(dsp.mod.MP, 10)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 10)
    target:delMod(dsp.mod.MP, 10)
end
