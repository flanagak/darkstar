-----------------------------------
-- Area: Bastok Markets
--  NPC: Specilox
-- Standard Merchant NPC
-- !pos -185.500 -8.000 -24.500 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player,npc)
    local stock =
    {
        1042, 10000, -- A key that opens a treasure coffer in Davoi.
        1043, 10000, -- A key that opens a treasure coffer in Beadeaux
        1044, 10000, -- A key that opens a treasure coffer in Castle Oztroja.
        1045, 10000, -- A key that opens a treasure coffer in the Crawlers' Nest.
        1046, 10000, -- A key that opens a treasure coffer in the Eldieme Necropolis.
        1047, 10000, -- A key that opens a treasure coffer in the Garlaige Citadel.
        1048, 10000, -- A key that opens a treasure coffer in Castle Zvahl.
        1049, 10000, -- A key that opens a treasure coffer in the Temple of Uggalepih.
        1050, 10000, -- A key that opens a treasure coffer in the Rancor Den.
        1051, 10000, -- A key that opens a treasure coffer in the Kuftal Tunnel.
        1052, 10000, -- A key that opens a treasure chest in the Boyahda Tree area.
        1053, 10000, -- A key that opens a treasure chest in the Ifrit's Cauldron area.
        1054, 10000, -- A key that opens a treasure chest in the Quicksand Caves.
        1057, 10000, -- A key that opens a treasure chest in the Toraimarai Canal.
        1059, 10000, -- A key that opens a treasure coffer in the Sea Serpent Grotto.
        1063, 10000, -- A key that opens a treasure coffer in Newton Movalpolos.
    }

    player:showText(npc, ID.text.PERITRAGE_SHOP_DIALOG)
    dsp.shop.general(player, stock, -1)
end
