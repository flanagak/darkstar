-----------------------------------
-- Area: Bastok Markets
--  NPC: Synergy Engineer
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")

function onTrigger(player,npc)

    for i = 1,48
    do
        player:PrintToPlayer(string.format("Unlocking Weaponskill ID: %s", i), 0xF);
        player:addLearnedWeaponskill(i)
    end 
end
