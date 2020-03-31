ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

POWX_Apple_Config = {
    Positions = {
        -- Apple Store
	{name = 'Apple Store', x = -629.014,    y = -276.025, z = 35.577},
    {name = 'Apple Store', x = -659.084,   y = -857.577,  z = 24.490}
	},
	
	

    Items = {
        {Label = '📱 iPhone X', Value = 'tel', Price = 400},
        {Label = '🔊 Enceinte', Value = 'hifi', Price = 300}
    }
}

Citizen.CreateThread(function()
	for k, v in pairs(POWX_Apple_Config.Positions) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)

     --- Blip Apple 

		SetBlipSprite(blip, 487)
		SetBlipScale (blip, 0.8)
	--	SetBlipColour(blip, 2)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('shop') .. ' ['.. v.name .. ']')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(POWX_Apple_Config.Positions) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if distance < 10.0 then
                actualZone = v

                zoneDistance = GetDistanceBetweenCoords(playerCoords, actualZone.x, actualZone.y, actualZone.z, true)

				DrawMarker(29, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 0, 128, 255, 255, true, true, 2, false, nil, nil, false)
            end

            
            if distance <= 1.5 then
                ESX.ShowHelpNotification(_U('open_menu'))

                if IsControlJustPressed(1, 51) then
                    RageUI.Visible(RMenu:Get('showcase', 'shopMenu'), not RageUI.Visible(RMenu:Get('showcase', 'shopMenu')))
                end
            end

            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    RageUI.CloseAll()
                end
            end
		end
	end
end)

local max = 10 
Numbers = {}

Citizen.CreateThread(function()
    for i = 1, max do
        table.insert(Numbers, i)
    end
end)

-- PED NUMERO 1 

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_sol")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_APPLE", "csb_sol", -627.307, -274.830, 34.577, 133.015, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



-- PED NUMERO 2

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_sol")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_APPLE", "csb_sol", -659.040, -858.839, 23.490, 358.280, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)



-- Nom au dessus du PED 1 

local v1 = vector3(-627.307, -274.830, 36.577)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Richard")
        end
    end
end)






-- Nom au dessus du PED 2

local v1 = vector3(-659.040, -858.839, 25.490)

function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
            Draw3DText(v1.x,v1.y,v1.z, "Richard")
        end
    end
end)
