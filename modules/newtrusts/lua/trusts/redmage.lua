
nttrusts = nttrusts or {}
nttrusts.redmage = {}

rdmItemLists = {
    [nttrusts.SlotType.MAIN] = {
        [73] = 16520, -- verdun
        [64] = 16521, -- rapier
        [41] = 16829, -- fencing degen
        [30] = 16524, -- fleuret
        [20] = 16517, -- degen
        [9] = xi.item.SPATHA,
        [1] = xi.item.BRONZE_SWORD
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
        [60] = 12513, -- warlocks chapeau
        [48] = 12444, -- raptor
        [38] = 12443, -- cuir bandana
        [30] = 12442, -- studded bandana
        [17] = 12441, -- lizard helm
        [7] = 12440, -- leather bandana
        [1] = xi.item.BRONZE_CAP
    },

    [nttrusts.SlotType.BODY] = {
        [58] = 12642, -- warlocks tabard
        [48] = 12572, -- raptor jerkin
        [38] = 12571, -- cuir bouilli
        [30] = 12570, -- studded vest
        [17] = 12569, -- lizard jerkin
        [7] = 12568, -- leather vest
        [1] = xi.item.BRONZE_HARNESS
    },

    [nttrusts.SlotType.HANDS] = {
        [54] = 13965, -- warlocks gloves
        [48] = 12700, -- raptor gloves
        [38] = 12699, -- cuir gloves
        [30] = 12698, -- studded gloves
        [17] = 12697, -- lizard gloves
        [7] = 12696, -- leather gloves
        [1] = xi.item.BRONZE_MITTENS
    },

    [nttrusts.SlotType.LEGS] = {
        [56] = 14218, -- warlocks tights
        [48] = 12828, -- raptor trousers
        [38] = 12827, -- cuir trousers
        [30] = 12826, -- studded trousers
        [17] = 12825, -- lizard trousers
        [7]  = 12824, -- leather trousers
        [1] = xi.item.BRONZE_SUBLIGAR
    },

    [nttrusts.SlotType.FEET] = {
        [52] = 14093, -- warlocks boots
        [48] = 12956, -- raptor ledelsens
        [38] = 12955, -- cuir highboots
        [30] = 12954, -- studded boots
        [17] = 12953, -- lizard ledelsens
        [7]  = 12952, -- leather highboots
        [1] = xi.item.BRONZE_LEGGINGS
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
        [43] = 13586, -- red cape
        [32] = 13577, -- black cape
        [7] = 13583, -- cape
    }
}

local function setupAI(trust)

    local lvl = trust:getMainLvl()

    if lvl > 50 then
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COMPOSURE, ai.r.JA, ai.s.SPECIFIC, xi.ja.COMPOSURE)
    end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)

    if lvl >= 40 then
        local convertC = {{ai.t.SELF, ai.c.MPP_GTE, 10}, {ai.t.SELF, ai.c.MPP_LT, 25}, {ai.t.SELF, ai.c.HPP_GTE, 50}}
        trust:addGambit(convertC, ai.r.JA, ai.s.SPECIFIC, xi.ja.CONVERT)
    end
	
	if lvl >= 33 then
		local phalanxC = {{ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX}}
		trust:addGambit(phalanxC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
	end

    trust:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.ma.spell.DISPEL)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    local wsC = {{ai.t.SELF, ai.c.WS_OPENER, 0}, {ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0}}
    trust:addGambit(wsC, ai.r.WS, ai.s.RANDOM, 0)

    local diaC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA}, {ai.t.TARGET, ai.c.HPP_GTE, 25} }
    trust:addGambit(diaC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA, 40)

    local slowC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(slowC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 20)

    local paralyzeC = { {ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS}, {ai.t.TARGET, ai.c.HPP_GTE, 75} }
    trust:addGambit(paralyzeC, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 20)

    trust:addSimpleGambit(ai.t.TANK, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PHALANX_II)
    trust:addSimpleGambit(ai.t.CASTER, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    trust:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    trust:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, xi.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FLURRY)

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.INT_BOOST, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.GAIN_INT)

    local enspellC = {  {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENFIRE}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENFIRE_II},
                        {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENBLIZZARD}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENBLIZZARD_II},
                        {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENAERO}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENAERO_II},
                        {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENSTONE}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENSTONE_II},
                        {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENTHUNDER}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENTHUNDER_II},
                        {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENWATER}, {ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENWATER_II}}
    trust:addGambit(enspellC, ai.r.MA, ai.s.BEST_AGAINST_TARGET, xi.magic.spellFamilyGroup.ENSPELL)


    trust:setTrustTPSkillSettings(ai.tp.USE_GAMBIT, ai.s.HIGHEST, 3000) -- never ws
end

function nttrusts.redmage.spawn(player, params)
    local level = player:getMainLvl()

    local race = xi.race.ELVAAN_M
    local items = {} 

    if params ~= nil then
        if params.race ~= 0 then
            race = params.race
        end
    end

    items = nttrusts.getItems(level, rdmItemLists)

    local trust = nttrusts.spawntrust(player, 23005, race, items)

    setupAI(trust)
    
end

return nttrusts