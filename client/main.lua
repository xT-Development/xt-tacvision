local config = lib.require('configs.client')
local utils = lib.require('client.utils')
local keyBinds = config.keybinds

local playerState = LocalPlayer.state

-- toggle nightvision or force state
local function toggleNightVision(state)
    local isWearingGoggles, gogglesInfo = utils.isWearingGoggles()
    if not isWearingGoggles then
        lib.notify({
            title = 'You are not wearing nightvision goggles!',
            type = 'error'
        })

        return
    end

    utils.toggleGogglesPosition(state ~= nil and state == false)

    playerState.nightVision = (state ~= nil and state) or (not playerState.nightVision) -- simply toggle nightvision or set it equal to state (if declared)
    SetNightvision(playerState.nightVision)

    -- if state is declared, and equal to false, we should remove thermal as well, in case it is on
    if (state ~= nil and state == false) and playerState.thermalVision then
        playerState.thermalVision = false
        SetSeethrough(false)
    end
end exports('toggleNightVision', toggleNightVision)

-- toggle night vision keybind
local keybind_toggleNightVision = lib.addKeybind({
    name = 'toggle_nightVision',
    description = 'Toggle Night Vision (Must be wearing nightvision goggles)',
    defaultKey = keyBinds.toggleNightVision,
    onReleased = function(self)
        local isWearingGoggles, gogglesInfo = utils.isWearingGoggles()
        if not isWearingGoggles then
            lib.notify({
                title = 'You are not wearing nightvision goggles!',
                type = 'error'
            })

            return
        end

        playerState.nightVision = not playerState.nightVision

        utils.toggleGogglesPosition(not playerState.nightVision)

        SetNightvision(playerState.nightVision)

        if not playerState.nightVision then -- disable thermal (if on) when disabling nightvision
            playerState.thermalVision = false
            SetSeethrough(false)
        end
    end
})

-- toggle thermal when nightvision is on
local keybind_toggleThermal = lib.addKeybind({
    name = 'toggle_thermalVision',
    description = 'Toggle Thermal Vision Goggles',
    defaultKey = keyBinds.toggleThermal,
    onReleased = function(self)
        if not playerState.nightVision then return end -- only toggle thermal if nightvision is on

        playerState.thermalVision = not playerState.thermalVision

        utils.toggleThermalAnimation()

        if playerState.thermalVision then
            SeethroughSetMaxThickness(config.thermal.maxThickness)
            SeethroughSetNoiseAmountMin(config.thermal.noiseMin)
            SeethroughSetNoiseAmountMax(config.thermal.noiseMax)
            SeethroughSetFadeStartDistance(config.thermal.fadeStartDistance)
            SeethroughSetFadeEndDistance(config.thermal.fadeEndDistance)
        end

        SetSeethrough(playerState.thermalVision)
    end
})