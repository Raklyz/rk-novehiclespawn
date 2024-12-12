-- Script universal de zonas sin spawn de vehículos para FiveM

-- Configuración inicial de zonas
local noSpawnZones = {
    {x = 254.12, y = -770.52, z = 30.66, radius = 50.0, description = "Centro de Los Santos"},
    {x = -1036.01, y = -2737.71, z = 20.17, radius = 30.0, description = "Aeropuerto"}
}

-- Función para verificar si un punto está en una zona de no spawn
local function isInNoSpawnZone(coords)
    for _, zone in ipairs(noSpawnZones) do
        local distance = #(coords - vector3(zone.x, zone.y, zone.z))
        if distance <= zone.radius then
            return true
        end
    end
    return false
end

-- Prevenir spawn de vehículos
AddEventHandler('entityCreating', function(entity)
    if GetEntityType(entity) == 2 then  -- Verificar si es vehículo
        local coords = GetEntityCoords(entity)
        
        if isInNoSpawnZone(coords) then
            CancelEvent()
        end
    end
end)

-- Comando para añadir zona de no spawn
RegisterCommand('addnospawnzone', function(source, args)
    if #args >= 4 then
        local x = tonumber(args[1])
        local y = tonumber(args[2])
        local z = tonumber(args[3])
        local radius = tonumber(args[4])
        local description = table.concat(args, " ", 5) or "Sin descripción"

        if x and y and z and radius then
            local newZone = {
                x = x, 
                y = y, 
                z = z, 
                radius = radius, 
                description = description
            }
            table.insert(noSpawnZones, newZone)
            
            -- Notificar
            TriggerClientEvent('chat:addMessage', source, {
                color = {0, 255, 0},
                args = {"[NO-SPAWN]", "Zona añadida exitosamente"}
            })
        end
    else
        -- Uso del comando
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 0, 0},
            args = {"[NO-SPAWN]", "Uso: /addnospawnzone x y z radio [descripción]"}
        })
    end
end, false)

-- Comando para listar zonas de no spawn
RegisterCommand('listnoSpawnZones', function(source)
    for i, zone in ipairs(noSpawnZones) do
        local msg = string.format("Zona %d: X:%.2f Y:%.2f Z:%.2f Radio:%.2f - %s", 
            i, zone.x, zone.y, zone.z, zone.radius, zone.description)
        
        TriggerClientEvent('chat:addMessage', source, {
            color = {0, 255, 255},
            args = {"[NO-SPAWN]", msg}
        })
    end
end, false)

-- Guardar zonas en archivo (persistencia simple)
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        local json = json.encode(noSpawnZones)
        SaveResourceFile(resourceName, "no_spawn_zones.json", json, -1)
    end
end)

-- Cargar zonas al iniciar
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        local content = LoadResourceFile(resourceName, "no_spawn_zones.json")
        if content then
            local loadedZones = json.decode(content)
            if loadedZones then
                noSpawnZones = loadedZones
            end
        end
    end
end)