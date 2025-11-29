ESX = nil

ESX = exports['es_extended']:getSharedObject()

_menuPool = NativeUI.CreatePool()
local isNearMoneyWash = false

Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Locations) do
            local dist = Vdist(playerCoords, v[1], v[2], v[3])
            if dist < 1.5 then
                IsNearMoneyWash = true
            end
        end


        Citizen.Wait(350)
    end
end)

Citizen.CreateThread(function()
    while true do

        _menuPool:ProcessMenus()
        isNearMoneyWash = false

        if isNearMoneyWash then
            showHelp("Drücke ~INPUT_CONTEXT~ um dein ~y~Geld ~s~zu waschen")
            local distance = Vdist(playercoords, v.x, v.y, v.z)
            if distance < 8 then 
                DrawMarker(1, v.x - 0.2, v.y - 0.8, v.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.5, 0, 191, 255, 100, false, true, 2, false, nil, nil, false)
                if distance < 2.5 then 
                    if IsControlJustPressed(0, 38) then
                        OpenMoneyWash()
                    end
            elseif _menuPool:IsAnyMenuOpen() then
                _menuPool:CloseAllMenus()
            end
        end

        Citizen.Wait(1)
    end
end)

function OpenMoneyWash()
    local mainmenu = NativeUI.CreateMenu('Geld Wäsche',"Wechselrate ~b~ 1:2")
    _menuPool:Add(mainmenu)

    local money = NativeUI.CreateItem('Dein Geld waschen...', '~b~')
    mainmenu:AddItem(money)

    money.Activated = function(sender, index)
        local input = CreateDialog('Wie viel waschen?')
        input = tonumber(input)
        if input ~= nil and input > 0 then
            TriggerServerEvent('moneywash:wash', input)
        end
    end
end

function showHelp(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    EndTextCommandDisplayHelp(0,0,1,-1)
end
