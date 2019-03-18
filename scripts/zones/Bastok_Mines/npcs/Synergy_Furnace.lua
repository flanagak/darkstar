-----------------------------------
-- Area: Bastok Markets
--  NPC: Synergy Engineer
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrigger(player,npc)
    local stock =
    {
        19006, 10, -- Tizona 
        19007, 10, -- Death Penalty 
        19008, 10, -- Kenkonken 
        18989, 10, -- Terpsichore 
        18990, 10, -- Tupsimati 
    --  Einherjar Items
        17857, 100000, -- Animator +1 
        16228, 100000, -- Aslan Cape 
        16229, 100000, -- Gleeman's Cape 
        16267, 100000, -- Ritter Gorget 
        16268, 100000, -- Kubira Bead Necklace 
        16269, 100000, -- Morgana's Choker 
        15911, 100000, -- Buccaneer's Belt 
        15799, 100000, -- Iota Ring 
        15800, 100000, -- Omega Ring 
        15990, 100000, -- Delta Earring 
    }

    player:showText(npc, ID.text.GALDEO_OPEN_DIALOG)
    dsp.shop.general(player, stock, -1)
end
