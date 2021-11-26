TriggerEvent("esx:getSharedObject", function(obj)   ESX = obj   end)

Citizen.CreateThread(function()
    for _, v in pairs(Config.Event) do
        RequestModel(GetHashKey(v.ped.label))
        while not HasModelLoaded(GetHashKey(v.ped.label)) do Wait(1) end
        ped = CreatePed(4, GetHashKey(v.ped.label), v.ped.pos, 3374176, false, true)
        SetEntityHeading(ped, v.ped.h)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        TaskStartScenarioInPlace(ped, v.ped.animation, 0, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        if v.plonge then
            RequestModel(GetHashKey(v.plonge.label))
            while not HasModelLoaded(GetHashKey(v.plonge.label)) do Wait(1) end
            ped = CreatePed(4, GetHashKey(v.plonge.label), v.plonge.pos, 3374176, false, true)
            SetEntityHeading(ped, v.plonge.h)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            TaskStartScenarioInPlace(ped, v.plonge.animation, 0, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        elseif v.crate then
            for _,z in pairs(v.crate) do
                local weaponbag = GetHashKey("ex_prop_crate_closed_bc")
                RequestModel(weaponbag)
                while not HasModelLoaded(weaponbag) do Wait(1) end
                local bag = CreateObjectNoOffset(weaponbag, z, 1, 0, 1)
                PlaceObjectOnGroundProperly(bag)
                Wait(10)
                FreezeEntityPosition(bag,true)
                SetModelAsNoLongerNeeded(bag)
            end
        end
    end
end)

RegisterNetEvent("hEvents:start")
AddEventHandler("hEvents:start", function(event)
    InitializingZone(event)
end)

InitializingZone = function(event)
    ESX.ShowNotification("<C>Events</C>\n~g~Un event viens de commencer")
    if not event.illegal then
        blip = AddBlipForRadius(event.pos, event.radius)
        SetBlipHighDetail(blip, true)
        SetBlipColour(blip, 2)
        SetBlipAlpha (blip, 128)
        blip = AddBlipForCoord(event.ped.pos)
        SetBlipSprite(blip, 500)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(event.ped.name)
        EndTextCommandSetBlipName(blip)
        if event.plonge then
            blip = AddBlipForCoord(event.plonge.pos)
            SetBlipSprite(blip, 308)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, 29)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(event.plonge.name)
            EndTextCommandSetBlipName(blip)
        end
    end
    Citizen.SetTimeout(1800000, function() NotInZone, InZone = false, false end)
    ZoneChecker(event)
end

ZoneChecker = function(zone)
    NotInZone = true
    local HavePlonge = false
    local player = PlayerPedId()
    Citizen.CreateThread(function()
        while NotInZone do
            interval = 1000
            local plypos = GetEntityCoords(player)
            if #(plypos - zone.pos) < zone.radius then
                NotInZone = false
                InZoneFunc(zone)
            else
                if #(plypos - zone.ped.pos) < 10 then
                    interval = 0
                    if #(plypos - zone.ped.pos) < 5 then
                        interval = 0
                        ShowHelpText(zone.ped.text, vector3(zone.ped.pos.x, zone.ped.pos.y, zone.ped.pos.z+1.85))
                        if IsControlJustPressed(1, 51) then
                            if zone.crate then
                                OpenWeapon(zone)
                            else
                                OpenSell(zone)
                            end
                        end
                    end
                end
                if zone.plonge then
                    if #(plypos - zone.plonge.pos) < 10 then
                        interval = 0
                        if #(plypos - zone.plonge.pos) < 5 then
                            interval = 0
                            ShowHelpText(zone.plonge.text, vector3(zone.plonge.pos.x, zone.plonge.pos.y, zone.plonge.pos.z+1.85))
                            if IsControlJustPressed(1, 51) then
                                if not HavePlonge then
                                    TriggerEvent('skinchanger:getSkin', function(skin)
                                        if skin.sex == 0 then
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Clothe.m)
                                        else
                                            TriggerEvent('skinchanger:loadClothes', skin, Config.Clothe.f)
                                        end
                                        SetEnableScuba(player,true)
                                        SetPedMaxTimeUnderwater(player, 800.00)
                                        HavePlonge = true
                                    end)
                                else
                                    TriggerEvent('skinchanger:getSkin', function(skin)
                                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, hasSkin)
                                            if hasSkin then
                                                TriggerEvent('skinchanger:loadSkin', skin)
                                                TriggerEvent('esx:restoreLoadout')
                                                SetEnableScuba(player,false)
                                                SetPedMaxTimeUnderwater(player, 17.50)
                                                HavePlonge = false
                                            end
                                        end)
                                    end)
                                end
                            end
                        end
                    end
                end
            end
            Wait(interval)
        end
    end)
end

InZoneFunc = function(zone)
    InZone = true
    local player = PlayerPedId()
    maxMissions = #zone.Missions
    MissionsNum = math.random(1, maxMissions)
    Citizen.CreateThread(function()
        while InZone do
            interval = 750
            local plypos = GetEntityCoords(player)
            if #(plypos - zone.pos) > zone.radius then
                InZone = false
                ZoneChecker(zone)
            else
                interval = 0
                DrawMarker(1, zone.Missions[MissionsNum].pos.x, zone.Missions[MissionsNum].pos.y, zone.Missions[MissionsNum].pos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 100.0, 0, 255, 0, 170, 0, 0, 2, 1, nil, nil, 0)
                if zone.Missions[MissionsNum].skin and not fish then
                    fish = true
                    local hasfish = GetHashKey(zone.Missions[MissionsNum].skin)
                    RequestModel(hasfish)
                    while not HasModelLoaded(hasfish) do
                        Citizen.Wait( 1 )
                    end
                    pedfish = CreatePed(29, hasfish, zone.Missions[MissionsNum].pos.x, zone.Missions[MissionsNum].pos.y, zone.Missions[MissionsNum].pos.z-0.50, 90.0, true, false)
                    SetEntityInvincible(pedfish, true)
                    FreezeEntityPosition(pedfish, true)
                end
                if #(zone.Missions[MissionsNum].pos - plypos) < 2 then
                    Visual.Subtitle(zone.Missions[MissionsNum].notif)
                    if IsControlJustPressed(1, 51) then
                        SetEntityCoords(player, zone.Missions[MissionsNum].pos.x, zone.Missions[MissionsNum].pos.y, zone.Missions[MissionsNum].pos.z-0.98)
                        if not zone.plonge then
                            TaskStartScenarioInPlace(player, zone.Missions[MissionsNum].anim, 0, true)
                        else
                            TaskStartScenarioInPlace(player, "WORLD_HUMAN_SWIMMING", 0, true)
                            DeletePed(pedfish)
                            fish = false
                        end
                        Wait(zone.Missions[MissionsNum].time * 1000)
                        FreezeEntityPosition(player, false)
                        ClearPedTasks(player)
                        local chance = math.random(1, 100)
                        if chance < zone.Missions[MissionsNum].chance then
                            TriggerServerEvent("hEvents:findItems", zone.Missions[MissionsNum])
                            ESX.ShowNotification("<C>Events</C>\n~r~Vous avez trouvé 1 "..zone.Missions[MissionsNum].name)
                        else
                            ESX.ShowNotification("<C>Events</C>\n~r~Vous n\'avez rien trouvé")
                        end
                        MissionsNum = math.random(1, maxMissions)
                    end
                end
            end
            Wait(interval)
        end
    end)
end

ShowHelpText = function(text, pos)
    AddTextEntry('HelpText', text)
    SetFloatingHelpTextWorldPosition(1, pos)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('HelpText')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

local SellOpened = false
local SellMenu = RageUI.CreateMenu('Vente', ' ')
SellMenu.Closed = function()
    SellOpened = false
    RageUI.CloseAll()
end

OpenSell = function(zone)
    if SellOpened then
        return
    else
        SellOpened = true
        local player = PlayerPedId()
        RageUI.Visible(SellMenu, true)
        Citizen.CreateThread(function()
            while SellOpened do
                local plypos = GetEntityCoords(player)
                if #(plypos - zone.ped.pos) < 5 then
                    RageUI.IsVisible(SellMenu,function()
                        for _,v in pairs(zone.SellItems) do
                            RageUI.Button("Vendre "..v.name, nil, {RightLabel = "~g~"..v.price.."$"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("hEvents:sellItems", zone, v)
                                end
                            })
                        end
                    end)
                else
                    SellOpened = false
                    RageUI.CloseAll()
                end
                Wait(0)
            end
        end)
    end
end

local WeaponOpened = false
local WeaponMenu = RageUI.CreateMenu('Fabriquation', ' ')
WeaponMenu.Closed = function()
    WeaponOpened = false
    RageUI.CloseAll()
end

OpenWeapon = function(zone)
    if WeaponOpened then
        return
    else
        WeaponOpened = true
        local player = PlayerPedId()
        RageUI.Visible(WeaponMenu, true)
        Citizen.CreateThread(function()
            while WeaponOpened do
                local plypos = GetEntityCoords(player)
                if #(plypos - zone.ped.pos) < 5 then
                    RageUI.IsVisible(WeaponMenu,function()
                        for _,v in pairs(zone.SellItems) do
                            RageUI.Button("Craft ~o~"..v.name, nil, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    TriggerServerEvent("hEvents:craftItems", zone, v)
                                end
                            })
                        end
                    end)
                else
                    WeaponOpened = false
                    RageUI.CloseAll()
                end
                Wait(0)
            end
        end)
    end
end
