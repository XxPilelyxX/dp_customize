--
--______     _ _                        _  ______ _ _ 
--|  _  \   | | |                      | | | ___ (_) |
--| | | |___| | | ___    __ _ _ __   __| | | |_/ /_| |
--| | | / _ \ | |/ _ \  / _` | '_ \ / _` | |  __/| | |
--| |/ /  __/ | |  __/ | (_| | | | | (_| | | |   | | |
--|___/ \___|_|_|\___|  \__,_|_| |_|\__,_| \_|   |_|_|
--       

local delay = 200

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(delay)
        for k,v in pairs(Config.Coords) do
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true) <= 2 do
                delay = 1
                Citizen.Wait(delay)
                DrawMarker(36, v.x, v.y, v.z, 0,0,0,0,0,0,1.0001,1.0001,1.0001, 155, 16, 35, 180,0,0,0,10)
                DrawText3Ds(v.x, v.y, v.z, "Tryk [~r~E~w~] for at bruge customizer")
                if IsControlJustReleased(0, 38) then 
                    if IsPedInVehicle(PlayerPedId(),GetVehiclePedIsIn(PlayerPedId()),true) == false then
                        exports['mythic_notify']:SendAlert('error', 'Du er ikke i et køretøj!')
                    else
                        TriggerServerEvent("dp_customize:group")
                    end
                end
            end
        end
        delay = 200
    end
end)

RegisterNetEvent("dp_customize:menuopen")
AddEventHandler("dp_customize:menuopen", function()
    SetNuiFocus(true, true)
    Citizen.Wait(100)
    SendNUIMessage({status = true,})
end)

RegisterNUICallback("farve1", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 39, 39)
end)

RegisterNUICallback("farve2", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 42, 42)
end)

RegisterNUICallback("farve3", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 55, 55)
end)

RegisterNUICallback("farve4", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 5, 5)
end)

RegisterNUICallback("farve5", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 148, 148)
end)

RegisterNUICallback("farve6", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 0, 0)
end)

RegisterNUICallback("farve7", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 121, 121)
end)

RegisterNUICallback("farve8", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 114, 114)
end)

RegisterNUICallback("farve9", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 135, 135)
end)    

RegisterNUICallback("farve10", function (data, callback)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed)
    SetVehicleColours(vehicle, 138, 138)
end)  

RegisterNUICallback("Luk", function (data, callback)
    SetNuiFocus(false, false)
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

AddEventHandler("onResourceStop",function(a)if a==GetCurrentResourceName()then SetNuiFocus(false,false) end end)
                
                                                    
