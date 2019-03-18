-----------------------------------
-- Area: Bastok Markets
--  NPC: Gerahja
-- Standard Merchant NPC
-- !pos -80.500 0.000 -83.000 235
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")

local ApollyonItems =
{
    [ 1] = 1931, -- WAR
    [ 2] = 1933, -- MNK
    [ 3] = 1935, -- WHM
    [ 4] = 1937, -- BLM
    [ 5] = 1939, -- RDM
    [ 6] = 1941, -- THF
    [ 7] = 1943, -- PLD
    [ 8] = 1945, -- DRK
    [ 9] = 1947, -- BST
    [10] = 1949, -- BRD
    [11] = 1951, -- RNG
    [12] = 1953, -- SAM
    [13] = 1955, -- NIN
    [14] = 1957, -- DRG
    [15] = 1959, -- SMN
    [16] = 2657, -- BLU
    [17] = 2659, -- COR
    [18] = 2661, -- PUP
    [19] = 2715, -- DNC
    [20] = 2717, -- SCH
}

local TemenosItems =
{
    [ 1] = 1930, -- WAR
    [ 2] = 1932, -- MNK
    [ 3] = 1934, -- WHM
    [ 4] = 1936, -- BLM
    [ 5] = 1938, -- RDM
    [ 6] = 1940, -- THF
    [ 7] = 1942, -- PLD
    [ 8] = 1944, -- DRK
    [ 9] = 1946, -- BST
    [10] = 1948, -- BRD
    [11] = 1950, -- RNG
    [12] = 1952, -- SAM
    [13] = 1954, -- NIN
    [14] = 1956, -- DRG
    [15] = 1958, -- SMN
    [16] = 2656, -- BLU
    [17] = 2658, -- COR
    [18] = 2660, -- PUP
    [19] = 2714, -- DNC
    [20] = 2716, -- SCH
}

function onTrigger(player,npc)
    player:PrintToPlayer("Welcome to the Limbus Shop. Trade 20 coins for Apollyon item and 25 coins for Temenos item for current job.", 0xF);
end

function onTrade(player,npc,trade)
    local job = player:getMainJob()

    if trade:hasItemQty(1875, 20) then
        -- Give Apollyon Item
        player:addItem(ApollyonItems[job])
        player:tradeComplete()
        player:messageSpecial(ID.text.ITEM_OBTAINED, ApollyonItems[job])
    elseif trade:hasItemQty(1875, 25) then
        -- Give Temenos Item
        player:addItem(TemenosItems[job])
        player:tradeComplete()
        player:messageSpecial(ID.text.ITEM_OBTAINED, TemenosItems[job])
    end
end
