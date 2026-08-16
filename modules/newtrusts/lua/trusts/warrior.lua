
nttrusts = nttrusts or {}
nttrusts.warrior = {}

warDpsItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 18223, -- Toporok
        [64] = 16730, -- colossal axe
        [55] = 18226, -- darksteel voulge
        [44] = 18207, -- kheten
        [31] = 18214, -- voulge
        [12] = 16705, -- greataxe
        [5] = 16704, -- butterfly axe
        [1] = 16640  -- bronze axe
    },

    [nttrusts.SlotType.SUB] = {
        [65] = 19019, -- platinum grip
        [55] = 19013, -- mythril grip
        [30] = 19009, -- brass grip
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [68] = 12428, -- celata
        [59] = 11495, -- zeal cap
        [56] = 12511, -- fighters mask
        [49] = 12417, -- mythril sallet
        [40] = 12416, -- Sallet
        [29] = 15167, -- Eisenchaller
        [24] = xi.item.IRON_MASK,
        [10] = xi.item.FACEGUARD,
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [57] = 12579, -- scorpion harness
        [45] = 13703, -- brigandine
        [40] = 12544, -- breastplate
        [29] = 14431, -- eisenbrust
        [24] = 12552, -- chainmail
        [10] = 12560, -- scale mail
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [68] = 12684, -- thick mufflers
        [54] = 13961, -- fighters mufflers
        [49] = 12673, -- mythril gauntlets
        [40] = 12672, -- gauntlets
        [29] = 14860, -- eisenhentzes
        [24] = 12680, -- chain mittens
        [10] = 12688, -- scale finger gauntlets
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [69] = 12812, -- thick breeches
        [58] = 14214, -- fighters cuisses
        [49] = 12801, -- mythril cuisses
        [40] = 12800, -- cuisses
        [29] = 14329, -- eisendiechlings
        [24] = 12808, -- chain hoses
        [10] = 12816, -- scale cuisses
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [68] = 12940, -- thick sollerets
        [52] = 14089, -- fighters calligae
        [49] = 12929, -- mythril leggings
        [40] = 12928, -- plate leggings
        [29] = 15317, -- eisenschuhs
        [24] = 12936, -- greaves
        [10] = 12944, -- scale greaves
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [21] = 13076, -- fang necklace
        [9] = 16296 -- armigers lace
    },

    [nttrusts.SlotType.WAIST] = {
        [48] = 13231, -- life belt
        [43] = 13198, -- sword belt
        [32] = 13196, -- silver belt
        [17] = 13193, -- lizard belt
        [7] = 13192 -- leather belt
    },

    [nttrusts.SlotType.EAR1] = {
        [63] = 13312, -- coral earring
        [55] = 13325, -- fang earring
        [45] = 13324, -- tortoise earring
        [21] = 13323, -- beetle earring
        [16] = 13321, -- bone earring
        [10] = 13380  -- hope earring
    },

    [nttrusts.SlotType.EAR2] = {
        [63] = 13312, -- coral earring
        [55] = 13325, -- fang earring
        [45] = 13324, -- tortoise earring
        [21] = 13323, -- beetle earring
        [16] = 13321, -- bone earring
        [10] = 13380  -- hope earring
    },

    [nttrusts.SlotType.RING1] = {
        [72] = 13449, -- ruby ring
        [54] = 13485, -- sun ring
        [36] = 13477, -- garnet ring
        [14] = 13444, -- sardonyx ring
    },

    [nttrusts.SlotType.RING2] = {
        [72] = 13449, -- ruby ring
        [54] = 13485, -- sun ring
        [36] = 13477, -- garnet ring
        [14] = 13444, -- sardonyx ring
    },

    [nttrusts.SlotType.BACK] = {
        [51] = 11532, -- accura cape
        [48] = 13593, -- raptor mantle
        [36] = 13570, -- ram mantle
        [18] = 13588, -- dhalmet mantle
        [4] = 13594, -- rabbit mantle
    }
}

-- ///////////////////////////////////////////

warTankItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [71] = 16659, -- Tabarzin
        [68] = 16653, -- Nadziak
        [62] = 16652, -- darksteel pick
        [56] = 16645, -- darksteel axe
        [50] = 16651, -- mythril pick
        [37] = 16644, -- mythril axe
        [20] = 16643, -- battleaxe
        [8] = 16641, -- brass axe
        [1] = 16640  -- bronze axe
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
        [60] = 12418, -- gold armet
        [49] = 12417, -- mythril sallet
        [40] = 12416, -- Sallet
        [29] = 15167, -- Eisenchaller
        [24] = xi.item.IRON_MASK,
        [10] = xi.item.FACEGUARD,
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [60] = 12638, -- fighters lorica
        [49] = 12545, -- mythril breastplate
        [40] = 12544, -- breastplate
        [29] = 14431, -- eisenbrust
        [24] = 12552, -- chainmail
        [10] = 12560, -- scale mail
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [73] = 12676, -- adaman gauntlets
        [54] = 13961, -- fighters mufflers
        [49] = 12673, -- mythril gauntlets
        [40] = 12672, -- gauntlets
        [29] = 14860, -- eisenhentzes
        [24] = 12680, -- chain mittens
        [10] = 12688, -- scale finger gauntlets
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [73] = 12804, -- adaman cuisses
        [58] = 14214, -- fighters cuisses
        [49] = 12801, -- mythril cuisses
        [40] = 12800, -- cuisses
        [29] = 14329, -- eisendiechlings
        [24] = 12808, -- chain hoses
        [10] = 12816, -- scale cuisses
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [73] = 12932, -- adaman sabatons
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

local function setupDpsAI(trust)
    local lvl = trust:getMainLvl()

    if lvl >= 15 then
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    end

    if lvl >= 45 then
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.AGGRESSOR, ai.r.JA, ai.s.SPECIFIC, xi.ja.AGGRESSOR)
    end

    if lvl >= 35 then
        local warcryC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.WARCRY}, {ai.t.TARGET, ai.c.WS_CLOSER, 0}}
        trust:addGambit(warcryC, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)
    end
    trust:addGambit(ai.t.TARGET, ai.c.WS_CLOSER, 1500, ai.r.WS, ai.s.HIGHEST, 0)


    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 1500)
end

local function setupTankAI(trust)
    local lvl = trust:getMainLvl()
    if lvl >= 5 then
        trust:addGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    end

    if lvl >= 25 then
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DEFENDER, ai.r.JA, ai.s.SPECIFIC, xi.ja.DEFENDER)
    end

    if lvl >= 60 then
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RETALIATION, ai.r.JA, ai.s.SPECIFIC, xi.ja.RETALIATION)
    end

    local wsC = {{ai.t.SELF, ai.c.WS_ASAP, 0}, {ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0}}
    trust:addGambit(wsC, ai.r.WS, ai.s.RANDOM, 0)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 1500)
end

function nttrusts.warrior.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.HUME_M
    local items = {} 
    local isTank = false

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
        if params.role == Role.TANK then
            isTank = true
        end
    end

    if isTank == true then
        items = nttrusts.getItems(level, warTankItemLists)
    else
        items = nttrusts.getItems(level, warDpsItemLists)
    end

    local trust = nttrusts.spawntrust(player, 23001, race, items)

    if isTank == true then
        setupTankAI(trust)
    else
        setupDpsAI(trust)
    end
end

return nttrusts
