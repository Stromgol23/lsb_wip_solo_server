
nttrusts = nttrusts or {}
nttrusts.whitemage = {}

whtItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [60] = 17054, -- ebony wand
        [48] = 17053, -- rose wand
        [32] = 17052, -- chestnut wand
        [18] = 17051, -- yew wand
        [9] = 17050, -- willow wand
        [1] = 17049  -- maple wand
    },

    [nttrusts.SlotType.SUB] = {
        [69] = 12409, -- numinous shield,
        [61] = 12295, -- round shield,
        [48] = 12294, -- leather shield,
        [36] = 12293, -- oak shield
        [20] = 12292, -- MAHOGANY_SHIELD,
        [8] = xi.item.MAPLE_SHIELD,
        [1] = xi.item.LAUAN_SHIELD
    },

    [nttrusts.SlotType.RANGED] = {
    
    },

    [nttrusts.SlotType.AMMO] = {
    
    },

    [nttrusts.SlotType.HEAD] = {
        [54] = 13855, -- healers cap
        [50] = 12494, -- gold hairpin
        [40] = 13840, -- electrum hairpin
        [20] = 12495, -- silver hairpin
        [10] = 12497, -- brass hairpin
        [1] = 12496 -- copper hairpin
    },

    [nttrusts.SlotType.BODY] = {
        [58] = 12640, -- healers bliaut
        [40] = 13813, -- divine breastplate
        [33] = 13750, -- linen doublet
        [23] = 12593, -- cotton doublet
        [11] = 12592, -- doublet
        [1] = 12600 -- robe
    },

    [nttrusts.SlotType.HANDS] = {
        [60] = 13963, -- healers mitts
        [53] = 12732, -- silk cuffs
        [41] = 13979, -- silver bangles
        [34] = 12738, -- linen mitts
        [23] = 12721, -- cotton gloves
        [11] = 12720, -- gloves
        [1] = 12728 -- cuffs
    },

    [nttrusts.SlotType.LEGS] = {
        [70] = 12853, -- war brais
        [56] = 14216, -- healers pantaln
        [34] = 12866, -- linen slacks
        [23] = 12849, -- cotton brais
        [11] = 12848, -- brais
        [1] = 12856 -- slops
    },

    [nttrusts.SlotType.FEET] = {
        [52] = 14091, -- healers duckbills
        [34] = 12994, -- shoes
        [23] = 12977, -- cotton gaiters
        [11] = 12976, -- gaiters
        [1] = 12984 -- ash clogs
    },

    [nttrusts.SlotType.NECK] = {
        [48] = 13135, -- promise badge
        [7] = 13093 -- justice badge
    },

    [nttrusts.SlotType.WAIST] = {
        [39] = 13229, -- oracles belt
        [8] = 13204 -- heko obi
    },

    [nttrusts.SlotType.EAR1] = {
        [67] = 13411, -- cmn. earring
        [49] = 13349, -- night earring
        [31] = 13320, -- black earring
        [10] = 13379  -- energy earring
    },

    [nttrusts.SlotType.EAR2] = {
        [67] = 13411, -- cmn. earring
        [49] = 13349, -- night earring
        [31] = 13320, -- black earring
        [10] = 13379  -- energy earring
    },

    [nttrusts.SlotType.RING1] = {
        [72] = 13452, -- sapphire ring
        [54] = 13488, -- aquamarine ring
        [36] = 13480, -- turquoise ring
        [14] = 13472, -- lapis lazuri ring
    },

    [nttrusts.SlotType.RING2] = {
        [72] = 13452, -- sapphire ring
        [54] = 13488, -- aquamarine ring
        [36] = 13480, -- turquoise ring
        [14] = 13472, -- lapis lazuri ring
    },

    [nttrusts.SlotType.BACK] = {
        [71] = 13587, -- rainbow cape
        [32] = 13585, -- white cape
        [7] = 13583, -- cape
    }
}

local function setupRangedAI(trust)

    local lvl = trust:getMainLvl()

    if lvl >= 40 then 
        trust:addGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.AFFLATUS_SOLACE, ai.r.JA, ai.s.SPECIFIC, xi.ja.AFFLATUS_SOLACE)
    end

    if lvl >= 15 then
        trust:addGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.JA, ai.s.SPECIFIC, xi.ja.DIVINE_SEAL)
    end
    trust:addGambit(ai.t.PARTY_MULTI, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURAGA)
    trust:addGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    trust:addGambit(ai.t.PARTY_MULTI, ai.c.HPP_LT, 60, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURAGA)
    trust:addGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)

    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA)

    trust:addGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)

	local regenC = { {ai.t.TOP_ENMITY, ai.c.NOT_STATUS, xi.effect.REGEN}, {ai.t.TOP_ENMITY, ai.c.HPP_LT, 100} }
    trust:addGambit(regenC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REGEN)

    local paralyzeC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(paralyzeC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 20)

    -- trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 60)
    -- trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 60)

    if lvl >= 50 then
        trust:addGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.HOLY)
    else
        trust:addGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BANISH)
    end

    trust:setAutoAttackEnabled(false)
    trust:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.NO_MOVE)
    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000) -- never ws
end

local function setupMeleeAI(trust)
   
    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000) -- put in gambit to avoid sc
end

function nttrusts.whitemage.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.ELVAAN_F
    local items = {} 

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, whtItemLists)

    local trust = nttrusts.spawntrust(player, 23003, race, items)

    if params ~= nil and params.melee == true then
        setupMeleeAI(trust)
    else
        setupRangedAI(trust)
    end
end

return nttrusts
