-----------------------------------
-- Area: Bastok Markets
--  NPC: Synergy Furnace
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/common")
require("scripts/globals/npc_util")

local elementalGorgetObi =
{
    [  1] = {trade = {15495, 15496, 15497, 15498, 15499, 15500, 15501, 15502}, reward = 27510}, -- Fotia Gorget
    [  2] = {trade = {15435, 15436, 15437, 15438, 15439, 15440, 15441, 15442}, reward = 28419}, -- Hachirin-no-Obi
}

function onTrigger(player,npc)
end

function onTrade(player,npc,trade)
    for k, v in pairs(elementalGorgetObi) do
            if npcUtil.tradeHasExactly(trade, v.trade) then
                player:tradeComplete();
                player:addItem(v.reward);
                player:PrintToPlayer("A little of this... and a little of that... and here you go.", 0x1C);
                player:messageSpecial(ID.text.ITEM_OBTAINED, v.reward);
            end
        end
end;