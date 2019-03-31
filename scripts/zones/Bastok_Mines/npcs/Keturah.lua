-----------------------------------
-- Area: Bastok Mines
--  NPC: Phara
-- !zone 234
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Bastok_Mines/IDs")
-----------------------------------

local rewardQty = 3
local maxAugPower = 5
local augItem
local augItemId = 0
local currentAugment = {}
local acceptTrade = false

dsp = dsp or {}

local rewardTitles =
{
    [ 1] = { name = 'Behemoths Bane', id = 9, rewardTier = 'tierOne'},
    [ 2] = { name = 'Cassienova', id = 24, rewardTier = 'tierOne'},
    [ 3] = { name = 'Tortoise Torturer', id = 26, rewardTier = 'tierOne'},
    [ 4] = { name = 'Behemoth Dethroner', id =28 , rewardTier = 'tierTwo'},
    [ 5] = { name = 'The Vivisector', id = 29, rewardTier = 'tierOne'},
    [ 6] = { name = 'Dynamis San dOria Interloper', id = 297, rewardTier = 'tierTwo'},
    [ 7] = { name = 'Dynamis Bastok Interloper', id = 298, rewardTier = 'tierTwo'},
    [ 8] = { name = 'Dynamis Windhurst Interloper', id = 299, rewardTier = 'tierTwo'},
    [ 9] = { name = 'Dynamis Jeuno Interloper', id = 300, rewardTier = 'tierTwo'},
    [10] = { name = 'Dynamis Beaucedine Interloper', id = 301, rewardTier = 'tierTwo'},
    [11] = { name = 'Dynamis Xarcabard Interloper', id = 302, rewardTier = 'tierTwo'},
    [12] = { name = 'Pentacide Perpetrator', id = 309, rewardTier = 'tierOne'}, --Divine Might
    [13] = { name = 'Dynamis Valkrum Interloper', id = 430, rewardTier = 'tierTwo'},
    [14] = { name = 'Dynamis Buburimu Interloper', id = 431, rewardTier = 'tierTwo'},
    [15] = { name = 'Dynamis QUufim Interloper', id = 432, rewardTier = 'tierTwo'},
    [16] = { name = 'Dynamis Tavnazia Interloper', id = 433, rewardTier = 'tierTwo'},
    [17] = { name = 'Confronter of Nightmares', id = 434, rewardTier = 'tierTwo'}, --First Dyna-Tav clear check hiroglyphics
    [18] = { name = 'Adamanking Usurper', id = 448, rewardTier = 'tierOne'},
    [19] = { name = 'Overloard Overthrower', id = 449, rewardTier = 'tierOne'},
    [20] = { name = 'Deity Debunker', id = 450, rewardTier = 'tierOne'},
    [21] = { name = 'Fafnir Slayer', id = 451, rewardTier = 'tierOne'},
    [22] = { name = 'Aspidochelone Sinker', id = 452, rewardTier = 'tierTwo'},
    [23] = { name = 'Nidhogg Slayer', id = 453, rewardTier = 'tierTwo'},
    [24] = { name = 'Kirin Captivator', id = 455, rewardTier = 'tierTwo'},
    [25] = { name = 'Cactrot Desacelerador', id = 456, rewardTier = 'tierOne'}, --cactrot rapido
    [26] = { name = 'Lifter of Shadows', id = 457, rewardTier = 'tierTwo'}, --Dynamis Lord
    [27] = { name = 'Tiamat Trouncer', id = 458, rewardTier = 'tierTwo'},
    [28] = { name = 'Vrtra Vanquisher', id = 459, rewardTier = 'tierTwo'},
    [29] = { name = 'World Serpent Slayer', id = 460, rewardTier = 'tierTwo'},
    [30] = { name = 'Xolotl Xtrapolator', id = 461, rewardTier = 'tierOne'},
    [31] = { name = 'Vinegar Evaporator', id = 464, rewardTier = 'tierOne'},
    [32] = { name = 'Virtuous Saint', id = 465, rewardTier = 'tierTwo'}, --AV
    [33] = { name = 'Temenos Liberator', id = 467, rewardTier = 'tierOne'},
    [34] = { name = 'Apollyon Ravager', id = 468, rewardTier = 'tierOne'},
    [35] = { name = 'Wyrm Astonisher', id = 469, rewardTier = 'tierTwo'}, --Bahamut
    [36] = { name = 'Cerberus Muzzler', id = 471, rewardTier = 'tierOne'},
    [37] = { name = 'Hydra Headhunter', id = 472, rewardTier = 'tierOne'},
    [38] = { name = 'Khimaira Carver', id = 476, rewardTier = 'tierOne'},
    [39] = { name = 'Shining Scale Rifler', id = 473, rewardTier = 'tierOne'},
    [40] = { name = 'Troll Sunjugator', id = 474, rewardTier = 'tierOne'},
    [41] = { name = 'Gorgonstone Sunderer', id = 475, rewardTier = 'tierOne'},
    [42] = { name = 'Genbu Grappler', id = 568, rewardTier = 'tierOne'},
    [43] = { name = 'Suzaku Sunderer', id = 569, rewardTier = 'tierOne'},
    [44] = { name = 'Seiryu Slayer', id = 570, rewardTier = 'tierOne'},
    [45] = { name = 'Byakko Bouncer', id = 571, rewardTier = 'tierOne'},
    [46] = { name = 'Temperance Trouncer', id = 572, rewardTier = 'tierOne'},
    [47] = { name = 'Faith Feller', id = 573, rewardTier = 'tierOne'},
    [48] = { name = 'Fortitude Feller', id = 574, rewardTier = 'tierOne'},
    [49] = { name = 'Prudence Pouncer', id = 575, rewardTier = 'tierTwo'},
    [50] = { name = 'Justice Jailer', id = 711, rewardTier = 'tierTwo'},
    [51] = { name = 'Hope Hexer', id = 712, rewardTier = 'tierTwo'},
    [52] = { name = 'Love Love Love', id = 713, rewardTier = 'tierTwo'},
    [53] = { name = 'Dragon Asher', id = 30, rewardTier = 'tierOne'},
    [54] = { name = 'Sandworm Wrangler', id = 546, rewardTier = 'tierTwo'},
    [55] = { name = 'Ixion Hornbreaker', id = 547, rewardTier = 'tierTwo'},
}

local rewards = 
{
    ['tierOne'] = { id = 8712, name = 'Augment Armor Token'},
    ['tierTwo'] = { id = 8713, name = 'Augment Weapon Token'}
}

local weaponAugmentsMain = { 740, 756, 757, }
local weaponAugmentsRanged = { 746, 764, 765, }
local possibleAugments = 
{
    1, 2, 3, 9, 10, 11, 17, 18, 19, 20, 23, 25, 27, 29, 31, 33, 35, 37, 39, 40, 41, 42, 44, 49, 51, 52, 
    54, 55, 56, 57, 102, 108, 109, 111, 129, 130, 131, 132, 133, 134, 137, 138, 139, 140, 141, 142, 
    143, 144, 145, 146, 147, 148, 153, 194, 195, 198, 211, 215, 286, 288, 289, 290, 291, 292, 293, 
    294, 295, 296, 297, 298, 299, 320, 321, 322, 323, 326, 327, 328, 329, 330, 331, 332, 
    333, 334, 335, 337, 351, 353, 512, 513, 514, 515, 516, 517, 518, 
    796, 968, 969, 970, 971, 972, 973, 974, 975, 1080
}


function onTrade(player,npc,trade)
    local itemId
    for i = 0, trade:getSlotCount()-1 do
        itemId = trade:getItemId(i)

        switch (itemId) : caseof
        {
            [8712] = function(x) --Armor Token
                if i == 0 then
                    augItem = trade:getItem(1);
                else
                    augItem = trade:getItem(0);
                end

                -- If item to be augmented is not a weapon then accept trade
                if not augItem:isType(16) then 
                    acceptTrade = true; 
                end
            end,
            [8713] = function(x) --Weapon Token
                if i == 0 then
                    augItem = trade:getItem(1);
                else
                    augItem = trade:getItem(0);
                end

                if augItem:isType(16) then
                    if augItem:isRanged() then
                        -- Add ranged specific augments to the possible augments list
                        possibleAugments = TableConcat(possibleAugments, weaponAugmentsRanged);
                    else
                        -- If skillType is 0 then we are augmenting a throwing item like a tathlum
                        --  do not add DMG and DELAY mods to the possible augments
                        if augItem:getSkillType() ~= 0 then
                            -- Add main / sub hand specific augments to the possible augments list
                            possibleAugments = TableConcat(possibleAugments, weaponAugmentsMain);
                        end
                    end
                    acceptTrade = true; 
                end
            end,
            [2396] = function(x) --Add Aug Token
                if i == 0 then
                    augItem = trade:getItem(1);
                else
                    augItem = trade:getItem(0);
                end
                if augItem:getAugment(0) ~= 0 then
                    currentAugment = {augItem:getAugment(0)}
                    player:PrintToPlayer(string.format("Augment ID: %i  Augment Power: %i", currentAugment[1], currentAugment[2]), 0x1F);
                end
            end,
        }

        if acceptTrade then
            local randomAugment = 5
            player:tradeComplete();
            randomAugment = math.random(tablelength(possibleAugments))
            player:addItem(augItem:getID(), 1, possibleAugments[randomAugment], math.random(maxAugPower));
            player:PrintToPlayer("Wham!!..Bam!!... and here you go.", 0x1C);
            player:messageSpecial(ID.text.ITEM_OBTAINED, augItem:getID());
        end
    end
end;

function onTrigger(player)
    for k, v in pairs(rewardTitles) do
        if (player:hasTitle(v.id)) then
            if v.rewardTier == 'tierOne' then
                rewardQty = rewardQty * 2
            end
            player:addItem(rewards[v.rewardTier].id, rewardQty)
            player:delTitle(v.id);
            player:PrintToPlayer(string.format("Removing title:  [ %s ]", v.name), 0xE);
        else
	    player:PrintToPlayer(string.format("Tier: [%s]  Title:  [ %s ]", string.sub(v.rewardTier, 5), v.name), 0x15);
        end
    end
end;

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end;

function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end;