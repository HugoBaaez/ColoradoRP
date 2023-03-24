
-------------------- LOJA DE MOBILIAS
-------------------- LOJA DE MOBILIAS
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        if (Vdist(coords.x, coords.y, coords.z, -867.196, -1288.72, 43.100) < 1.0) then  
            DrawTxt("Pressione [~e~G~q~] para comprar as mobilias.", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then -- g
                WarMenu.OpenMenu('loja')
            end
        end
        if (Vdist(coords.x, coords.y, coords.z, 2859.417, -1199.95, 49.692) < 1.0) then  
            DrawTxt("Pressione [~e~G~q~] para comprar as mobilias.", 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then -- g
                WarMenu.OpenMenu('loja2')
            end
        end
    end
end)

local blips = {
    {  sprite = 1012165077, x = 2859.417, y = -1199.95, z = 49.692 },
    {  sprite = 1012165077, x=-867.196, y=-1288.72, z=43.100 },
}
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        local blip = N_0x554d9d53f696d002(1664425300, info.x, info.y, info.z)
        SetBlipSprite(blip, info.sprite, 1)
        SetBlipScale(blip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Mobilias")
    end  
end)
Citizen.CreateThread(function() 
    WarMenu.CreateMenu("loja", "Mobilias")
    WarMenu.CreateMenu("shop", "Mobilias de Casa")
    WarMenu.CreateMenu("shop2", "Mobilias de Acampmento")
    
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('loja') then

            if WarMenu.Button("Mobilias de Casa") then
                WarMenu.OpenMenu('shop')
            elseif WarMenu.Button('Mobilias de Acampmento') then
                WarMenu.OpenMenu('shop2') 
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('shop') then

            if WarMenu.Button("Cadeira de madeira $10") then

                TriggerServerEvent('shop:compra', 10, "woodchair")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de couro $10") then

                TriggerServerEvent('shop:compra', 10, "leatherchair")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa redonda $20") then

                TriggerServerEvent('shop:compra', 20, "roundtable")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa $20") then 

                TriggerServerEvent('shop:compra', 20, "normaltable")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa retângular $20") then 

                TriggerServerEvent('shop:compra', 20, "rectable")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de Madeira $20") then 

                TriggerServerEvent('shop:compra', 20, "timbertable")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fogueira $25") then 

                TriggerServerEvent('shop:compra', 25, "craftingfire")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caldeirão $25") then 

                TriggerServerEvent('shop:compra', 25, "pota")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Bomba de água $500") then 

                TriggerServerEvent('shop:compra', 500, "waterpump")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixas de flores $5") then 

                TriggerServerEvent('shop:compra', 5, "flowerboxes")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pele de veado $10") then 

                TriggerServerEvent('shop:compra', 10, "deerpelt")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pele de Coiote $10") then 

                TriggerServerEvent('shop:compra', 10, "coyotepelt")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixa de cobertor $5") then 

                TriggerServerEvent('shop:compra', 5, "blanketbox")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de Armas $10") then 

                TriggerServerEvent('shop:compra', 10, "gbarrelx")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de maçã $5") then 

                TriggerServerEvent('shop:compra', 5, "applebarrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cesta de maçã $5") then 

                TriggerServerEvent('shop:compra', 5, "applebasket")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de comida $5") then 

                TriggerServerEvent('shop:compra', 5, "foodbarrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Balde de Banho $5") then 

                TriggerServerEvent('shop:compra', 5, "washtub")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Varal de roupas $5") then 

                TriggerServerEvent('shop:compra', 5, "clothesline")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de ferramentas $10") then 

                TriggerServerEvent('shop:compra', 10, "toolbarrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Coyote Empalhado $25") then 

                TriggerServerEvent('shop:compra', 25, "coyotetaxi")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Faisão Empalhado $10") then 

                TriggerServerEvent('shop:compra', 10, "phestaxi")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Veado Empalhado $15") then 

                TriggerServerEvent('shop:compra', 15, "deertaxi")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Puma Empalhado $30") then 

                TriggerServerEvent('shop:compra', 30, "cougartaxi")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Abutre Empalhado $10") then 

                TriggerServerEvent('shop:compra', 10, "vulturetaxi")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de urso $30") then 

                TriggerServerEvent('shop:compra', 30, "bearbench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira 1 $10") then 

                TriggerServerEvent('shop:compra', 10, "logbench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira 2 $10") then 

                TriggerServerEvent('shop:compra', 10, "logbechs")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de pano $15") then 

                TriggerServerEvent('shop:compra', 15, "clothbench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira $20") then 

                TriggerServerEvent('shop:compra', 20, "woodbench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de vime $25") then 

                TriggerServerEvent('shop:compra', 25, "wickerbench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Madeira marrom $25") then 

                TriggerServerEvent('shop:compra', 25, "bwdresser")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Espelho marrom $35") then 

                TriggerServerEvent('shop:compra', 35, "bmdresser")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de cabeceira $20") then 

                TriggerServerEvent('shop:compra', 20, "nightstand")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 1 $15") then 

                TriggerServerEvent('shop:compra', 15, "sidetable")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 2 $15") then 

                TriggerServerEvent('shop:compra', 15, "sidetablea")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 3 $15") then 

                TriggerServerEvent('shop:compra', 15, "sidetableb")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Lanterna $10") then 

                TriggerServerEvent('shop:compra', 10, "lanterna")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela dbl $5") then 

                TriggerServerEvent('shop:compra', 5, "dbcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela $5") then 

                TriggerServerEvent('shop:compra', 5, "candlea")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pequena vela derretida $5") then 

                TriggerServerEvent('shop:compra', 5, "smallmcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela de garrafa $5") then 

                TriggerServerEvent('shop:compra', 5, "bcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama velha $10") then 

                TriggerServerEvent('shop:compra', 10, "obed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Beliche $20") then 

                TriggerServerEvent('shop:compra', 20, "bunkbed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama de solteiro $30") then 

                TriggerServerEvent('shop:compra', 30, "singlebed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama extravagante $50") then 

                TriggerServerEvent('shop:compra', 50, "fancydouble")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Baú A  $50") then

                TriggerServerEvent('shop:compra', 50, "chesta")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Baú B  $50") then

                TriggerServerEvent('shop:compra', 50, "chestb")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('shop2') then
            if WarMenu.Button("Tipi nativo  $10") then

                TriggerServerEvent('shop:compra', 10, "tipi")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tenda do trader  $10") then

                TriggerServerEvent('shop:compra', 10, "tent2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tenda simples  $10") then

                TriggerServerEvent('shop:compra', 10, "tent3")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Sombra de tela  $10") then

                TriggerServerEvent('shop:compra', 10, "tent4")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Apanhador de Sonhos  $10") then

                TriggerServerEvent('shop:compra', 10, "dreamcatcher")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pote nativo  $10") then

                TriggerServerEvent('shop:compra', 10, "nativepot")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cesta nativa 1  $10") then

                TriggerServerEvent('shop:compra', 10, "nativepot")
                WarMenu.CloseMenu()

            elseif WarMenu.Button("Cesta nativa 2  $10") then

                TriggerServerEvent('shop:compra', 10, "nativebasket2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Decoração nativa 1  $10") then

                TriggerServerEvent('shop:compra', 10, "nativeskull")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Poste de crânio  $10") then

                TriggerServerEvent('shop:compra', 10, "skullpost")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de lounge  $10") then

                TriggerServerEvent('shop:compra', 10, "loungechair")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de lounge 2  $10") then

                TriggerServerEvent('shop:compra', 10, "loungechair2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de tabela de pôquer  $10") then

                TriggerServerEvent('shop:compra', 10, "pokerset")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tenda de decoração 1 conjunto  $10") then

                TriggerServerEvent('shop:compra', 10, "decortent1")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tenda de decoração 2 conjunto  $10") then

                TriggerServerEvent('shop:compra', 10, "decortent2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tenda de decoração 3 conjunto  $10") then

                TriggerServerEvent('shop:compra', 10, "decortent3")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de planejamento de roubo  $10") then

                TriggerServerEvent('shop:compra', 10, "robberyplanning")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de carroças naturalistas  $10") then

                TriggerServerEvent('shop:compra', 10, "naturalwagon")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Poste de lâmpada 1 conjunto  $10") then

                TriggerServerEvent('shop:compra', 10, "lamppost1")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Poste de lâmpada 2 conjunto  $10") then

                TriggerServerEvent('shop:compra', 10, "lamppost2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de acampamento de montanha  $10") then

                TriggerServerEvent('shop:compra', 10, "mountainmen")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixão  $10") then

                TriggerServerEvent('shop:compra', 10, "undertaker1")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixão de Flores  $10") then

                TriggerServerEvent('shop:compra', 10, "undertaker2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Balcão de cozinha  $10") then

                TriggerServerEvent('shop:compra', 10, "kitchencounter")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tocha permanente  $10") then

                TriggerServerEvent('shop:compra', 10, "standingtorch")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Tiro ao alvo  $10") then

                TriggerServerEvent('shop:compra', 10, "shootingtarget")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de servir  $10") then

                TriggerServerEvent('shop:compra', 10, "trayoffood")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Baú A  $250") then

                TriggerServerEvent('shop:compra', 250, "chesta")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Baú B  $100") then

                TriggerServerEvent('shop:compra', 100, "chestb")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Baú C  $500") then

                TriggerServerEvent('shop:compra', 500, "chestc")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de mesa de pôquer  $100") then

                TriggerServerEvent('shop:compra', 100, "pokerset")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Poste de amarração  $100") then

                TriggerServerEvent('shop:compra', 100, "hitchingpost")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de açougueiro grande  $1000") then

                TriggerServerEvent('shop:compra', 1000, "butchertable3")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de açougue média  $650") then

                TriggerServerEvent('shop:compra', 650, "butchertable2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de açougueiro pequena  $100") then

                TriggerServerEvent('shop:compra', 100, "butchertable1")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de decoração nativa  $10") then

                TriggerServerEvent('shop:compra', 10, "nativedecor")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Conjunto de carroça cigana  $10") then

                TriggerServerEvent('shop:compra', 10, "gypsywagon")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixa de cerveja  $10") then

                TriggerServerEvent('shop:compra', 10, "beerbox")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de água  $10") then

                TriggerServerEvent('shop:compra', 10, "waterbarrel")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barraca do Caçador de Recompensas  $10") then

                TriggerServerEvent('shop:compra', 10, "tent")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de madeira $10") then

                TriggerServerEvent('shop:compra', 10, "wood_chair")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de couro $10") then

                TriggerServerEvent('shop:compra', 10, "leather_chair")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa redonda $20") then

                TriggerServerEvent('shop:compra', 20, "round_table")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa $20") then 

                TriggerServerEvent('shop:compra', 20, "standard_table")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa $20") then 

                TriggerServerEvent('shop:compra', 20, "standard_table")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa retângular $20") then 

                TriggerServerEvent('shop:compra', 20, "rectangle_table")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de Madeira $20") then 

                TriggerServerEvent('shop:compra', 20, "timber_table")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fogueira $25") then 

                TriggerServerEvent('shop:compra', 25, "crafting_fire")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caldeirão $25") then 

                TriggerServerEvent('shop:compra', 25, "pota")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Bomba de água $500") then 

                TriggerServerEvent('shop:compra', 500, "water_pump")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixas de flores $5") then 

                TriggerServerEvent('shop:compra', 5, "flowerboxes")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pele de veado $10") then 

                TriggerServerEvent('shop:compra', 10, "deer_pelt")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pele de Coiote $10") then 

                TriggerServerEvent('shop:compra', 10, "coyote_pelt")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixa de cobertor $5") then 

                TriggerServerEvent('shop:compra', 5, "blanket_box")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de Armas $10") then 

                TriggerServerEvent('shop:compra', 10, "gun_barrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de maçã $5") then 

                TriggerServerEvent('shop:compra', 5, "apple_barrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cesta de maçã $5") then 

                TriggerServerEvent('shop:compra', 5, "apple_basket")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de comida $5") then 

                TriggerServerEvent('shop:compra', 5, "food_barrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Balde de Banho $5") then 

                TriggerServerEvent('shop:compra', 5, "washtub")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Varal de roupas $5") then 

                TriggerServerEvent('shop:compra', 5, "clothes_line")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Barril de ferramentas $10") then 

                TriggerServerEvent('shop:compra', 10, "tool_barrel")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Coyote Empalhado $25") then 

                TriggerServerEvent('shop:compra', 25, "coyote_taxidermy")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Faisão Empalhado $10") then 

                TriggerServerEvent('shop:compra', 10, "pheasant_taxidermy")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Veado Empalhado $15") then 

                TriggerServerEvent('shop:compra', 15, "deer_taxidermy")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Puma Empalhado $30") then 

                TriggerServerEvent('shop:compra', 30, "cougar_taxidermy")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Abutre Empalhado $10") then 

                TriggerServerEvent('shop:compra', 10, "vulture_taxidermy")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de urso $30") then 

                TriggerServerEvent('shop:compra', 30, "bear_bench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira 1 $10") then 

                TriggerServerEvent('shop:compra', 10, "log_bencha")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira 2 $10") then 

                TriggerServerEvent('shop:compra', 10, "log_benchb")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de pano $15") then 

                TriggerServerEvent('shop:compra', 15, "cloth_bench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de madeira $20") then 

                TriggerServerEvent('shop:compra', 20, "wooden_bench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Banco de vime $25") then 

                TriggerServerEvent('shop:compra', 25, "wicker_bench")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Madeira marrom $25") then 

                TriggerServerEvent('shop:compra', 25, "bwdresser")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Espelho marrom $35") then 

                TriggerServerEvent('shop:compra', 35, "bmdresser")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de cabeceira $20") then 

                TriggerServerEvent('shop:compra', 20, "nightstand")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 1 $15") then 

                TriggerServerEvent('shop:compra', 15, "side_table")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 2 $15") then 

                TriggerServerEvent('shop:compra', 15, "side_tablea")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de apoio 3 $15") then 

                TriggerServerEvent('shop:compra', 15, "side_tableb")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Lanterna $10") then 

                TriggerServerEvent('shop:compra', 10, "lanterna")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela dbl $5") then 

                TriggerServerEvent('shop:compra', 5, "dbcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela $5") then 

                TriggerServerEvent('shop:compra', 5, "candlea")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pequena vela derretida $5") then 

                TriggerServerEvent('shop:compra', 5, "smallmcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Vela de garrafa $5") then 

                TriggerServerEvent('shop:compra', 5, "bcandle")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama velha $10") then 

                TriggerServerEvent('shop:compra', 10, "obed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Beliche $20") then 

                TriggerServerEvent('shop:compra', 20, "bunkbed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama de solteiro $30") then 

                TriggerServerEvent('shop:compra', 30, "singlebed")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama extravagante $50") then 

                TriggerServerEvent('shop:compra', 50, "fancydouble")
    
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        end
    end

end)

Citizen.CreateThread(function() 
    WarMenu.CreateMenu("loja2", "Mobilias")
    WarMenu.CreateMenu("shop3", "Mobilias para Casa")
    
    while true do
        Wait(0)
        if WarMenu.IsMenuOpened('loja2') then

            if WarMenu.Button("Mobilias para Casa") then
                WarMenu.OpenMenu('shop3')
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('shop3') then
            if WarMenu.Button("Mesa de Festas $500") then

                TriggerServerEvent('shop:compra', 500, "mesafestas")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Armario com Livros  $80") then

                TriggerServerEvent('shop:compra', 80, "ArmLivros")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("FLORES COM MESINHA  $15") then

                TriggerServerEvent('shop:compra', 15, "flormesa")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("SUPORTE PARA PENDURAR CASACO  $40") then

                TriggerServerEvent('shop:compra', 40, "suproupas")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Abajur  $30") then

                TriggerServerEvent('shop:compra', 30, "abajur")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("VARAL DE PEIXE  $10") then

                TriggerServerEvent('shop:compra', 10, "varalpeixe")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("cadeira de veludo vermelha  $50") then

                TriggerServerEvent('shop:compra', 50, "Cadveludo")
                WarMenu.CloseMenu()

            elseif WarMenu.Button("Placa de nao ultrapasse  $15") then

                TriggerServerEvent('shop:compra', 15, "naopasse")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa redonda de jantar  $300") then

                TriggerServerEvent('shop:compra', 300, "mesared")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de escritorio pequena  $100") then

                TriggerServerEvent('shop:compra', 100, "mesaescritP")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de escritorio média  $200") then

                TriggerServerEvent('shop:compra', 200, "mesaescritM")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de Escrtitório  $100") then

                TriggerServerEvent('shop:compra', 100, "cadescrit")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Suporte de canetas  $20") then

                TriggerServerEvent('shop:compra', 20, "supcanetas")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Guarda roupas  $40") then

                TriggerServerEvent('shop:compra', 40, "groupas")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Sofa de luxo  $500") then

                TriggerServerEvent('shop:compra', 500, "sofaluxo")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Quadro de arte  $100") then

                TriggerServerEvent('shop:compra', 100, "qArte1")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Piano $1000") then

                TriggerServerEvent('shop:compra', 1000, "piano")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de espumante  $300") then

                TriggerServerEvent('shop:compra', 300, "mesaespu")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Pia com bomba d'agua  $30") then

                TriggerServerEvent('shop:compra', 30, "pia")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa retangular  $30") then

                TriggerServerEvent('shop:compra', 30, "mesaretangular")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama de solteiro  $30") then

                TriggerServerEvent('shop:compra', 30, "camasolteiro")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cortina para janela  $35") then

                TriggerServerEvent('shop:compra', 35, "cortina")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Relogio chique  $200") then

                TriggerServerEvent('shop:compra', 200, "relogiocasa")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Sofa de luxo refinado  $500") then

                TriggerServerEvent('shop:compra', 500, "sofarefinado")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de madeira  $10") then

                TriggerServerEvent('shop:compra', 10, "cadmadeira")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Armario de cozinha   $70") then

                TriggerServerEvent('shop:compra', 70, "armcozinha")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixa de charuto  $100") then

                TriggerServerEvent('shop:compra', 100, "cxcharuto")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira de madeira de luxo  $100") then

                TriggerServerEvent('shop:compra', 100, "cdluxo")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cofre medio  $400") then

                TriggerServerEvent('shop:compra', 400, "cofreM")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Mesa de escritorio grande  $400") then

                TriggerServerEvent('shop:compra', 400, "mesaescritG")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cesta de pao  $20") then

                TriggerServerEvent('shop:compra', 20, "cestopao")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Caixa de espumante  $50") then

                TriggerServerEvent('shop:compra', 50, "cxespumante")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Quadro grande  $250") then

                TriggerServerEvent('shop:compra', 250, "qArte2")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Items para escritorio  $40") then

                TriggerServerEvent('shop:compra', 40, "itensescrit")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Berrante  $30") then

                TriggerServerEvent('shop:compra', 30, "berrante")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Luminaria lunar  $60") then

                TriggerServerEvent('shop:compra', 60, "lumLunar")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Lampiao para cavalos  $50") then

                TriggerServerEvent('shop:compra', 50, "lampcavalos")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Jacare empalhado  $40") then

                TriggerServerEvent('shop:compra', 40, "jacareemp")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Relogio pequeno  $60") then

                TriggerServerEvent('shop:compra', 60, "relogiocasaP")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama de solteiro de luxo  $100") then

                TriggerServerEvent('shop:compra', 100, "camasoltluxo")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Aguia empalhada $40") then

                TriggerServerEvent('shop:compra', 40, "aguiaemp")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cranio de Veado $30") then

                TriggerServerEvent('shop:compra', 30, "cranioboi")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cadeira branca e dourada $70") then

                TriggerServerEvent('shop:compra', 70, "cadbranca")
                WarMenu.CloseMenu()
            elseif WarMenu.Button("Jacaré de jardim $40") then 

                TriggerServerEvent('shop:compra', 40, "jacarejardim")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Lustre maguinifico $100") then 

                TriggerServerEvent('shop:compra', 100, "lustrem")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Boneca de brinquedo $20") then 

                TriggerServerEvent('shop:compra', 20, "bonecabrinq")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Cama de luxo $300") then 

                TriggerServerEvent('shop:compra', 300, "camaluxo")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Ventilador  $150") then 

                TriggerServerEvent('shop:compra', 150, "ventilador")

                WarMenu.CloseMenu()
            elseif WarMenu.Button("Fechar") then
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        end
    end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end