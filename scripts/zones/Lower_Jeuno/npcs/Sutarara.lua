-----------------------------------
-- Area: Lower Jeuno
--  NPC: Sutarara
-- Involved in Quests: Tenshodo Menbership (before accepting)
-- !pos 30 0.1 -2 245
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TenshodoMembership = player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP);
    local WildcatJeuno = player:getVar("WildcatJeuno");

    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,10) == false) then
        player:startEvent(10055);
    elseif (TenshodoMembership ~= QUEST_COMPLETED) then
        player:startEvent(208);
    elseif (TenshodoMembership == QUEST_COMPLETED) then
        player:startEvent(211);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10055) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",10,true);
    end
end;