
nttrusts = nttrusts or {}
nttrusts.dragoon = {}

dragoonItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 16841, -- wyvern spear
        [62] = 16849, -- Cermet lance
        [58] = 16848, -- darksteel lance
        [48] = 16847, -- mythril lance
        [34] = 16845, -- lance
        [24] = 16835, -- spear
        [14] = 16834, -- brass spear
        [7] = 16833, -- bronze spear
        [1] = 16832  -- Harpoon
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
        [60] = 12519, -- drachen armet
        [45] = 13711, -- carapace mask
        [30] = 12442, -- studded bandana
        [23] = 12465, -- cotton headgear
        [11] = 12464, -- headgear
        [7] = 12440, -- leather bandana
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [57] = 12579, -- scorpion harness
        [45] = 13703, -- brigandine
        [30] = 12570, -- Studded Vest
        [23] = 12593, -- cotton doublet
        [11] = 12592, -- doublet
        [7] = 12568, -- leather vest
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [56] = 13974, -- drachen finger gauntlets
        [45] = 13713, -- carapace mittens
        [30] = 12698, -- studded gloves
        [23] = 12721, -- cotton gloves
        [11] = 12720, -- gloves
        [7] = 12696, -- leather gloves
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [56] = 14227, -- drachen brais
        [45] = 12837, -- carapace subliguar
        [30] = 12826, -- studded trousers
        [23] = 12849, -- cotton brais
        [11] = 12848, -- brais
        [7] = 12824, -- leather troursers
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [54] = 14102, -- drachen greaves
        [45] = 13715, -- cpc leggings
        [30] = 12954, -- studded boots
        [23] = 12977, -- cotton gaiters
        [11] = 12976, -- gaiters
        [7] = 12952,  -- leather highboots
        [1] = xi.item.BRONZE_LEGGINGS
    },

    [nttrusts.SlotType.NECK] = {
        [21] = 13061, -- spike necklace
        [7] = 13081 -- leather gorget
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
        [72] = 13451, -- spinel ring
        [54] = 13487, -- fluorite ring
        [36] = 13479, -- ametrine ring
        [14] = 13471, -- amethyst ring
    },

    [nttrusts.SlotType.RING2] = {
        [72] = 13451, -- spinel ring
        [54] = 13487, -- fluorite ring
        [36] = 13479, -- ametrine ring
        [14] = 13471, -- amethyst ring
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

	if lvl >= 50 then
		trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SUPER_JUMP)
	end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_CLOSER, 0, ai.r.WS, ai.s.HIGHEST, 0)

	if lvl >= 10 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.JUMP)
    end
	
	if lvl >= 35 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.HIGH_JUMP)
    end

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000)
end

function nttrusts.dragoon.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.ELVAAN_M
    local items = {} 

    if params ~= nil then
        if params.race ~= nil and params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, dragoonItemLists)

    local trust = nttrusts.spawntrust(player, 23014, race, items)

    setupAI(trust)
end

return nttrusts