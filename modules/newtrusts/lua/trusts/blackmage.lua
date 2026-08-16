
nttrusts = nttrusts or {}
nttrusts.blackmage = {}

blmItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [60] = 17054, -- ebony wand
        [48] = 17053, -- rose wand
        [32] = 17052, -- chestnut wand
        [18] = 17051, -- yew wand
        [9] = 17050, -- willow wand
        [1] = 17049  -- maple wand
    },

    [nttrusts.SlotType.SUB] = {
        [68] = 12382, -- astral aspis
        [30] = 12374, -- tortoise shield
        [8] = 16185 -- pelte
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [60] = 13856, -- wizards petasos
        [29] = 15163, -- seers crown
        [20] = 0, -- none (black tunic)
        [10] = 12497, -- brass hairpin
        [1] = 12496 -- copper hairpin
    },

    [nttrusts.SlotType.BODY] = {
        [72] = 14380, -- errant houppelante
        [62] = 11346, -- vela justaucorps
        [58] = 13744, -- justaucorps
        [38] = 12603, -- velvet robe
        [20] = 12609, -- black tunic    *****
        [12] = 12601, -- linen robe
        [1] = 12600 -- robe
    },

    [nttrusts.SlotType.HANDS] = {
        [72] = 14078, -- errant cuffs
        [54] = 13964, -- wizards gloves
        [29] = 14856, -- seers mitts
        [20] = 12737, -- white mitts
        [12] = 12729, -- linen cuffs
        [1] = 12728 -- cuffs
    },

    [nttrusts.SlotType.LEGS] = {
        [72] = 14301, -- errant slops
        [56] = 14217, -- wizards tonban
        [29] = 14325, -- seers slacks
        [20] = 12865, -- black slacks
        [12] = 12857, -- linen slops
        [1] = 12856 -- slops
    },

    [nttrusts.SlotType.FEET] = {
        [72] = 14182, -- errant pigaches
        [52] = 14092, -- wizards sabot
        [29] = 15313, -- seers pumps
        [20] = 12993, -- sandals
        [12] = 12985, -- holly clogs
        [1] = 12984 -- ash clogs
    },

    [nttrusts.SlotType.NECK] = {
        [40] = 16261, -- mohbwa scarf
        [20] = 13113 -- black neckerchief
    },

    [nttrusts.SlotType.WAIST] = {
        [71] = 15891, -- al zhabi sash
        [28] = 13228 -- shamans belt
    },

    [nttrusts.SlotType.EAR1] = {
        [47] = 14724, -- moldavite earring
        [31] = 13320, -- black earring
        [10] = 13379  -- energy earring
    },

    [nttrusts.SlotType.EAR2] = {
        [67] = 13409, -- omn earring
        [49] = 13349, -- night earring
        [31] = 13320, -- black earring
        [10] = 13379  -- energy earring
    },

    [nttrusts.SlotType.RING1] = {
        [72] = 13450, -- diamond ring
        [54] = 13486, -- zircon ring
        [36] = 13478, -- goshenite ring
        [14] = 13470, -- clear ring
    },

    [nttrusts.SlotType.RING2] = {
        [72] = 13450, -- diamond ring
        [54] = 13486, -- zircon ring
        [36] = 13478, -- goshenite ring
        [14] = 13470, -- clear ring
    },

    [nttrusts.SlotType.BACK] = {
        [71] = 13587, -- rainbow cape
        [32] = 13577, -- black cape
        [7] = 13583, -- cape
    }
}

local function setupAI(trust)

    local lvl = trust:getMainLvl()

    trust:addGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    local drainC = { {ai.t.TARGET, ai.c.HPP_GTE, 1}, {ai.t.SELF, ai.c.HPP_LT, 50} }
    trust:addGambit(drainC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DRAIN)

    local aspirC = { {ai.t.TARGET, ai.c.MPP_GTE, 25}, {ai.t.SELF, ai.c.MPP_LT, 50} }
    trust:addGambit(aspirC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ASPIR, 20)

    local burnC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BURN}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(burnC, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BURN, 30)

    local chokeC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.CHOKE}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(chokeC, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CHOKE, 30)

    local poisonC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.POISON}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(poisonC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.POISON, 20)

    local blindC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS}, {ai.t.TARGET, ai.c.HPP_GTE, 25} }
    trust:addGambit(blindC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.BLIND, 40)

    trust:addGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    if lvl >= 15 then
        trust:addGambit(ai.t.TARGET, ai.c.HPP_GTE, 75, ai.r.JA, ai.s.SPECIFIC, xi.ja.ELEMENTAL_SEAL)
    end
    trust:addGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.MA, ai.s.BEST_AGAINST_TARGET, xi.magic.spellFamilyGroup.DAMAGE_ANY, 20)

    trust:setAutoAttackEnabled(false)
    trust:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.NO_MOVE)

    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000) -- never ws
end

function nttrusts.blackmage.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.TARU_M
    local items = {} 

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, blmItemLists)

    local trust = nttrusts.spawntrust(player, 23004, race, items)

    setupAI(trust)
    
end

return nttrusts
