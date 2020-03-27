-- Better Roleplay Commands by Michael (https://github.com/MichaelRP1)
-- DO NOT TOUCH THINGS IN THIS FILE

RegisterCommand("me", function(source, msg, misc)
    if #msg <= 0 then return end
    local name = GetPlayerName(source)
    TriggerClientEvent("rpc:meMessage", source, name, table.concat(msg, " "))
end, false)

RegisterCommand("looc", function(source, msg, misc)
    if #msg <= 0 then return end
    local name = GetPlayerName(source)
    TriggerClientEvent("rpc:loocMessage", source, name, table.concat(msg, " "))
end, false)

RegisterCommand("tweet", function(source, msg, misc)
    if #msg <= 0 then return end
    TriggerClientEvent("chatMessage", -1, "^4Tweet | ^5@" .. GetPlayerName(source) .. " (" .. source .. ") ", {255, 255, 255}, table.concat(msg, " "))
end, false)

RegisterCommand("ooc", function(source, msg, misc)
    if #msg <= 0 then return end
    TriggerClientEvent("chatMessage", -1, "^3OOC (" .. GetPlayerName(source) .. " | " .. source .. ") ", {255, 255, 255}, table.concat(msg, " "))
end, false)

RegisterCommand("dispatch", function(source, msg, misc)
    if #msg <= 0 then return end
    TriggerClientEvent("chatMessage", -1, "^5Dispatch | Dispatcher: ^r" .. GetPlayerName(source) .. " | " .. source .. " ", {255, 255, 255}, table.concat(msg, " "))
end, false)

RegisterCommand("ad", function(source, msg, misc)
    if #msg <= 0 then return end
    TriggerClientEvent("chatMessage", -1, "^1Advert (" .. GetPlayerName(source) .. " | " .. source .. ") ", {255, 255, 255}, table.concat(msg, " "))
end, false)

RegisterServerEvent("rpc:911")
AddEventHandler("rpc:911", function(loc, msg, name)
    TriggerClientEvent("chatMessage", -1, "^4911 | ^5Caller: ^r" .. name .. " (" .. source .. ") ^5| Location: ^r" .. loc .. " ^5| Message: ", {255, 255, 255}, msg)
end)

AddEventHandler("chatMessage", function(source, name, msg)
    if string.sub(msg, 1, string.len("/")) ~= "/" then
        local name = GetPlayerName(source)
	    TriggerClientEvent("rpc:normMessage", -1, source, name, msg)
    end
    CancelEvent()
end)