# mumble-voip

Uma substituição do tokovoip para que usa o fivem mumble voip

- Rádios (um canal de rádio por jogador por enquanto)
- Cliques de microfone de rádio
- Chamados
- Animações faciais ao falar
- Alternar modo Alto-falante do telefone
- Ouvir chamadas e rádios próximos
- HTML UI

# Eu usei esses convars ao testar:

```
setr voice_use3dAudio true
setr voice_useSendingRangeOnly true
```

### Exportações
Setters

| Exportação          | Descrição                 | Parameter(s) |
|---------------------|---------------------------|--------------|
| SetMumbleProperty   | Set config options        | string, any  |
| SetRadioChannel     | Set radio channel         | int          |
| SetCallChannel      | Set call channel          | int          |
| AddRadioChannelName | Add name to radio channel | int, string  |

Exportações TokoVOIP suportadas

| Exportação            | Descrição                | Parameter(s) |
|-----------------------|--------------------------|--------------|
| SetTokoProperty       | Set config options       | string, any  |
| addPlayerToRadio      | Set radio channel        | int          |
| removePlayerFromRadio | Remove player from radio |              |
| addPlayerToCall       | Set call channel         | int          |
| removePlayerFromCall  | Remove player from call  |              |

### Créditos

@Itokoyamato pelo TokoVOIP

@Nardah e @crunchFiveM pelo teste
