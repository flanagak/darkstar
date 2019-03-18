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
        18992, 10, -- Glanzfaust
        18996, 10, -- Vajra
        18997, 10, -- Burtgang
        18995, 10, -- Murgleis
        18999, 10, -- Aymur
        18991, 10, -- Conqueror
        18998, 10, -- Liberator
        19004, 10, -- Ryunohige
        19003, 10, -- Nagi
        19002, 10, -- Kogarasumaru
        18993, 10, -- Yagrush
        18994, 10, -- Laevateinn
        19001, 10, -- Gastraphetes
        19000, 10, -- Carnwenhan
        19005, 10, -- Nirvana
    }

    player:showText(npc, ID.text.GALDEO_OPEN_DIALOG)
    dsp.shop.general(player, stock, -1)
end
