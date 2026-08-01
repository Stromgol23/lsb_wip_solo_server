
nttrusts = nttrusts or {}
nttrusts.paladin = {}

-- add in reverse order
pldItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [71] = 16579, -- kashkara
        [66] = 16578, -- espadon
        [60] = 16577, -- bastard sword
        [47] = 16567, -- knights sword
        [38] = 16549, -- divine sword
        [30] = xi.item.BROADSWORD,
        [18] = xi.item.LONGSWORD,
        [9] = xi.item.SPATHA,
        [1] = xi.item.BRONZE_SWORD
    },

    [nttrusts.SlotType.SUB] = {
        [73] = 12387, -- koenig shield
        [71] = 12309, -- ritter shield
        [60] = 12308, -- darksteel shield,
        [43] = 12307, -- HEATER_SHIELD,
        [28] = xi.item.KITE_SHIELD,
        [20] = 12292, -- MAHOGANY_SHIELD,
        [8] = xi.item.MAPLE_SHIELD,
        [1] = xi.item.LAUAN_SHIELD
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [73] = 12420, -- adaman barbuta
        [70] = 15189, -- lords armet
        [60] = 12418, -- gold armet
        [49] = 12417, -- mythril sallet
        [40] = 12416, -- Sallet
        [29] = 15167, -- Eisenchaller
        [24] = xi.item.IRON_MASK,
        [10] = xi.item.FACEGUARD,
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [73] = 12548, -- adaman cuirass
        [70] = 13757, -- lords cuirass
        [60] = 12546, -- gold cuirass
        [49] = 12545, -- mythril breastplate
        [40] = 12544, -- breastplate
        [29] = 14431, -- eisenbrust
        [24] = 12552, -- chainmail
        [10] = 12560, -- scale mail
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [73] = 12676, -- adaman gauntlets
        [70] = 14879, -- lords gauntlets
        [60] = 12674, -- gold gauntlets
        [49] = 12673, -- mythril gauntlets
        [40] = 12672, -- gauntlets
        [29] = 14860, -- eisenhentzes
        [24] = 12680, -- chain mittens
        [10] = 12688, -- scale finger gauntlets
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [73] = 12804, -- adaman cuisses
        [70] = 15395, -- lords cuisses
        [60] = 12802, -- gold cuisses
        [49] = 12801, -- mythril cuisses
        [40] = 12800, -- cuisses
        [29] = 14329, -- eisendiechlings
        [24] = 12808, -- chain hoses
        [10] = 12816, -- scale cuisses
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [73] = 12932, -- adaman sabatons
        [70] = 15333, -- lords sabatons
        [60] = 12930, -- gold sabatons
        [49] = 12929, -- mythril leggings
        [40] = 12928, -- plate leggings
        [29] = 15317, -- eisenschuhs
        [24] = 12936, -- greaves
        [10] = 12944, -- scale greaves
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [67] = 13079, -- darksteel gorget
        [49] = 13084, -- mythril gorget
        [40] = 13080, -- gorget
        [24] = 13082, -- chain gorget
        [7] = 13081 -- leather gorget
    },

    [nttrusts.SlotType.WAIST] = {
        [71] = 15890, -- marid belt
        [15] = 13194, -- warriors belt
        [7] = 13192 -- leather belt
    },

    [nttrusts.SlotType.EAR1] = {
        [67] = 13412, -- robust earring
        [60] = 13316, -- platinum earring
        [45] = 13315, -- gold earring
        [24] = 13328, -- mythril earring
        [10] = 13380  -- hope earring
    },

    [nttrusts.SlotType.EAR2] = {
        [67] = 13412, -- robust earring
        [60] = 13316, -- platinum earring
        [45] = 13315, -- gold earring
        [24] = 13328, -- mythril earring
        [10] = 13380  -- hope earring
    },

    [nttrusts.SlotType.RING1] = {
        [72] = 13453, -- topaz ring
        [54] = 13489, -- Chrysoberyl ring
        [36] = 13481, -- sphene ring
        [14] = 13473, -- amber ring
    },

    [nttrusts.SlotType.RING2] = {
        [72] = 13453, -- topaz ring
        [54] = 13489, -- Chrysoberyl ring
        [36] = 13481, -- sphene ring
        [14] = 13473, -- amber ring
    },

    [nttrusts.SlotType.BACK] = {
        [58] = 13597, -- beak mantle
        [48] = 13593, -- raptor mantle
        [36] = 13570, -- ram mantle
        [18] = 13588, -- dhalmet mantle
        [4] = 13594, -- rabbit mantle
    }
}

local function setupAI(trust)
    local lvl = trust:getMainLvl()

    if lvl >= 10 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    if lvl >= 15 then
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    end

    if lvl >= 30 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    end

    if lvl >= 62 then
        local rampartC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART}}
        trust:addGambit(rampartC, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPACT)   
    end

    if lvl >= 70 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MAJESTY, ai.r.JA, ai.s.SPECIFIC, xi.ja.MAJESTY)
    end

    local wsC = {{ai.t.SELF, ai.c.WS_ASAP, 0}, {ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0}}
    trust:addGambit(wsC, ai.r.WS, ai.s.RANDOM, 0)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECT)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELL)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.REPRISAL, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.REPRISAL)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENMITY_BOOST, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CRUSADE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENLIGHT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ENLIGHT)

    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 1500)
end

function nttrusts.paladin.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.ELVAAN_M
    local items = nttrusts.getItems(level, pldItemLists)

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
    end

    local trust = nttrusts.spawntrust(player, 23007, race, items)

    setupAI(trust)
end

return nttrusts