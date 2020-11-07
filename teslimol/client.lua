RegisterCommand("teslimol",function()
    local ped = PlayerPedId()
    local aractami = IsPedInAnyVehicle(ped)
    
    if not aractami then 
        TriggerEvent("teslimol")
    else 
        exports['mythic_notify']:SendAlert('error', 'Araç içerisinde bunu yapamazsın!')
    end
end)

RegisterNetEvent( 'teslimol' )
AddEventHandler( 'teslimol', function()
    local player = GetPlayerPed( -1 )
   
    if (DoesEntityExist(player) and not IsEntityDead(player)) then 
        loadAnimDict("random@arrests")
        loadAnimDict( "random@arrests@busted" )
        if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
            TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (500)
            TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (1000)
            TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end
    end
end )

function loadAnimDict( dict ) 
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end