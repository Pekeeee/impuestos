ESX = nil

AddEventHandler('onResourceStart', function(resourceName)
    print ("^2===================================================")
    print ("^1    impuestos-peke :)")
    print ("^1 Esta es la version 1.0.0")
    print ("^1      Pekeee#0860")
    print ("^1        © Pekeee")
    print ("^2===================================================")



end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


    CreateThread(function ()
        while true do
            Wait(Config.tiempo)
            local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
            local banco = xPlayer.getAccount('bank').money
                if Config.billing == false then
                    if banco < Config.cobrar then
            
                    TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, ('Impuestos'), ('~r~No pagaste'), ('~r~No tienes suficiente dinero para pagar tus impuestos'), 'CHAR_BANK_MAZE', 9)


                    else 
              
                    xPlayer.removeAccountMoney('bank', Config.cobrar)
                    TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, ('Impuestos'), ('~g~Pagaste'), ('Pagaste $'..Config.cobrar.. ' de impuestos'), 'CHAR_BANK_MAZE', 9)
           
                    end

                else

                    TriggerClientEvent('activar-impuestos', xPlayer.source)
                    
                end
            end
        end
        
    end)
    
