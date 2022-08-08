ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function activar()
    

    Citizen.CreateThread(function()
        local amount = Config.cobrar
        local source = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))

        TriggerServerEvent('esx_billing:sendBill', source, 'society_impuestos', 'Impuestos', amount)
        
    end)

end


RegisterNetEvent('activar-impuestos')
AddEventHandler('activar-impuestos', function ()

    activar()

end)