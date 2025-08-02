local config = lib.require('configs.client')
local currentHelmetInfo = {}

local utils = {}

-- check if player is wearing nightvision goggles
-- return boolean and goggles info (on/off variation)
function utils.isWearingGoggles()
    local helmet = GetPedPropIndex(cache.ped, 0)
    local isMale = IsPedMale(cache.ped)
    local goggles = isMale and config.goggles.male or config.goggles.female

    for x = 1, #goggles do
        if goggles[x].on == helmet or goggles[x].off == helmet then

            currentHelmetInfo =  goggles[x] -- set current helmet info for toggling

            return true, goggles[x]
        end
    end

    return false
end

-- move goggles to top of head and on to face
function utils.toggleGogglesPosition(remove)
    local dict = 'anim@mp_helmets@on_foot'
    local anim = remove and 'goggles_up' or 'goggles_down'
    lib.playAnim(cache.ped, dict, anim, 8.0, 8.0, 1000, 0)
    Wait(1000)

    SetPedPropIndex(cache.ped, 0, remove and currentHelmetInfo.off or currentHelmetInfo.on, 0, false)
end

-- animation to toggle thermal
function utils.toggleThermalAnimation()
    lib.playAnim(cache.ped, 'mp_masks@low_car@ds@', 'put_on_mask', 8.0, 8.0, 500, 0)
    Wait(500)
end

return utils