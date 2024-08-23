<h1 align="center">Basic Discord Quester</h1>
<p align="center">
  <a href="#">
    <img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FDiamondRoPlayz%2FDiscord-Quester&title_bg=%232D2D2D&count_bg=%2300CC69&icon=github.svg&icon_color=%23E7E7E7&title=Views%20%28Day%20%2F%20All%29&edge_flat=false"/>
  </a>
  <a href="#">
    <img src="https://img.shields.io/github/stars/DiamondRoPlayz/Discord-Quester?affiliations=OWNER%2CCOLLABORATOR&labelColor=333333&logoColor=E7E7E7&color=EEAA00&label=Stars&logo=github"/>
  </a>
</p>


Activates the quest and completes it within the required minutes, normally 15<br>
# Play Quest
⚠️ Closing or Opening Discord may stop it automatically ⚠️
```js
const authorization="EnterHere"; // Your Discord Token

const questId="1270822177289142464"; // Quest Id

const domain='ptb.discord.com';
fetch(`https://${domain}/api/v9/quests/${questId}/heartbeat`,{
  method:'POST',headers:{
    'content-type':'application/json',authorization,'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/1.0.1098 Electron/30.2.0',
    'x-super-properties':'eyJvcyI6IldpbmRvd3MiLCJicm93c2VyIjoiRGlzY29yZCBDbGllbnQiLCJyZWxlYXNlX2NoYW5uZWwiOiJwdGIiLCJkaWFtb25kcm9wbGF5eiI6IkRpYW1vbmRSb1BsYXl6IiwiY2xpZW50X3ZlcnNpb24iOiIxLjAuMTA5OCIsIm9zX2FyY2giOiJ4NjQiLCJhcHBfYXJjaCI6Ing2NCIsInN5c3RlbV9sb2NhbGUiOiJlbi1HQiIsImJyb3dzZXJfdXNlcl9hZ2VudCI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIGRpc2NvcmQvMS4wLjEwOTggRWxlY3Ryb24vMzAuMi4wIiwiYnJvd3Nlcl92ZXJzaW9uIjoiMzAuMi4wIiwiY2xpZW50X2J1aWxkX251bWJlciI6MzIxMzU0fQ=='
  },
  body:`{"stream_key":"call:${questId}:1","terminal":false}`
}).then(r=>r.json()).then(console.log)
```
# Stream Quest
⚠️ Join a Voice channel with another person (can be a discord bot) and Stream your screen then use the code ⚠️
```js
const authorization="EnterHere"; // Your Discord Token

const guildId="EnterHere" // Server Id
const channelId="EnterHere" // Channel Id
const userId="EnterHere" // Your User Id

const questId="1271118866113892352"; // Quest Id

const domain='ptb.discord.com';
fetch(`https://${domain}/api/v9/quests/${questId}/heartbeat`,{
  method:'POST',headers:{
    'content-type':'application/json',authorization,'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/1.0.1098 Electron/30.2.0',
    'x-super-properties':'eyJvcyI6IldpbmRvd3MiLCJicm93c2VyIjoiRGlzY29yZCBDbGllbnQiLCJyZWxlYXNlX2NoYW5uZWwiOiJwdGIiLCJkaWFtb25kcm9wbGF5eiI6IkRpYW1vbmRSb1BsYXl6IiwiY2xpZW50X3ZlcnNpb24iOiIxLjAuMTA5OCIsIm9zX2FyY2giOiJ4NjQiLCJhcHBfYXJjaCI6Ing2NCIsInN5c3RlbV9sb2NhbGUiOiJlbi1HQiIsImJyb3dzZXJfdXNlcl9hZ2VudCI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIGRpc2NvcmQvMS4wLjEwOTggRWxlY3Ryb24vMzAuMi4wIiwiYnJvd3Nlcl92ZXJzaW9uIjoiMzAuMi4wIiwiY2xpZW50X2J1aWxkX251bWJlciI6MzIxMzU0fQ=='
  },
  body:`{"stream_key":"guild:${guildId}:${channelId}:${userId}","terminal":false}`
}).then(r=>r.json()).then(console.log)
```
