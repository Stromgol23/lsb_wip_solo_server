nttrusts = nttrusts or {}

nttrusts.SlotType = 
{
    MAIN   = 0x00,
    SUB    = 0x01,
    RANGED = 0x02,
    AMMO   = 0x03,
    HEAD   = 0x04,
    BODY   = 0x05,
    HANDS  = 0x06,
    LEGS   = 0x07,
    FEET   = 0x08,
    NECK   = 0x09,
    WAIST  = 0x0A,
    EAR1   = 0x0B,
    EAR2   = 0x0C,
    RING1  = 0x0D,
    RING2  = 0x0E,
    BACK   = 0x0F,
    LINK1  = 0x10,
    LINK2  = 0x11,
}

function nttrusts.spawntrust(player, id, race, items)
    -- return player:spawnTrust(id)
    return SpawnNtTrust(player, id, race, items)
end

local function getBestItem(level, items)

    if items == nil then
        return 0
    end

    local highestLvl = 0
    local bestId = 0
    for i, id in pairs(items) do
        if level >= i and i > highestLvl then
            highestLvl = i
            bestId = id
        end
    end

    return bestId
end

function nttrusts.getItems(level, itemLists)
    items = {}

    for _, i in pairs(nttrusts.SlotType) do
        items[i] = getBestItem(level, itemLists[i])
    end

    return items
end

return nttrusts