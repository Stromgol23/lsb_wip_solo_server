
nttrusts = nttrusts or {}
nttrusts.ranger = {}

rngItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [28] = 16755, -- archers knife
        [23] = 16451, -- mythril dagger
        [13] = 16466, -- knife
        [9] = 16449, -- brass dagger
        [1] = 16448  -- bronze dagger
    },

    [nttrusts.SlotType.SUB] = {
        
    },

    [nttrusts.SlotType.RANGED] = {
        [70] = 17205, -- gendawa
        [50] = 17164, -- war bow
        [40] = 17163, -- battle bow
        [30] = 17162, -- great bow
        [24] = 17154, -- wrapped bow
        [16] = 17161, -- power bow
        [7] = 17153, -- self bow
        [1] = 17152 -- shortbow
    },

    [nttrusts.SlotType.AMMO] = {
        [60] = 18159, -- demon arrow
        [40] = 18155, -- scorpion arrow
        [29] = 18156, -- horn arrow
        [15] = 17332, -- fang arrow
        [7] = 17319, -- bone arrow
        [1] = 17330 -- stone arrow
    },

    [nttrusts.SlotType.HEAD] = {
        [70] = 12469, -- war beret
        [54] = 12518, -- hunters beret
        [30] = 15161, -- noct beret
        [17] = 12441, -- lizard helm
        [7] = 12440, -- leather bandana
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [58] = 12648, -- hunters jerkin
        [45] = 13703, -- brigandine
        [30] = 14422, -- noct doublet
        [17] = 12569, -- lizard jerkin
        [7] = 12568, -- leather vest
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [52] = 13971, -- hunters bracers
        [30] = 14854, -- noct gloves
        [17] = 12697, -- lizard gloves
        [7] = 12696, -- leather gloves
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [70] = 12853, -- war brais
        [56] = 14224, -- hunters braccae
        [30] = 14323, -- noct brais
        [17] = 12825, -- lizard trousers
        [7]  = 12824, -- leather trousers
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [70] = 12981, -- war boots
        [60] = 14099, -- hunters socks
        [30] = 15311, -- noct gaiters
        [17] = 12953, -- lizard ledelsens
        [7]  = 12952, -- leather highboots
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [14] = 13117, -- rangers necklace
        [7] = 13081 -- leather gorget
    },

    [nttrusts.SlotType.WAIST] = {
        [53] = 13248, -- flagellants rope
        [32] = 13196, -- silver belt
        [17] = 13193, -- lizard belt
        [7] = 13192 -- leather belt
    },

    [nttrusts.SlotType.EAR1] = {
        [67] = 13407, -- nimble earring
        [49] = 13350, -- moon earring
        [31] = 13317, -- pearl earring
        [10] = 13337  -- opal earring
    },

    [nttrusts.SlotType.EAR2] = {
        [67] = 13407, -- nimble earring
        [49] = 13350, -- moon earring
        [31] = 13317, -- pearl earring
        [10] = 13337  -- opal earring
    },

    [nttrusts.SlotType.RING1] = {
        [70] = 13455, -- coral ring
        [55] = 13458, -- scorpion ring
        [45] = 13461, -- carapace ring
        [35] = 13459, -- horn ring
        [21] = 13457, -- beetle ring
        [16] = 13441, -- bone ring
    },

    [nttrusts.SlotType.RING2] = {
        [70] = 13455, -- coral ring
        [55] = 13458, -- scorpion ring
        [45] = 13461, -- carapace ring
        [35] = 13459, -- horn ring
        [21] = 13457, -- beetle ring
        [16] = 13441, -- bone ring
    },

    [nttrusts.SlotType.BACK] = {
        [61] = 13645, -- amemet mantle
        [48] = 13593, -- raptor mantle
        [36] = 13570, -- ram mantle
        [18] = 13588, -- dhalmet mantle
        [4] = 13594, -- rabbit mantle
    }
}

local function setupAI(trust)
    local lvl = trust:getMainLvl()

    if lvl >= 45 then
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.VELOCITY_SHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.VELOCITY_SHOT)
    end

    trust:addGambit(ai.t.TARGET, ai.c.SC_AVAILABLE, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHARPSHOT)
    trust:addGambit(ai.t.TARGET, ai.c.WS_CLOSER, 0, ai.r.WS, ai.s.HIGHEST, 3000)

    if lvl >= 30 then
        trust:addGambit(ai.t.SELF, ai.c.STATUS, xi.effect.SHARPSHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.BARRAGE)
    end

    trust:addGambit(ai.t.TARGET, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.RATTACK, 0, 0)

    -- need to move behind the target

    trust:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.LONG_RANGE)
    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000)
end

function nttrusts.ranger.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.MITHRA
    local items = {} 

    if params ~= nil then
        if params.race ~= nil and params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, rngItemLists)

    local trust = nttrusts.spawntrust(player, 23011, race, items)

    setupAI(trust)
end

return nttrusts
