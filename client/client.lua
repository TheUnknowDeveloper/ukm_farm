ESX = nil

ESX = exports['es_extended']:getSharedObject()

_menuPool  = NativeUI.CreatePool()

Citizen.CreateThread(function()
    for k, v in pairs(Config.Farm.Type) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, v.BlipNumber)
        SetBlipScale (blip, 0.7)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.BlipLabel)
        EndTextCommandSetBlipName(blip)
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        for k, v in pairs(Config.Farm.Type) do 
            local playerPed = PlayerPedId()
            local playercoords = GetEntityCoords(playerPed)
            local distance = Vdist(playercoords, v.x, v.y, v.z)
            if distance < 12 then 
                ShowHelp("Drücke ~INPUT_CONTEXT~ um ~y~" ..v.Label.. "~w~ zu farmen", true)
                if IsControlJustPressed(0, 38) then
                    local ped = PlayerPedId(-1)
                    TaskStartScenarioInPlace(ped, v.Anim, 0, true)
                    TriggerEvent("mythic_progbar:client:progress", {
                        name = "unique_action_name",
                        duration = v.Time,
                        label = "Farmen",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "world_human_gardener_plant",
                            anim = "idle_a",
                        },
                        prop = {
                            model = "prop_paper_bag_small",
                        }
                    }, function(status)
                        if not status then
                            ClearPedTasksImmediately(ped)
                            PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            PlaySoundFrontend(-1, "MEDAL_GOLD", "HUD_AWARDS", 0);
                            local item = v.Value 
                            local count = v.Count
                            notify("Du hast ~y~" ..v.Count.. "~w~ " ..v.Label .. " gefarmt")
                            TriggerServerEvent("farming:giveItem", item, count)
                        end
                    end)
                end 
            end
        end
    end
end)


-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Verkäufer 
-- ════════════════════════════════════════════════════════════════════════════════════ --

CreateThread(function()
    while true do
        Wait(1)
        if _menuPool:IsAnyMenuOpen() then
            _menuPool:ProcessMenus()
        else
            Wait(150)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        for k, v in pairs(Config.Shop.Pos) do  
            local playerPed = PlayerPedId()
            local playercoords = GetEntityCoords(playerPed)
            local distance = Vdist(playercoords, v.x, v.y, v.z)
            if distance < 8 then 
                DrawMarker(1, v.x - 0.2, v.y - 0.8, v.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.5, 0, 191, 255, 100, false, true, 2, false, nil, nil, false)
                if distance < 3.0 then 
                    ShowHelp("Drücke ~INPUT_CONTEXT~ um mit dem ~y~Käufer~w~ zu sprechen", true)
                    if IsControlJustReleased(0, 38) then
                        if distance < 3.0 then
                            OpenSellerMenu()
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Shop.Pos) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 280)
		SetBlipScale (blip, 1.0)
		SetBlipColour(blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.BlipLabel)
		EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_shopkeep_01")
    while not HasModelLoaded(hash) do 
        RequestModel(model)
        Citizen.Wait(20)
    end 
    for k, v in pairs(Config.Shop.Pos) do 
        ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", v.x, v.y, v.z - 1, v.a, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Verarbeiter
-- ════════════════════════════════════════════════════════════════════════════════════ --

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_shopkeep_01")
    while not HasModelLoaded(hash) do 
        RequestModel(model)
        Citizen.Wait(20)
    end 
    for k, v in pairs(Config.Shop.Pos) do 
        ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", v.x, v.y, v.z - 1, v.a, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)

function OpenVerarbeiterMenu()
     mainmenu = NativeUI.CreateMenu('Menu-Name', 'Menu-Description')
    
    _menuPool:Add(mainmenu)
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled(false)
    _menuPool:MouseEdgeEnabled(false)
    _menuPool:ControlDisablingEnabled(false)
    mainmenu:Visible(true)

    local orage_juice = NativeUI.CreateItem('Orangensaft', 'Verarbeite 2 Orangen zu Orangensaft')
    mainmenu:AddItem(orage_juice)
end


--legalen route, drogen routen, waffen routen


-- ════════════════════════════════════════════════════════════════════════════════════ --
-- NativeUI
-- ════════════════════════════════════════════════════════════════════════════════════ --

function OpenSellerMenu()
    mainmenu = NativeUI.CreateMenu("Verkäufer","Verkaufe hier deine sachen")
	_menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)
    local sell1 = NativeUI.CreateItem("6x Kartoffeln verkaufen", "Beschreibung")
    sell1:RightLabel("~r~$5-$9")
    sell1.Activated = function(sender, index)
        local price = math.random(5, 9)
        --TriggerServerEvent('farming:sell', 'Brot','bread', price)
        TriggerServerEvent('farming:sell', 'Kartoffel','potato', price)

    end
    mainmenu:AddItem(sell1)
    local sell2 = NativeUI.CreateItem("6x Orangen verkaufen", "Beschreibung")
    sell2:RightLabel("~r~$6-$8")
    sell2.Activated = function(sender, index)
        local price = math.random(6, 8)

        TriggerServerEvent('farming:sell', 'Orangen','orage', price)

    end
    mainmenu:AddItem(sell2)
    local sell3 = NativeUI.CreateItem("6x Orangensaft verkaufen", "Beschreibung")
    sell3:RightLabel("~r~$12-$24")
    sell3.Activated = function(sender, index)
        local price = math.random(12, 24)

        TriggerServerEvent('farming:sell', 'OrangenSaft','orage_juice', price)

    end
    mainmenu:AddItem(sell3)
end

function OpenMenu()
    mainmenu = NativeUI.CreateMenu("Test", "t")
    _menuPool:Add(mainmenu)
	_menuPool:RefreshIndex()
	_menuPool:MouseControlsEnabled (false)
	_menuPool:MouseEdgeEnabled (false)
	_menuPool:ControlDisablingEnabled(false)
	mainmenu:Visible(true)
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end


function ShowHelp(text, bleep)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, bleep, -1)
end
