
nttrusts = nttrusts or {}
nttrusts.samurai = {}

samDpsItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 18431, -- Butachi
        [67] = 16972, -- Kazaridachi
        [54] = 16984, -- Jindachi
        [44] = 16967, -- Mikazuki
        [37] = 16970, -- Hosodachi
        [16] = 16982, -- nodachi
        [8] = 16966, -- tachi
        [1] = 17809  -- mumeito
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
        [70] = 15188, -- Hachiman Jinpachi
        [60] = 13868, -- Myochin Kabuto
        [49] = 12460, -- shinomi hachimaki
        [29] = 12458, -- soil hachimaki
        [18] = 12457, -- cotton hachimaki
        [8] = 12456,  -- hachimaki
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
		[70] = 14437, -- Hachiman Domaru
        [57] = 12579, -- scorpion harness
        [40] = 13728, -- jujitsu gi
        [29] = 12586, -- soil gi
        [13] = 12590, -- power gi
        [8] = 12584,  -- kenpogi
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
		[70] = 14876, -- Hachiman Kote
        [56] = 13972, -- Myochin Kote
        [49] = 12716, -- shinobi tekko
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
        [49] = 12972, -- Shinobi Kyahan
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

samTankItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 18431, -- Butachi
        [67] = 16972, -- Kazaridachi
        [54] = 16984, -- Jindachi
        [40] = 17821, -- Kagehide
        [37] = 16970, -- Hosodachi
        [16] = 16982, -- nodachi
        [8] = 16966, -- tachi
        [1] = 17809  -- mumeito
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
        [60] = 13868, -- Myochin Kabuto
		[46] = 12426, -- Banded Helm
        [36] = 12425, -- Silver Mask
        [24] = 12424, -- Iron Mask
        [16] = 12454, -- Bone Mask
        [8] = 12456,  -- hachimaki
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
		[64] = 13795, -- Arhat's Gi
        [58] = 13781, -- Myochin Domaru
        [46] = 12554, -- Banded Mail
		[36] = 12553, -- Silver Mail
        [24] = 12552, -- chainmail
        [16] = 12582, -- Bone Harness
        [8] = 12584,  -- kenpogi
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [56] = 13972, -- Myochin Kote
		[46] = 12682, -- Mufflers
        [36] = 12681, -- Silver Mittens
        [24] = 12680, -- chain mittens
        [16] = 12710, -- Bone Mittens
        [8] = 12712, -- tekko
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
		[64] = 14253, -- Arhat's Hakama
        [54] = 14225, -- Myochin Haidate
        [46] = 12810, -- Breeches
        [36] = 12809, -- Silver Hose
        [24] = 12808, -- chain hoses
        [16] = 12834, -- Bone Subligar
        [8] = 12840, -- sitabaki
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
		[52] = 14100, -- Myochin Sune-Ate
        [46] = 12938, -- Sollerets
        [36] = 12937, -- Silver Greaves
        [24] = 12936, -- greaves
        [16] = 12966, -- Bone Leggings
        [8] = 12968,  -- kyahan
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [49] = 13111, -- nodowa
        [21] = 13090, -- beetle gorget
        [7] = 13081 -- Leather Gorget
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

    if lvl >= 25 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, xi.ja.HASSO)
    end

    if lvl >= 15 then
        local thirdEye = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.THIRD_EYE}, {ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0}}
        trust:addGambit(thirdEye, ai.r.JA, ai.s.SPECIFIC, xi.ja.THIRD_EYE)
    end

	if lvl >= 30 then
		trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_OPENER, 1000, ai.r.JA, ai.s.SPECIFIC, xi.ja.MEDITATE)
	end
    trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_OPENER, 1000, ai.r.WS, ai.s.HIGHEST, 0)
	
	if lvl >= 65 then
		trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_OPENER, 1500, ai.r.JA, ai.s.SPECIFIC, xi.ja.KONZEN_ITTAI)
	end
	
	trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_CLOSER, 3000, ai.r.WS, ai.s.HIGHEST, 0)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 1500)
end

local function setupTankAI(trust)
    local lvl = trust:getMainLvl()

	if lvl >= 10 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    end

	if lvl >= 35 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SEIGAN, ai.r.JA, ai.s.SPECIFIC, xi.ja.SEIGAN)
    end
	
	if lvl >= 15 then
		trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.THIRD_EYE, ai.r.JA, ai.s.SPECIFIC, xi.ja.THIRD_EYE)
	end

	if lvl >= 50 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DEFENDER, ai.r.JA, ai.s.SPECIFIC, xi.ja.DEFENDER)
    end

    local wsC = {{ai.t.SELF, ai.c.WS_ASAP, 0}, {ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0}}
    trust:addGambit(wsC, ai.r.WS, ai.s.RANDOM, 0)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.RANDOM, 1500)
end

function nttrusts.samurai.spawn(player, params)
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
        items = nttrusts.getItems(level, samTankItemLists)
    else
        items = nttrusts.getItems(level, samDpsItemLists)
    end

    local trust = nttrusts.spawntrust(player, 23012, race, items)

    if isTank == true then
        setupTankAI(trust)
    else
        setupDpsAI(trust)
    end
end

return nttrusts