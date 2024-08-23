# Discord-Quester

```js
const authorization=""; // Your Discord Token

const questId="1270822177289142464"; // Quest Id

const domain='ptb.discord.com';
fetch(`https://${domain}/api/v9/quests/${questId}/heartbeat`,{
  method:'POST',headers:{
    'content-type':'application/json',authorization,'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/1.0.1098 Electron/30.2.0',
    'x-super-properties':'eyJvcyI6IldpbmRvd3MiLCJicm93c2VyIjoiRGlzY29yZCBDbGllbnQiLCJyZWxlYXNlX2NoYW5uZWwiOiJwdGIiLCJkaWFtb25kcm9wbGF5eiI6IkRpYW1vbmRSb1BsYXl6IiwiY2xpZW50X3ZlcnNpb24iOiIxLjAuMTA5OCIsIm9zX2FyY2giOiJ4NjQiLCJhcHBfYXJjaCI6Ing2NCIsInN5c3RlbV9sb2NhbGUiOiJlbi1HQiIsImJyb3dzZXJfdXNlcl9hZ2VudCI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIGRpc2NvcmQvMS4wLjEwOTggRWxlY3Ryb24vMzAuMi4wIiwiYnJvd3Nlcl92ZXJzaW9uIjoiMzAuMi4wIiwiY2xpZW50X2J1aWxkX251bWJlciI6MzIxMzU0fQ=='
  },
  body:`{"stream_key":"call:${questId}:1","terminal":false}`
}).then(r=>r.text()).then(console.log)
```
