mumbleConfig = {
    voiceModes = {
        {2.5, "Whisper"}, -- Distância de voz sussurrante em unidades de distância gta
        {8, "Normal"}, -- Distância normal de fala em unidades de distância gta
        {20, "Shouting"}, -- distância discurso grito em unidades de distância gta
    },
    speakerRange = 1.5, -- Distância do alto-falante em unidades de distância gta (a que distância você está de outro jogador para ouvir outros jogadores no rádio ou telefone)
    callSpeakerEnabled = true, -- Permita que os jogadores ouçam todos os participantes falantes de uma ligação, se estiverem ao lado de alguém que está ao telefone
    radioSpeakerEnabled = true, -- Permita que os jogadores ouçam todos os participantes falantes de um rádio se estiverem ao lado de alguém que tenha um rádio
    radioEnabled = true, -- Ativar ou desativar o uso do rádio
    micClicks = true, -- Os cliques estão ativados ou não
    micClickOn = true, -- O som do clique está ativo
    micClickOff = true, -- Is click sound off active
    micClickVolume = 0.1, -- Quão alto é o clique de um microfone
    radioClickMaxChannel = 100, -- Defina a quantidade máxima de canais de rádio que terão cliques de rádio locais ativados
    controls = { -- Alterar ligações de chave padrão
        proximity = {
            key = 20, -- Z
        }, -- Alternar modo de proximidade
        radio = {
            pressed = false, -- não toque
            key = 137, -- capital
        }, -- Use rádio
        speaker = {
            key = 20, -- Z
            secondary = 21, -- LEFT SHIFT
        } -- Alternar modo alto-falante (chamadas telefônicas)
    },
    radioChannelNames = { -- Adicionar canais de rádio nomeados (o padrão é [número do canal] MHz)
        [1] = "Policia 1",
        [2] = "Policia2",
        [3] = "EMS 1",
        [4] = "EMS 2",
        [500] = "Sala dos 500",
    }
}

-- Atualizar propriedades de configuração de outro script
function SetMumbleProperty(key, value)
	if mumbleConfig[key] ~= nil and mumbleConfig[key] ~= "controls" and mumbleConfig[key] ~= "radioChannelNames" then
		mumbleConfig[key] = value
	end
end

function AddRadioChannelName(channel, name)
    local channel = tonumber(channel)

    if channel ~= nil and name ~= nil and name ~= "" then
        if not mumbleConfig.radioChannelNames[channel] then
            mumbleConfig.radioChannelNames[channel] = tostring(name)
        end
    end
end

-- Disponibilizar exportações à primeira escala
exports("SetMumbleProperty", SetMumbleProperty)
exports("SetTokoProperty", SetMumbleProperty)
exports("AddRadioChannelName", AddRadioChannelName)
