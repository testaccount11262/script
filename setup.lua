if not getgenv then getgenv = getfenv end
local identity = "8"
local oldr = request 
getgenv().consolesettitle = rconsolesettitle
getgenv().rconsolename = rconsolesettitle
getgenv().consoleclear = rconsoleclear
getgenv().consoleprint = rconsoleprint
getgenv().consolecreate = rconsolecreate
getgenv().consoleinput = rconsoleinput
getgenv().consoledestroy = rconsoledestroy
getgenv().request = function(options)
    if options.Headers then
        options.Headers["User-Agent"] = "Synapse N"
    else
        options.Headers = {["User-Agent"] = "Synapse N"}
    end
    local response = oldr(options)
    return response
end
getgenv().printidentity = newcclosure(function(a)
	if a then print(a .. " " .. identity) else print("Current identity is " .. identity) end
	identity = "8"
end)
getgenv().set_thread_identity = newcclosure(function(a)
	dentity = tostring(a)
end)
getgenv().setthreadidentity = newcclosure(function(a)
	identity = tostring(a)
end)
getgenv().getthreadidentity = newcclosure(function(a)
	return tonumber(identity)
end)
getgenv().get_thread_identity = newcclosure(function(a)
	return tonumber(identity)
end)
