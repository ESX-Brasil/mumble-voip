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

# Servidores Iceline Hosting e ESX Brasil

![Iceline hosting](https://cdn.discordapp.com/attachments/704310570098229309/704331510203023490/banner.gif)

Você está pensando em abrir um servidor FiveM por conta própria? 
[Iceline Hosting](https://iceline-hosting.com/billing/aff.php?aff=122) fornece servidores de jogos, VPS de jogos de ponta com proteção contra DDoS incluída e muito mais!

Existe um complemento de suporte gerenciado opcional disponível para servidores de jogos e VPS de jogos que adicionam os seguintes serviços:

- Investigação e correção de erros em relação ao servidor ou scripts de terceiros
- Instalando scripts ou software de terceiros
- Recuperação de dados perdidos

Vá para [Iceline Hosting](https://iceline-hosting.com/billing/aff.php?aff=122) e use o código promocional `ESXBRAZIL` para ganha 20% no primeiro mês em servidor.
Ele da descontos em outros serviços da empresa.
