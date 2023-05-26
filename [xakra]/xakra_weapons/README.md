# xakra_weapons
# Requirements:
- oxmysql
- vorp_core
- menuapi
- vorp_progressbar
- vorp_inputs

# Description:
This script is a weapons system, ammunition system, you can configure the name of the items, maximum amount of ammunition and how much each item gives.

Weapon customization will be visible to all players, and will not be compatible with weapon customization from other scripts.

Weapon status will be permanent when players re-equip the weapon. You will be able to inspect and see the states of the weapon. They will have to clean the weapon so that it is in perfect condition. There is also a chance to enable breakable weapons when the weapon has no condition.

The crafting of gunsmiths and weapon customization you can configure which jobs and grade can be accessed in each location or allow access to all players.

The shop and craft settings work by location to make setup easier. Each crafting or product in the weapons store you can choose in which locations they will be available. For example, you can put the Navy revolver can only be bought or crafted in the Rhodes armory. There is also an experience system in the shop, which uses the vorp experience system.

You will be able to choose the required and reward experience of each weapon and ammo in the crafting gunsmith menu.

Gun shops will close and open the hours that you indicate in each location.

Attention: If you previously have weapon customizations you will need to remove them to use this script.

In the Config file you can configure:
- The language (Spanish and English by default)
- Custom, store and craft webhooks
- The hash of all the keys in the script
- Enable or disable weapon status (degradation, dirt, soot and damage).
- Enable or disable breakable weapons. (If enabled, weapons that have no condition will be removed.)
- Enable or disable experience system the crafting menu
- Enable or disable the display of the weapon's ID when inspecting it.
- A list of items to clean the weapon and if they are consumed when using it or not.
- The color of the store blips ('yellow', 'white', 'green', 'blue', 'red', 'purple', 'orange', 'pink', 'grey')
- Progress bar settings (animation time, progress bar type and color)
- All armory locations: location name, customization location, component black list, weapons white list, crafting location, jobs and grade for customization and crafting, shop location (location, blip, hours, and npc)
- The price of customizations (money or gold)
- Ammunition list (Item name, maximum amount of ammunition and amount of ammunition per item)
- List of weapons and ammo from shops, price [money, gold and rol], required experience and list of locations
- Weapon and ammo crafting list (weapon or item name, location list, choose price for crafting [money, gold, rol or disable], required and reward experience, crafting recipe)

# Instructions to incorporate script:
- Copy the script into a folder (to choose) from the 'resources' folder.
- Add 'ensure xakra_weapons' in the 'Resources.cfg' document
- If you already had customizations from another script, run the 'DELETE EXISTING COMPONENTS' query from the '/config/ammo.sql' file to remove the old weapon customizations.
- Adapt the script to your server by changing the configuration of the 'config' files.
- If you don't want the weapons status to disappear when you drop the weapon to the ground through the vorp inventory. You should either use this version of vorp_inventory or just replace '/server/services' or '/server/services/inventoryApiService.lua' and '/server/services/inventoryService.lua': https://github.com/XakraD/vorp_inventory-lua

Video: https://youtu.be/I4AgIIMH95k