--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
Config = {}
-- Temperature Settings
Temperature   = {
  Format      = 'C',                          -- Set it to C or F
  Max         = 32,                           -- Max Temp before losing more vitals stats.
  Min         = -10,                          -- Min Temp before losing more vitals stats.
  ColdDamage  = { Water = 0.05, Food = 0.15 }, -- Amount of drain per second below min Temp
  HotDamage   = { Water = 0.15, Food = 0.1}, -- Amount of drain per second above max Temp
}

-- Food Settings
Food = {
  DrainIdle = 0.02,                           -- Amount of drain when standing still
  DrainRunning = 0.04,                        -- Amount of drain when running
  DrainWalking = 0.03,                        -- Amount of drain when walking
  LoseWhen = 10.0,                            -- Losing innercore health below this threshold
  DamagePerSec = 1.0,                         -- Amount of damage on innercore health per second.
}

-- Water Settings
Water = {
  DrainIdle = 0.02,                            -- Amount of drain when standing still
  DrainRunning = 0.04,                         -- Amount of drain when running
  DrainWalking = 0.03,                         -- Amount of drain when walking
  LoseWhen = 10.0,                             -- Losing innercore health below this threshold
  DamagePerSec = 1.0,                          -- Amount of damage on innercore health per second.
}

Config.Locais = {
  {x=-309.2,y=806.9,z=119.0,range=20}, -- VALENTINE SALOON
  {x= 1346.03, y = -1373.72, z = 80.48, range = 20}, -- RHODES SALOON
  {x = 2633.719, y = -1227.71, z = 53.378,range = 20}, --- SD SALOON
  {x = -818.960, y = -1319.52, z = 43.520, range = 20}, -- BW SALOON
  {x = -3702.38, y = -2595.95, z = -13.82, range = 20}, -- ARMADILLO SALOON
  {x = -1818.61, y = -369.3, z = 163.3, range = 20}, -- STRAWBERRy
  {x = 455.13, y = 2244.0, z = 249.0, range = 50}, -- Indios Acima do Mapa
  {x = -2691.66, y = -1480.68, z = 148.14, range = 50}, -- Indios Bw
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- ATTENTION --
-- I am still busy with expanding this script and giving it more
-- functionality. Visit my Github regularly to see if there are new updates.
-- Thank you for using this script, I hope you enjoy :)
--------------------------------------------------------------------------------
