cmdprops =
{
    permission = 1,
    parameters = ""
};

dsp = dsp or {}
dsp.npcbuff = 
{
    --------------------------------------
    --    BUFF: Flurry
    --------------------------------------
    [1] =
    {
        ['buffId'] = 265,
        ['buffPower'] = 
        {
            [1] = 10,
            [2] = 15,
            [3] = 20,
            [4] = 30,
            [5] = 46,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Haste
    --------------------------------------
    [2] =
    {
        ['buffId'] = 33,
        ['buffPower'] = 
        {
            [1] = 1000,
            [2] = 1500,
            [3] = 2000,
            [4] = 3000,
            [5] = 4575,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Protect
    --------------------------------------
    [3] =
    {
        ['buffId'] = 40,
        ['buffPower'] = 
        {
            [1] = 15,
            [2] = 40,
            [3] = 75,
            [4] = 120,
            [5] = 195,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Shell
    --------------------------------------
    [4] =
    {
        ['buffId'] = 41,
        ['buffPower'] = 
        {
            [1] = 9,
            [2] = 14,
            [3] = 19,
            [4] = 22,
            [5] = 28,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Regen
    --------------------------------------
    [5] =
    {
        ['buffId'] = 42,
        ['buffPower'] = 
        {
            [1] = 3,
            [2] = 6,
            [3] = 12,
            [4] = 16,
            [5] = 20,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Refresh
    --------------------------------------
    [6] =
    {
        ['buffId'] = 43,
        ['buffPower'] = 
        {
            [1] = 1,
            [2] = 3,
            [3] = 6,
            [4] = 8,
            [5] = 10,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Accuracy Boost
    --------------------------------------
    [7] =
    {
        ['buffId'] = 90,
        ['buffPower'] = 
        {
            [1] = 19,
            [2] = 28,
            [3] = 57,
            [4] = 102,
            [5] = 189,
        },
        ['buffDuration'] = 7200,
    },
    ------
    --------------------------------------
    --    BUFF: Attack Boost
    --------------------------------------
    [8] =
    {
        ['buffId'] = 91,
        ['buffPower'] = 
        {
            [1] = 26,
            [2] = 42,
            [3] = 72,
            [4] = 99,
            [5] = 291,
        },
        ['buffDuration'] = 7200,
    },
    ------
}

function onTrigger(player)
    local mLvl = 75
    local buffLvl = 1

    if mLvl <= 19 then
        buffLvl = 1
    elseif mLvl <=39 then
        buffLvl = 2
    elseif mLvl <=59 then
        buffLvl = 3
    elseif mLvl <=74 then
        buffLvl = 4
    elseif mLvl >= 75 then
        buffLvl = 5
    end

   for i = 1,8
    do
        player:addStatusEffect(dsp.npcbuff[i].buffId, dsp.npcbuff[i].buffPower[buffLvl], 3, dsp.npcbuff[i].buffDuration, 0, 0)
        --player:messagePublic(280, player, dsp.npcbuff[i].buffId, dsp.npcbuff[i].buffId);
    end

    player:addStatusEffect(249,150,0,43200,0,30000) 

    if mLvl <= 19 then
        player:PrintToPlayer("Level 1 buffs applied.  Next buff tier at level 20", 0xF);
    elseif mLvl <=39 then
        player:PrintToPlayer("Level 2 buffs applied.  Next buff tier at level 40", 0xF);
    elseif mLvl <=59 then
        player:PrintToPlayer("Level 3 buffs applied.  Next buff tier at level 60", 0xF);
    elseif mLvl <=74 then
        player:PrintToPlayer("Level 4 buffs applied.  Next buff tier at level 75", 0xF);
    elseif mLvl >= 75 then
        player:PrintToPlayer("Max level buffs applied", 0xF);
    end
 end
