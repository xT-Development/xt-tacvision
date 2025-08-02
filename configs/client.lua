return {
    keybinds = {                    -- keybinds for toggling nightvision, and thermal goggles
        toggleNightVision = 'F9',
        toggleThermal = 'F10'
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