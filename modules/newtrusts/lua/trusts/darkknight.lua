
nttrusts = nttrusts or {}
nttrusts.darkknight = {}

drkItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 16777, -- death scythe
        [65] = 16789, -- darksteel scythe
        [53] = 16794, -- bone scythe
        [40] = 16775, -- mythil scythe
        [27] = 16784, -- frostreaper
        [18] = 16774, -- scythe
        [10] = 16769, -- brass zahgnal
        [1] = 16768  -- bronze zahgnal
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
        [73] = 12420, -- adaman barbuta
        [60] = 12516, -- chaos burgeonet
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
        [29] = 14431, -- eisenbrust
        [24] = 12552, -- chainmail
        [10] = 12560, -- scale mail
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [68] = 12684, -- thick mufflers
        [54] = 13968, -- chaos gauntlets
        [49] = 12673, -- mythril gauntlets
        [40] = 12672, -- gauntlets
        [29] = 14860, -- eisenhentzes
        [24] = 12680, -- chain mittens
        [10] = 12688, -- scale finger gauntlets
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [69] = 12812, -- thick breeches
        [56] = 14221, -- chaos flanchard
        [49] = 12801, -- mythril cuisses
        [40] = 12800, -- cuisses
        [29] = 14329, -- eisendiechlings
        [24] = 12808, -- chain hoses
        [10] = 12816, -- scale cuisses
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [68] = 12940, -- thick sollerets
        [52] = 14096, -- chaos solleret
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

local function setupAI(trust)
    local lvl = trust:getMainLvl()

    if lvl >= 20 then
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC,  xi.ja.WEAPON_BASH)
        trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WEAPON_BASH)
    end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    local drainC = { {ai.t.TARGET, ai.c.HPP_GTE, 1}, {ai.t.SELF, ai.c.HPP_LT, 50} }
    trust:addGambit(drainC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DRAIN)

    local aspirC = { {ai.t.TARGET, ai.c.MPP_GTE, 25}, {ai.t.SELF, ai.c.MPP_LT, 50} }
    trust:addGambit(aspirC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ASPIR, 20)

    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.POISON, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.POISON, 120)

    local bioC = {{ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BIO}, {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA}}
    trust:addGambit(bioC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.BIO, 30)

    local absDexC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DEX_BOOST}, {ai.t.TARGET, ai.c.HPP_GTE, 50}}
    trust:addGambit(absDexC, ai.s.SPECIFIC, xi.magic.spell.ABSORB_DEX, 40)

    if lvl >= 15 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.LAST_RESORT, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    end

    if lvl >= 30 then
        local souleaterC = {{ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SOULEATER}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.LAST_RESORT}, {ai.t.SELF, ai.c.HPP_LT, 50}, {ai.t.TARGET, ai.c.HPP_GTE, 50}}
        trust:addGambit(souleaterC, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    trust:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.RANDOM, 1500)
end

function nttrusts.darkknight.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.HUME_M
    local items = {} 
    local isTank = false

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, drkItemLists)

    local trust = nttrusts.spawntrust(player, 23008, race, items)

    setupAI(trust)
end

return nttrusts