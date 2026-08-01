
nttrusts = nttrusts or {}
nttrusts.monk = {}

mnkDpsItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [71] = 16395, -- diamond knuckles
        [61] = 16401, -- jamadhars
        [52] = 16389, -- coeurl cesti
        [42] = 17478, -- beat cesti
        [30] = 16411, -- claws
        [24] = 16406, -- baghnakhs
        [12] = 16386, -- lizard cesti
        [1] = 16385  -- cesti
    },

    [nttrusts.SlotType.SUB] = {
        
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [59] = 11495, -- zeal cap
        [56] = 12512, -- temple crown
        [49] = 12460, -- shinomi hachimaki
        [29] = 12458, -- soil hachimaki
        [18] = 12457, -- cotton hachimaki
        [8] = 12456,  -- hachimaki
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [57] = 12579, -- scorpion harness
        [40] = 13728, -- jujitsu gi
        [36] = 12594, -- gambison
        [29] = 12586, -- soil gi
        [13] = 12590, -- power gi
        [8] = 12584,  -- kenpogi
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [54] = 13962, -- temple gloves
        [49] = 12716, -- shinobi tekko
        [36] = 12722, -- bracers
        [29] = 12714, -- soil tekko
        [18] = 12713, -- cotton tekko
        [8] = 12712, -- tekko
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [53] = 14254, -- masters sitabaki
        [37] = 12923, -- jujitsu sitabaki
        [29] = 12842, -- soil sitabaki
        [18] = 12841, -- cotton sitabaki
        [8] = 12840, -- sitabaki
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [52] = 14090, -- temple gaiters
        [50] = 11370, -- junkenshi habaki
        [36] = 12978, -- socks
        [29] = 12970, -- soit kyahan
        [18] = 12969, -- cotton kyahan
        [8] = 12968,  -- kyahan
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [21] = 13076, -- fang necklace
    },

    [nttrusts.SlotType.WAIST] = {
        [70] = 13186, -- black belt **
        [40] = 13202, -- brown belt
        [18] = 13201, -- purple belt
        [1] = 13184 -- white belt
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

mnkTankItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [71] = 16395, -- diamond knuckles
        [61] = 16401, -- jamadhars
        [52] = 16389, -- coeurl cesti
        [42] = 17478, -- beat cesti
        [30] = 16411, -- claws
        [24] = 16406, -- baghnakhs
        [12] = 16386, -- lizard cesti
        [1] = 16385  -- cesti
    },

    [nttrusts.SlotType.SUB] = {
        
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [63] = 13881, -- arhats jinpachi
        [56] = 12512, -- temple crown
        [49] = 12460, -- shinobi hachimaki
        [29] = 12458, -- soil hachimaki
        [11] = 12501, -- monks headgear
        [8] = 12456,  -- hachimaki
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [64] = 13795, -- arhats gi
        [58] = 12639, -- temple cyclas
        [49] = 12588, -- shinobi gi
        [40] = 13728, -- jujitsu gi
        [36] = 12594, -- gambison
        [29] = 12586, -- soil gi
        [13] = 12590, -- power gi
        [8] = 12584,  -- kenpogi
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [63] = 14023, -- arhats tekko
        [54] = 13962, -- temple gloves
        [49] = 12716, -- shinobi tekko
        [36] = 12722, -- bracers
        [29] = 12714, -- soil tekko
        [18] = 12713, -- cotton tekko
        [8] = 12712, -- tekko
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [60] = 14215, -- temple hose
        [49] = 12844, -- shinobi hakama
        [37] = 12923, -- jujitsu sitabaki
        [29] = 12842, -- soil sitabaki
        [18] = 12841, -- cotton sitabaki
        [8] = 12840, -- sitabaki
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [63] = 14129, -- arhats sune-ate
        [52] = 14090, -- temple gaiters
        [49] = 12972, -- shinobi kyahan
        [36] = 12978, -- socks
        [29] = 12970, -- soit kyahan
        [18] = 12969, -- cotton kyahan
        [8] = 12968,  -- kyahan
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [49] = 13111, -- nodowa
        [21] = 13090, -- beetle gorget
        [7] = 13075 -- feather collar
    },

    [nttrusts.SlotType.WAIST] = {
        [70] = 13186, -- black belt **
        [40] = 13202, -- brown belt
        [18] = 13201, -- purple belt
        [1] = 13184 -- white belt
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

    if lvl >= 65 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOTWORK, ai.r.JA, ai.s.SPECIFIC, xi.ja.FOOTWORK)
    end

    if lvl >= 35 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 60, ai.r.JA, ai.s.SPECIFIC, xi.ja.CHAKRA)
    end

    if lvl >= 15 then
        local dodgeC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DODGE}, {ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0}}
        trust:addGambit(dodgeC, ai.r.JA, ai.s.SPECIFIC, xi.ja.DODGE)
    end

    if lvl >= 5 then
        trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_OPENER, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BOOST) -- boost when someone might ws
    end
    if lvl >= 25 then
        local focusC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOCUS}, {ai.t.TARGET, ai.c.WS_CLOSER, 1500}}
        trust:addGambit(focusC, ai.r.JA, ai.s.SPECIFIC, xi.ja.FOCUS)
    end
    trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_CLOSER, 1500, ai.r.WS, ai.s.HIGHEST, 0)


    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 1500)
end

local function setupTankAI(trust)
    local lvl = trust:getMainLvl()

    if lvl >= 10 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    end

    if lvl >= 35 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 60, ai.r.JA, ai.s.SPECIFIC, xi.ja.CHAKRA)
    end

    if lvl >= 45 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COUNTERSTANCE, ai.r.JA, ai.s.SPECIFIC, xi.ja.COUNTERSTANCE)
    end

    if lvl >= 65 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.FOOTWORK, ai.r.JA, ai.s.SPECIFIC, xi.ja.FOOTWORK)
    end

    if lvl >= 15 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DODGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.DODGE)
    end

    local wsC = {{ai.t.SELF, ai.c.WS_ASAP, 0}, {ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0}}
    trust:addGambit(wsC, ai.r.WS, ai.s.RANDOM, 0)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.RANDOM, 1500)
end

function nttrusts.monk.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.GALKA
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
        items = nttrusts.getItems(level, mnkTankItemLists)
    else
        items = nttrusts.getItems(level, mnkDpsItemLists)
    end

    local trust = nttrusts.spawntrust(player, 23002, race, items)

    if isTank == true then
        setupTankAI(trust)
    else
        setupDpsAI(trust)
    end
end

return nttrusts