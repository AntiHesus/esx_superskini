ESX 					  	= nil

local CurrentActionData   	= {}

local lastTime 			  	= 0



Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)

	end

end)


function OpenWeaponsSkinsMenu()

	local elements = {}

	local i = 1

	ESX.UI.Menu.CloseAll()

	if IsMK2(GetSelectedPedWeapon(GetPlayerPed(-1))) then

		table.insert(elements, {label = _U('default'), istint = true, value = 0})

		table.insert(elements, {label = _U('classic_gray'), istint = true, value = 1})

		table.insert(elements, {label = _U('classic_twotone'), istint = true, value = 2})

		table.insert(elements, {label = _U('classic_white'), istint = true, value = 3})

		table.insert(elements, {label = _U('classic_beige'), istint = true, value = 4})

		table.insert(elements, {label = _U('classic_green'), istint = true, value = 5})

		table.insert(elements, {label = _U('classic_blue'), istint = true, value = 6})

		table.insert(elements, {label = _U('classic_earth'), istint = true, value = 7})

		table.insert(elements, {label = _U('classic_brownandblack'), istint = true, value = 8})

		table.insert(elements, {label = _U('red_contrast'), istint = true, value = 9})

		table.insert(elements, {label = _U('blue_contrast'), istint = true, value = 10})

		table.insert(elements, {label = _U('yellow_contrast'), istint = true, value = 11})

		table.insert(elements, {label = _U('orange_contrast'), istint = true, value = 12})

		table.insert(elements, {label = _U('bold_pink'), istint = true, value = 13})

		table.insert(elements, {label = _U('bold_purpleandyellow'), istint = true, value = 14})

		table.insert(elements, {label = _U('bold_orange'), istint = true, value = 15})

		table.insert(elements, {label = _U('bold_greenandpurple'), istint = true, value = 16})

		table.insert(elements, {label = _U('bold_red'), istint = true, value = 17})

		table.insert(elements, {label = _U('bold_green'), istint = true, value = 18})

		table.insert(elements, {label = _U('bold_cyan'), istint = true, value = 19})

		table.insert(elements, {label = _U('bold_yellow'), istint = true, value = 20})

		table.insert(elements, {label = _U('bold_redandwhite'), istint = true, value = 21})

		table.insert(elements, {label = _U('bold_blueandwhite'), istint = true, value = 22})

		table.insert(elements, {label = _U('metallic_gold'), istint = true, value = 23})

		table.insert(elements, {label = _U('metallic_platinum'), istint = true, value = 24})

		table.insert(elements, {label = _U('metallic_grayandlilac'), istint = true, value = 25})

		table.insert(elements, {label = _U('metallic_purpleandlime'), istint = true, value = 26})

		table.insert(elements, {label = _U('metallic_red'), istint = true, value = 27})

		table.insert(elements, {label = _U('metallic_green'), istint = true, value = 28})

		table.insert(elements, {label = _U('metallic_blue'), istint = true, value = 29})

		table.insert(elements, {label = _U('metallic_whiteandaqua'), istint = true, value = 30})

		table.insert(elements, {label = _U('metallic_redandyellow'), istint = true, value = 31})

	else

		table.insert(elements, {label = _U('default'), istint = true, value = 0})

		table.insert(elements, {label = _U('green'), istint = true, value = 1})

		table.insert(elements, {label = _U('gold'), istint = true, value = 2})

		table.insert(elements, {label = _U('pink'), istint = true, value = 3})

		table.insert(elements, {label = _U('army'), istint = true, value = 4})

		table.insert(elements, {label = _U('lspd'), istint = true, value = 5})

		table.insert(elements, {label = _U('orange'), istint = true, value = 6})

		table.insert(elements, {label = _U('platinum'), istint = true, value = 7})

	end

	ESX.UI.Menu.Open(

	    'default', GetCurrentResourceName(), 'esx_extraitems_skins',

	    {

	        title    = _U('skin_select'),

	        align    = 'bottom-left',

	        elements = elements,

	       

	    },

	   

	    function(data, menu)

	    	if data.current.reset == true then

	    		for k, v in pairs(Config.WeaponsSkins) do

					if GetHashKey(k) == GetSelectedPedWeapon(GetPlayerPed(-1)) then

						for ke, va in pairs(v.hashes) do

							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), va)

						end

					end

				end

	    	elseif data.current.camo == nil then

	    		SetPedWeaponTintIndex(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), data.current.value)

	    	else

	    		GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), data.current.camo)

	    	end

	    end,

	    function(data, menu)  

	        menu.close()

	    end

	)

end



function IsMK2(item)

	for k, v in pairs(Config.WeaponsSkins) do

		if GetHashKey(k) == item then

			return true

		end

	end

	return false

end



RegisterNetEvent('esx_extraitems:varjaus')

AddEventHandler('esx_extraitems:varjaus', function()

	OpenWeaponsSkinsMenu()

end)