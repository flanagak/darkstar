-----------------------------------
--
-- dsp.effect.ATTACK_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATTP,effect:getPower())
    target:addMod(dsp.mod.RATT, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP,effect:getPower())
    target:delMod(dsp.mod.RATT, effect:getPower())
end