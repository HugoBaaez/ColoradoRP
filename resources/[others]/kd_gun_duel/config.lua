Config = {}

Config.CommandDuel1 = ""
Config.CommandDuel2 = "duel2"

Config.Debug = false
Config.DurationRequest = 10000
Config.MinTimeGong = 2000
Config.MaxTimeGong = 4000
Config.CanDamage = false
Config.GongAudio = {
  ref = "TOWN_SECRET_SOUNDS",
  name = "SECRET_FOUND"
}
Config.Music = {
  Name = "duel",
  Volume = 0.5,
  StartFocusTarget = false,
  SwitchPlanTimer = {5500,11300},
  Duration = 11000
}
Config.DefaultWeapon = false -- turn it to false to not give weapon
Config.DrawWithPrompt = true
Config.Keys = {
  Accept = "INPUT_INTERACT_ANIMAL",
  Draw = "INPUT_INTERACT_OPTION1"
}
Config.ForceRagdoll = true


-- Function to test if player have weapon to the duel
Config.HaveWeapon = function()
  return true
end