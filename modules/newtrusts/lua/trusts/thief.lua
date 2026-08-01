
nttrusts = nttrusts or {}
nttrusts.thief = {}

thiefItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [72] = 16470, -- Gully
        [62] = 16477, -- Cermet Kukri
        [56] = 17612, -- beetle knife
        [46] = 17610, -- bone knife
        [31] = 16467, -- mythril knife
        [23] = 16451, -- mythril dagger
        [13] = 16466, -- knife
        [9] = 16449, -- brass dagger
        [1] = 16448  -- bronze dagger
    },

    [nttrusts.SlotType.SUB] = {
        
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [70] = 12469, -- war beret
        [54] = 12514, -- rogues bonnet
        [45] = 13711, -- carapace mask
        [30] = 15161, -- noct beret
        [23] = 12465, -- cotton headgear
        [11] = 12464, -- headgear
        [7] = 12440, -- leather bandana
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [70] = 12597, -- war aketon
        [57] = 12579, -- scorpion harness
        [45] = 13703, -- brigandine
        [30] = 14422, -- noct doublet
        [23] = 12593, -- cotton doublet
        [11] = 12592, -- doublet
        [7] = 12568, -- leather vest
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [70] = 12725, -- war gloves
        [52] = 13966, -- rogues armlet
        [45] = 13713, -- carapace mittens
        [30] = 14854, -- noct gloves
        [23] = 12721, -- cotton gloves
        [11] = 12720, -- gloves
        [7] = 12696, -- leather gloves
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [70] = 12853, -- war brais
        [56] = 14219, -- rogues culottes
        [45] = 12837, -- carapace subliguar
        [30] = 14323, -- noct brais
        [23] = 12849, -- cotton brais
        [11] = 12848, -- brais
        [7] = 12824, -- leather troursers
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [70] = 12981, -- war boots
        [60] = 14094, -- rogue's poulaines
        [45] = 13715, -- cpc leggings
        [30] = 15311, -- noct gaiters
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

    if lvl >= 15 then
        trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_CLOSER, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SNEAK_ATTACK)
    end
    trust:addSimpleGambit(ai.t.TARGET, ai.c.WS_CLOSER, 0, ai.r.WS, ai.s.HIGHEST, 0)

    -- need to move behind the target

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000)
end

function nttrusts.thief.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.MITHRA
    local items = {} 

    if params ~= nil then
        if params.race ~= nil and params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, thiefItemLists)

    local trust = nttrusts.spawntrust(player, 23006, race, items)

    setupAI(trust)
end

return nttrusts