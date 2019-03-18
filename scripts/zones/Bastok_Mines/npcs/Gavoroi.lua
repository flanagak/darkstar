-----------------------------------
-- Area: Bastok Markets
--  NPC: Gavoroi
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/shop")

function onTrigger(player,npc)
    local stock =
    {
        1904, 8000, -- Ivory Chip
        1905, 8000, -- Scarlet Chip
        1906, 8000, -- Emerald Chip
        1907, 8000, -- Silver Chip
        1908, 8000, -- Cerulean Chip
        1909, 8000, -- Smalt Chip
        1910, 8000, -- Smoky Chip
        1986, 8000, -- Orchid Chip
        1987, 8000, -- Charcoal Chip
        1988, 8000, -- Magenta Chip
        2127, 8000, -- Metal Chip
    }

    player:showText(npc, ID.text.GALDEO_OPEN_DIALOG)
    dsp.shop.general(player, stock, -1)
end
