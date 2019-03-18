-----------------------------------
--
-- dsp.effect.ACCURACY_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,effect:getPower())
    target:addMod(dsp.mod.RACC, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local boostACC_effect_size = effect:getPower()
    if (boostACC_effect_size > 0) then
        target:delMod(dsp.mod.ACC,effect:getPower())
        target:addMod(dsp.mod.RACC, effect:getPower())
    end
end
