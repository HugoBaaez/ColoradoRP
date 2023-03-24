Config = {}

Config.UseTeleports = true
Config.Blips = false --true

-- Change interior_sets with the interior you want at that location
-- https://github.com/femga/rdr3_discoveries/blob/399df3278b5101af1044f205c045648d2c8bcb38/interiors/interior_sets/README.md

Config.Shacks = {

    ['lemoyne'] = {
        ['outside'] = vector3(-314.6, 815.0, 119.0),
        ['inside'] = vector3(1785.01,-821.53,191.01),
        ['interior'] = 77313,
        ['interior_sets'] = {
            "mp006_mshine_band2",
            "mp006_mshine_bar_benchAndFrame",
            --"mp006_mshine_dressing_1",
            "mp006_mshine_hidden_door_open",
            --"mp006_mshine_location1",
            "mp006_mshine_pic_02",
            "mp006_mshine_shelfwall1",
            "mp006_mshine_shelfwall2",
            "mp006_mshine_Still_02",
            "mp006_mshine_still_hatch",
            "mp006_mshine_theme_floral",
        },
    },

    ['cattail_pond'] = {
        ['outside'] = vector3(-1085.63, 714.14, 103.32),
        ['inside'] = vector3(-1085.63, 714.14, 83.23),
        ['interior'] = 77569,
        ['interior_sets'] = {
            "mp006_mshine_band2",
            "mp006_mshine_bar_benchAndFrame",
            --"mp006_mshine_dressing_1",
            "mp006_mshine_hidden_door_open",
            --"mp006_mshine_location1",
            "mp006_mshine_pic_02",
            "mp006_mshine_shelfwall1",
            "mp006_mshine_shelfwall2",
            "mp006_mshine_Still_02",
            "mp006_mshine_still_hatch",
            "mp006_mshine_theme_goth",
        },
    },

    --['new_austin'] = {
        --['outside'] = vector3(-2769.3, -3048.87, 10.38),
        --['inside'] = vector3(-2769.3, -3048.87, -9.7),
        --['interior'] = 78337,
        --['interior_sets'] = {
            --"mp006_mshine_band2",
            --"mp006_mshine_bar_benchAndFrame",
            --"mp006_mshine_dressing_1",
            --"mp006_mshine_hidden_door_open",
            --"mp006_mshine_location1",
            --"mp006_mshine_pic_02",
            --"mp006_mshine_shelfwall1",
            --"mp006_mshine_shelfwall2",
            --"mp006_mshine_Still_02",
            --"mp006_mshine_still_hatch",
            --"mp006_mshine_theme_refined",
        --},
    --},

    ['hanover'] = {
        ['outside'] = vector3(1627.64, 822.9, 144.03),
        ['inside'] = vector3(1627.64, 822.9, 123.94),
        ['interior'] = 78593,
        ['interior_sets'] = {
            "mp006_mshine_band1",
            "mp006_mshine_bar_benchAndFrame",
            --"mp006_mshine_dressing_3",
            "mp006_mshine_hidden_door_open",
            --"mp006_mshine_location2",
            "mp006_mshine_pic_04",
            "mp006_mshine_shelfwall1",
            "mp006_mshine_shelfwall2",
            "mp006_mshine_Still_03",
            "mp006_mshine_still_hatch",
            "mp006_mshine_theme_hunter",
        },
    },

    ['manzanita_post'] = {
        ['outside'] = vector3(2639.1, -1230.4, 53.4),
        ['inside'] = vector3(-1861.7, -1722.17, 88.35),
        ['interior'] = 77825,
        ['interior_sets'] = {
            "mp006_mshine_band2",
            "mp006_mshine_bar_benchAndFrame",
            --"mp006_mshine_dressing_1",
            "mp006_mshine_hidden_door_open",
            --"mp006_mshine_location1",
            "mp006_mshine_pic_02",
            "mp006_mshine_shelfwall1",
            "mp006_mshine_shelfwall2",
            "mp006_mshine_Still_02",
            "mp006_mshine_still_hatch",
            "mp006_mshine_theme_refined",
        },
    },
    ['igreja'] = {
        ['outside'] = vector3(-974.561, -1180.75, 58.889),
        ['inside'] = vector3(-973.068, -1183.71, 49.888),
        ['interior'] = 0,
        ['interior_sets'] = {},
    },
    ['medicobw'] = {
        ['outside'] = vector3(-790.897, -1304.68, 43.637),
        ['inside'] = vector3(-792.079, -1304.93, 31.317),
        ['interior'] = 0,
        ['interior_sets'] = {},
    },
    ['newspaper'] = {
        ['outside'] = vector3(2603.4, -1348.27, 49.72),
        ['inside'] = vector3(2605.66, -1351.28, 50.12),
        ['interior'] = 0,
        ['interior_sets'] = {},
    },
    ['medicoArmadillo'] = {
        ['outside'] = vector3(-3666.47, -2601.53, -13.58),
        ['inside'] = vector3(-3688.60, -2753.88, -31.38),
        ['interior'] = 0,
        ['interior_sets'] = {},
    },
    ['TpGuarma'] = {
        ['outside'] = vector3(1342.41, -6802.99, 47.37),
        ['inside'] = vector3(1755.85, -4692.0, 42.63),
        ['interior'] = 0,
        ['interior_sets'] = {},
    },
}
