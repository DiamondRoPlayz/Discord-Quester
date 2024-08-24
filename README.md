<h1 align="center">Basic Discord Quester</h1>
<p align="center">
  <a href="#">
    <img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FDiamondRoPlayz%2FDiscord-Quester&title_bg=%232D2D2D&count_bg=%2300CC69&icon=github.svg&icon_color=%23E7E7E7&title=Views%20%28Day%20%2F%20All%29&edge_flat=false"/>
  </a>
  <a href="#">
    <img src="https://img.shields.io/github/stars/DiamondRoPlayz/Discord-Quester?affiliations=OWNER%2CCOLLABORATOR&labelColor=333333&logoColor=E7E7E7&color=EEAA00&label=Stars&logo=github"/>
  </a>
</p>


#
<p align="center">
Automatically completes your enrolled quests
<br>
⚠️ Some quests require you to Stream your screen with another person ⚠️
</p>

```js
(async()=>{
  let ok=navigator.userAgent.includes('Electron/');if(!ok)return console.log('Change your User-agent to "Electron/" or use the app.');
  let rc;webpackChunkdiscord_app.push([[Symbol()],{},r=>rc=r.c]);
  let api=Object.values(rc).find(x=>x?.exports?.tn?.post).exports.tn;
  let QuestsStore=Object.values(rc).find(x=>x?.exports?.Z?.getQuest).exports.Z;
  let getQuests=()=>[...QuestsStore.quests.values()]
  .filter(f=>f.userStatus?.enrolledAt&&!f?.userStatus?.completedAt&&new Date(f.config.expiresAt)>new Date())
  .sort(a=>a.config.taskConfig.tasks.PLAY_ON_DESKTOP&&-1||1);
  if(getQuests().length<1)return console.log('No quests to complete.');
  let questBeat=(questId,stream_key)=>api.post({url:`/quests/${questId}/heartbeat`,body:{stream_key,terminal:false}});
  let playQuest=(questId)=>questBeat(questId,`call:${questId}:1`);
  let streamQuest=(questId,type,stream)=>questBeat(questId,`${type}:${stream.filter(v=>v).join(':')}`);
  let findX=v=>Object.values(rc).find(x=>x?.exports?.Z?.[v]).exports.Z[v];
  let callX=v=>Object.values(rc).find(x=>x?.exports?.Z?.[v]).exports.Z[v]();
  let getCurrentUserActiveStream=()=>callX('getCurrentUserActiveStream');
  let getVoiceStatesForChannel=findX('getVoiceStatesForChannel');
  const sleep=ms=>new Promise(r=>setTimeout(r,ms));
  while(getQuests().length>0){
    let quest=getQuests()[0];
    let tasks=quest.config.taskConfig.tasks;
    if(tasks.PLAY_ON_DESKTOP){
      console.log('Quest Progress:',`${quest?.userStatus?.progress?.PLAY_ON_DESKTOP?.value}/${tasks?.PLAY_ON_DESKTOP?.target}`)
      await playQuest(quest.id);await sleep(3e4);
    }else if(tasks.STREAM_ON_DESKTOP){
      console.log('Quest Progress:',`${quest?.userStatus?.progress?.STREAM_ON_DESKTOP?.value}/${tasks?.STREAM_ON_DESKTOP?.target}`);
      let stream=getCurrentUserActiveStream();
      if(stream){
        let voiceStates=getVoiceStatesForChannel(stream.channelId);
        if(Object.keys(voiceStates).length>1){
          await streamQuest(quest.id,stream.streamType,[stream.guildId,stream.channelId,stream.ownerId]);
          await sleep(3e4);
        }else{console.log('⚠️','You need atleast one user in call, Waiting...');await sleep(5e3)}
      }else{console.log('⚠️','You must Stream your screen, Waiting...');await sleep(5e3)}
    }else{
      console.log('Unknown Quest Task');break;
    }
  };console.log('No more quests left.');
})()
```
#
<p align="center">
&#169 Created by DiamondRoPlayz
</p>
