local voiceData = {}
local radioData = {}
local callData = {}

local resourceName = ""
local debug = false

function DebugMsg(msg)
    if debug then
        print("\x1b[32m[" .. resourceName .. "]\x1b[0m ".. msg)
    end
end

AddEventHandler("onServerResourceStart", function(resName)
	if GetCurrentResourceName() ~= resName then
		return
	end

	resourceName = resName
end)

RegisterNetEvent("esx_mumble:Initialise")
AddEventHandler("esx_mumble:Initialise", function()
    DebugMsg("Jogador inicializado: " .. source)

    if not voiceData[source] then
        voiceData[source] = {
            mode = 2,
            radio = 0,
            radioActive = false,
            call = 0,
            callSpeaker = false,
        }
    end

    TriggerClientEvent("esx_mumble:SetVoiceData", -1, voiceData, radioData, callData)
end)

RegisterNetEvent("esx_mumble:SetVoiceData")
AddEventHandler("esx_mumble:SetVoiceData", function(key, value)
    if not voiceData[source] then
        voiceData[source] = {
            mode = 2,
            radio = 0,
            radioActive = false,
            call = 0,
            callSpeaker = false,
        }
    end

    local radio = voiceData[source]["radio"]
    local call = voiceData[source]["call"]
    local radioActive = voiceData[source]["radioActive"]

    local radioChanged = false
    local callChanged = false

    if key == "radio" and radio ~= value then -- Verifique se o canal mudou
        if radio > 0 then -- Verifique se o player estava em um canal de rádio
            if radioData[radio] then  -- Remova o player do canal de rádio
                if radioData[radio][source] then
                    DebugMsg("Player " .. source .. " foi removido do canal de rádio " .. radio)
                    radioData[radio][source] = nil
                end
            end
        end

        if value > 0 then
            if not radioData[value] then -- Crie um canal se ele não existir
                DebugMsg("Player " .. source .. " está criando canal:" .. value)
                radioData[value] = {}
            end

            DebugMsg("Player " .. source .. " foi adicionado ao canal: " .. value)
            radioData[value][source] = true -- Adicionar player ao canal
        end

        radioChanged = true
    elseif key == "call" and call ~= value then
        if call > 0 then -- Verifique se o player estava em um canal de chamada
            if callData[call] then  -- Remover jogador do canal de chamada
                if callData[call][source] then
                    DebugMsg("Player " .. source .. " foi removido do canal de chamada " .. call)
                    callData[call][source] = nil
                end
            end
        end

        if value > 0 then
            if not callData[value] then -- Criar chamada se ela não existir
                DebugMsg("Player " .. source .. " está criando chamada: " .. value)
                callData[value] = {}
            end

            DebugMsg("Player " .. source .. " foi adicionado à chamada: " .. value)
            callData[value][source] = true -- Adicionar jogador para chamada
        end

        callChanged = true
    elseif key == "radioActive" and radioActive ~= value then
        DebugMsg("Player " .. source .. " o estado de fala do rádio foi alterado de: " .. tostring(radioActive):upper() .. " para: " .. tostring(value):upper())
        if radio > 0 then
            local channel = radioData[radio]

            if channel ~= nil then
                for id, _ in pairs(channel) do
                    DebugMsg("Enviando som para o player" .. id)
                    TriggerClientEvent("esx_mumble:RadioSound", id, value, radio)
                end
            end
        end
    end

    voiceData[source][key] = value

    DebugMsg("Player " .. source .. " mudou " .. key .. " para: " .. tostring(value))

    TriggerClientEvent("esx_mumble:SetVoiceData", -1, voiceData, radioChanged and radioData or false, callChanged and callData or false)
end)

RegisterCommand("mumbleRadioChannels", function(src, args, raw)
    for id, players in pairs(radioData) do
        for player, _ in pairs(players) do
            RconPrint("\x1b[32m[" .. resourceName .. "]\x1b[0m Canal " .. id .. "-> id: " .. player .. ", nome: " .. GetPlayerName(player) .. "\n")
        end
    end
end, true)

RegisterCommand("mumbleCallChannels", function(src, args, raw)
    for id, players in pairs(callData) do
        for player, _ in pairs(players) do
            RconPrint("\x1b[32m[" .. resourceName .. "]\x1b[0m Chamada " .. id .. "-> id: " .. player .. ", nome: " .. GetPlayerName(player) .. "\n")
        end
    end
end, true)

AddEventHandler("playerDropped", function()
    if voiceData[source] then
        local radioChanged = false
        local callChanged = false

        if voiceData[source].radio > 0 then
            if radioData[voiceData[source].radio] ~= nil then
                radioData[voiceData[source].radio][source] = nil
                radioChanged = true
            end
        end

        if voiceData[source].call > 0 then
            if callData[voiceData[source].call] ~= nil then
                callData[voiceData[source].call][source] = nil
                callChanged = true
            end
        end

        voiceData[source] = nil

        TriggerClientEvent("esx_mumble:SetVoiceData", -1, voiceData, radioChanged and radioData or false, callChanged and callData or false)
    end
end)
