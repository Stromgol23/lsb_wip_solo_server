-----------------------------------
-- func: ntspawn
-- desc: spawn a new trust
-----------------------------------
local commandObj = {}

SlotType = 
{
    SLOT_MAIN   = 0x00,
    SLOT_SUB    = 0x01,
    SLOT_RANGED = 0x02,
    SLOT_AMMO   = 0x03,
    SLOT_HEAD   = 0x04,
    SLOT_BODY   = 0x05,
    SLOT_HANDS  = 0x06,
    SLOT_LEGS   = 0x07,
    SLOT_FEET   = 0x08,
    SLOT_NECK   = 0x09,
    SLOT_WAIST  = 0x0A,
    SLOT_EAR1   = 0x0B,
    SLOT_EAR2   = 0x0C,
    SLOT_RING1  = 0x0D,
    SLOT_RING2  = 0x0E,
    SLOT_BACK   = 0x0F,
    SLOT_LINK1  = 0x10,
    SLOT_LINK2  = 0x11,
};

Role =
{
    DEFAULT = 0,
    DPS = 1,
    TANK = 2,
    HEAL = 3,
    NUKE = 4,
    SUPPORT = 5
}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'ssss',
}

local function setModels(trust, id)
    trust:setModelId(id, SlotType.SLOT_HEAD)
    trust:setModelId(id, SlotType.SLOT_BODY)
    trust:setModelId(id, SlotType.SLOT_HANDS)
    trust:setModelId(id, SlotType.SLOT_LEGS)
    trust:setModelId(id, SlotType.SLOT_FEET)
end

local function spawntrust(player, id)
    -- return player:spawnTrust(id)
    return SpawnNtTrust(player, id)
end

local function setupScholar(trust)

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ADDENDUM_WHITE, ai.r.JA, ai.s.SPECIFIC, xi.ja.LIGHT_ARTS)

    if trust:getMainLvl() >= 30 then 
        trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ADDENDUM_WHITE, ai.r.JA, ai.s.SPECIFIC, xi.ja.ADDENDUM_WHITE)
    end

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURSNA)

    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)

    trust:addSimpleGambit(ai.t.TANK, ai.c.NOT_STATUS, xi.effect.REGEN, ai.r.MA, ai.s.HIGHEST, xi.magic.spell.REGEN)

    trust:setAutoAttackEnabled(false)
    trust:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.NO_MOVE)

    -- trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PARALYZE, 60)
    -- trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 60)
end

local function readParams(input, params)
    if input ~= nil then
        if input == "hm" then
            params.race = xi.race.HUME_M
        elseif input == "hf" then
            params.race = xi.race.HUME_F
        elseif input == "em" then
            params.race = xi.race.ELVAAN_M
        elseif input == "ef" then
            params.race = xi.race.ELVAAN_F
        elseif input == "tm" then
            params.race = xi.race.TARU_M
        elseif input == "tf" then
            params.race = xi.race.TARU_F
        elseif input == "mi" then
            params.race = xi.race.MITHRA
        elseif input == "ga" then
            params.race = xi.race.GALKA
        elseif input == "dps" then
            params.role = Role.DPS
        elseif input == "tank" then
            params.role = Role.TANK
        elseif input == "heal" then
            params.role = Role.HEAL
        elseif input == "nuke" then
            params.role = Role.NUKE
        elseif input == "support" then
            params.role = Role.SUPPORT
        elseif input == "melee" then
            params.melee = true
        elseif input == "nomelee" then
            params.melee = false
        end
    end
end

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!ntspawn <trust name>')
end

commandObj.onTrigger = function(player, trustname, param1, param2, param3)
    if trustname == nil then
        error(player, "No name specified")
        return
    end

    params = { role = Role.DEFAULT, race = 0, melee = false }
    readParams(param1, params)
    readParams(param2, params)
    readParams(param3, params)

    if trustname == "warrior" then
        nttrusts.warrior.spawn(player, params)
    elseif trustname == 'monk' then
        nttrusts.monk.spawn(player, params)
    elseif trustname == 'whitemage' then
        nttrusts.whitemage.spawn(player, params)
    elseif trustname == 'blackmage' then
        nttrusts.blackmage.spawn(player, params)
    elseif trustname == 'redmage' then
        nttrusts.redmage.spawn(player, params)
    elseif trustname == 'thief' then
        nttrusts.thief.spawn(player, params)
    elseif trustname == 'paladin' then
        nttrusts.paladin.spawn(player, params)
    elseif trustname == 'darkknight' then
        nttrusts.darkknight.spawn(player, params)
    elseif trustname == 'ranger' then
        nttrusts.ranger.spawn(player, params)
    elseif trustname == 'samurai' then
		nttrusts.samurai.spawn(player, params)
	elseif trustname == 'dragoon' then
		nttrusts.dragoon.spawn(player, params)
	end
end

return commandObj