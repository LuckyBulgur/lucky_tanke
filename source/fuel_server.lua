ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('lucky_tankstelle:money', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()

	TriggerClientEvent("lucky_tankstelle:setMoney", source, money)
end)


RegisterServerEvent('lucky_tankstelle:paybill')
AddEventHandler('lucky_tankstelle:paybill', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local amount = ESX.Math.Round(price)

	if price > 0 then
		xPlayer.removeMoney(amount)
	end
end)

ESX.RegisterServerCallback('lucky_tankstelle:sync', function(source, cb, plate)
	local fuel = MySQL.Sync.fetchScalar("SELECT fuel FROM owned_vehicles WHERE plate = @plate", {['@plate'] = plate})
	
	if fuel ~= nil and tonumber(fuel) > 0 then
		cb(fuel)
	else
		cb(nil)
	end
end)

RegisterServerEvent('lucky_tankstelle:save')
AddEventHandler('lucky_tankstelle:save', function(fuel, plate)
	local result = MySQL.Sync.execute("UPDATE owned_vehicles set fuel = @fuel WHERE plate = @plate", {['@fuel'] = fuel, ['@plate'] = plate})

	if result == 1 then
		--print("Fuel saved for " .. plate)
	else
		--print("Fuel not saved for " .. plate)
	end
end)
