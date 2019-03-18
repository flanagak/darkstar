-----------------------------------
-- Area: Bastok Markets
--  NPC: Synergy Enthusiast
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrigger(player,npc)
    local stock =
    {
        18264, 10, -- Spharai
        18270, 10, -- Mandau
        18276, 10, -- Excalibur
        18282, 10, -- Ragnarok
        18288, 10, -- Guttler
        18294, 10, -- Bravura
        18306, 10, -- Apocalypse
        18300, 10, -- Gungnir
        18312, 10, -- Kikoku
        18318, 10, -- Amanomurakumo
        18324, 10, -- Mjollnir
        18330, 10, -- Claustrum
        18348, 10, -- Yoichinoyumi
        18336, 10, -- Annihilator
        18342, 10, -- Gjallarhorn
        15070, 10, -- Aegis
    }

    player:showText(npc, ID.text.GALDEO_OPEN_DIALOG)
    dsp.shop.general(player, stock, -1)
end
