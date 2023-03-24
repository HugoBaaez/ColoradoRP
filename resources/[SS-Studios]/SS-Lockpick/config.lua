-- Author '🆂🅸🆁🅴🅲#0336'
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --

Config = {
    
BulgarLockpick = false, -- IF HAVE BULGAR LOCKPICK MAKE TRUE !  

Framework = "vorp", -- CHOICE FRAMEWORK vorp / redemrp !
Lockpick = "lockpick", -- LOCKPICK ITEM NAME
UseGlobal = true, -- USE GLOBAL DOORS OR CUSTOM DOORS FROM
Distance = 2.0, -- DISTANCE FROM DOORS FOR LOCKPICK

Blacklist = {576950805, 3483244267, 1462330364},
    
Texts = {
        ["blacklisted"] = "É impossivel usar nesta porta!",
},

Doors = {
    [1] = {
    Name = "Valentine Bank",
    Doors = {2642457609, 3886827663},
    Coords = {-308.0721130371, 780.55975341796, 118.76265716552}    
    },
    [2] = {
    Name = "Valentine Store",
    Doors = {706990067},
    Coords = {-319.64428710938, 796.28894042968, 117.88626861572}    
    }
},
}    

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
TriggerEvent("vorp:TipBottom", text, 5000)       
end 
