-- Better Roleplay Commands by Michael (https://github.com/MichaelRP1)
-- DO NOT TOUCH THINGS IN THIS FILE

RegisterNetEvent("rpc:meMessage")
AddEventHandler("rpc:meMessage", function(id, name, message)
  local other = GetPlayerFromServerId(id)
  if id == source then
	TriggerEvent("chatMessage", name, {0, 0, 255}, message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(other)), true) < 19.999 then
	TriggerEvent("chatMessage", name, {0, 0, 255}, message)
  end
end)

RegisterNetEvent("rpc:loocMessage")
AddEventHandler("rpc:loocMessage", function(id, name, message)
  local other = GetPlayerFromServerId(id)
  if id == source then
	TriggerEvent("chatMessage", "^3Local OOC (" .. name .. ")", {255, 255, 255}, message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(other)), true) < 19.999 then
	TriggerEvent("chatMessage", "^3Local OOC (" .. name .. ")", {255, 255, 255}, message)
  end
end)

RegisterNetEvent("rpc:normMessage")
AddEventHandler("rpc:normMessage", function(id, name, message)
  local other = GetPlayerFromServerId(id)
  if id == source then
	TriggerEvent("chatMessage", name, {255, 255, 255}, message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(source)), GetEntityCoords(GetPlayerPed(other)), true) < 19.999 then
	TriggerEvent("chatMessage", name, {255, 255, 255}, message)
  end
end)

RegisterCommand("911", function(source, msg, misc)
    if #msg <= 0 then return end
    local x, y, z = table.unpack(GetEntityCoords(source, true))
    local loc = GetStreetNameAtCoord(x, y, z)
    local sName = GetStreetNameFromHashKey(loc)
    TriggerServerEvent("rpc:911", sName, table.concat(msg, " "), GetPlayerName(source))
end, false)