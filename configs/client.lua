return {
    keybinds = {                    -- keybinds for toggling nightvision, and thermal goggles
        toggleNightVision = 'F9',
        toggleThermal = 'F10'
    },

    thermal = {
        maxThickness = 25.0,        -- max thickness of thermal vision 1.0 - 10000.0 (https://docs.fivem.net/natives/?_0x0C8FAC83902A62DF)
        noiseMin = 0.1,             -- min noise of thermal vision (https://docs.fivem.net/natives/?_0xFF5992E1C9E65D05)
        noiseMax = 1.0,             -- max noise of thermal vision (https://docs.fivem.net/natives/?_0xFEBFBFDFB66039DE)
        fadeStartDistance = 100.0,  -- distance at which thermal vision starts to fade out (https://docs.fivem.net/natives/?_0xA78DE25577300BA1)
        fadeEndDistance = 120.0,    -- end distance at which thermal vision fades out (https://docs.fivem.net/natives/?_0x9D75795B9DC6EBBF)
    },

    goggles = {                     -- clothing component variations for goggles on/off for female/male (HATS ONLY)
        male = {
            {                       -- add multiple clothing component variations
                on = 116,           -- equal to the drawable id of the clothing component
                off = 117,
            },

            {
                on = 118,
                off = 119,
            },

            {
                on = 147,
                off = 148,
            },
        },

        female = {
            {
                on = 116,
                off = 117,
            }
        }
    }
}