Config = {}

Config.Align = 'top-left' -- align to menu

Config.KeySteal = 0xC7B5340A

Config.StealHogtied = true -- Steal from hogtied players
Config.Cuffed = true  -- Steal from handcuffed players
Config.StealDead = true  -- Steal from dead players
Config.NoRob = {'police', 'doctor'}
Config.Webhook = 'https://discord.com/api/webhooks/988558308128489562/MTTbT0VaXPsGFWoeyqYyKlJ9C_2jU11wls-y4ZrA2a-BdPrqKuUEp8pxzimHYUlwNB51'

Config.ItemsBlackList = { -- Names of items or weapons that cannot be stolen
 --   'water',
 --   'WEAPON_MELEE_KNIFE',
}

Config.Texts = {
    ['StrPrompt'] = 'Roubar',
    ['DescStealMoney'] = 'Roubar dinhero',
    ['MenuTitle'] = 'Jogador',
    ['MenuSubtext'] = 'Escolha uma opção',
    ['Confirm'] = 'Confirmar',
    ['AmountMoney'] = 'Quantidade',
    ['Money'] = 'Dinheiro',
    ['Inventory'] = 'Inventário',
    ['DescStealInventory'] = 'Procurar no Inventário',
    ['NotStealCarryItems'] = 'Não pode carregar mais itens',
    ['NotStealCarryWeapon'] = 'Não pode carregar mais armas',
    ['NotCarryItems'] = 'Não pode carregar mais itens.',
    ['TooMuchMoney'] = 'Não pode pegar mais do que o jogador tem',
    ['StealMoney'] = 'Roubou: ',
    ['ItemInBlackList'] = 'Não pode roubar esse item.',
    ['WebHookTakeSteal'] = 'Roubou: ',
    ['WebHookMoveSteal'] = 'Devolveu no jogador: ',
    ['WebHookPlayer'] = ', Jogador: ',
}
