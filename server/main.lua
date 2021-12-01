TriggerEvent("esx:getSharedObject", function(obj)   ESX = obj   end)

RegisterServerEvent("hEvents:sellItems")
AddEventHandler("hEvents:sellItems", function(zone, item)
    if #(GetEntityCoords(GetPlayerPed(source)) - zone.ped.pos) < 5.0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local count = xPlayer.getInventoryItem(item.label).count

        if count >= 1 then
            if zone.illegal then
                xPlayer.addAccountMoney('black_money', item.price)
            else
                xPlayer.addMoney(item.price)
            end
            xPlayer.removeInventoryItem(item.label, 1)
            xPlayer.showNotification("<C>Events</C>\n~g~Vous avez vendue "..item.name)
        else
            xPlayer.showNotification("<C>Events</C>\n~r~Vous n\'avez pas assez de "..item.name)
        end
    else
        DropPlayer("Kick reason: cheating")
    end
end)

RegisterServerEvent("hEvents:craftItems")
AddEventHandler("hEvents:craftItems", function(zone, item)
    if #(GetEntityCoords(GetPlayerPed(source)) - zone.ped.pos) < 5.0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        for _,v in pairs(item.component) do
            local count = xPlayer.getInventoryItem(v.label).count

            if count <= v.number then
                xPlayer.showNotification("<C>Events</C>\n~r~Vous n\'avez pas assez de "..v.name)
                return
            end
        end
        for _,v in pairs(item.component) do
            xPlayer.removeInventoryItem(v.label, 1)
        end
        xPlayer.addWeapon(item.label, 60)
        xPlayer.showNotification("<C>Events</C>\n~g~Vous avez craft "..item.name)
    else
        DropPlayer("Kick reason: cheating")
    end
end)

RegisterServerEvent("hEvents:findItems")
AddEventHandler("hEvents:findItems", function(item)
    if #(GetEntityCoords(GetPlayerPed(source)) - item.pos) < 5.0 then
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.addInventoryItem(item.give, 1)
    else
        DropPlayer("Kick reason: cheating")
    end
end)

eventFunc = function(h, m, event)
    TriggerClientEvent("hEvents:start", -1, event)
end

--
-- hTime system
--@ h string
--@ m string
--@ event table
--

startAt = function(h, m, event)
    Citizen.CreateThread(function()
        while true do
            min = os.date ("%M")
            hours = os.date ("%H")
            if min == m and hours == h then
                eventFunc(h, m, event)
                Citizen.Wait(60000)
            end
            Citizen.Wait(10000)
        end
    end)
end

for _,v in pairs(Config.Event) do
    startAt(v.timeh, v.timem, v)
end

print("[^4hEvent^7]: ^2Loaded^7")
