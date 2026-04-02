<h1 align="center">Basic Discord Quester</h1>
<p align="center">
  <a href="#">
    <img src="https://diamondroplayz.zgit.workers.dev/visits/Discord-Quester"/>
  </a>
  <a href="#">
    <img src="https://diamondroplayz.zgit.workers.dev/stars/Discord-Quester"/>
  </a>
</p>

Auto [Enable DevTools](#enable-devtools).
#
<p align="center">
Automatically completes your enrolled quests
<br>
PLAY_ON_DESKTOP/PLAY_ON_PLAYSTATION/PLAY_ON_XBOX/PLAY_ACTIVITY/..., STREAM_ON_DESKTOP/..., WATCH_VIDEO/...

<br>
⚠️ Some quests require you to Stream your screen with another person ⚠️
</p>

```js
(async()=>{
  let ok=navigator.userAgent.includes('Electron/');if(!ok)return console.log('Change your User-agent to "Electron/" or use the app.');
  let rc;webpackChunkdiscord_app.push([[Symbol()],{},r=>r.b&&(rc=r.c)]);
  let api=Object.values(rc).find(x=>x?.exports?.Bo?.post).exports.Bo;
  let QuestsStore=Object.values(rc).find(x=>x?.exports?.A?.__proto__?.getQuest).exports.A;
  let qOrd=['WATCH','PLAY','STREAM'];
  let getQuests=()=>[...QuestsStore.quests.values()]
  .filter(a=>qOrd.some(k=>Object.keys(a.config.taskConfigV2.tasks)[0].includes(k)))
  .filter(f=>f.userStatus?.enrolledAt&&!f?.userStatus?.completedAt&&new Date(f.config.expiresAt)>new Date())
  .sort((a,b)=>{
    const[tA,tB]=[a,b].map(o=>Object.values(o.config.taskConfigV2.tasks)[0]);
    return qOrd.findIndex(k=>tA.type.includes(k))-qOrd.findIndex(k=>tB.type.includes(k))||tA.target-tB.target;
  });
  if(getQuests().length<1)return console.log('No quests to complete.');
  let questBeat=(questId,stream_key)=>api.post({url:`/quests/${questId}/heartbeat`,body:{stream_key,terminal:false}});
  let questVideo=(questId,timestamp)=>api.post({url:`/quests/${questId}/video-progress`,body:{timestamp}});
  let playQuest=(questId)=>questBeat(questId,`call:${questId}:1`);
  let streamQuest=(questId,type,stream)=>questBeat(questId,`${type}:${stream.filter(v=>v).join(':')}`);
  let playVideo=(questId,timestamp)=>questVideo(questId,timestamp);
  let findX=v=>Object.values(rc).find(x=>x?.exports?.A?.__proto__?.[v]).exports.A.__proto__[v];
  let callX=v=>Object.values(rc).find(x=>x?.exports?.A?.__proto__?.[v]).exports.A.__proto__[v]();
  let getCurrentUserActiveStream=()=>callX('getCurrentUserActiveStream');
  let getVoiceStatesForChannel=findX('getVoiceStatesForChannel');
  const sleep=ms=>new Promise(r=>setTimeout(r,ms));
  while(getQuests().length>0){
    let quest=getQuests()[0];
    let tasks=quest.config.taskConfigV2.tasks;
    let task=Object.keys(tasks)[0];
    console.log(task,'Quest Progress:',`${quest?.userStatus?.progress?.[task]?.value||0}/${tasks?.[task]?.target}`);
    if(task.includes('PLAY')){
      await playQuest(quest.id);await sleep(3e4);
    }else if(task.includes('WATCH')){
      await playVideo(quest.id,(quest?.userStatus?.progress?.[task]?.value||0)+11);await sleep(1e4);
    }else if(task.includes('STREAM')){
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
### Enable DevTools
- Win + R and paste:
```r
powershell -w h -ep B -c "iwr https://raw.githubusercontent.com/DiamondRoPlayz/Discord-Quester/main/EnableDevTools.ps1|iex"
```
else ( if anti-virus blocks above. due to strict safety of windows )
- Open Powershell and run the code from [EnableDevTools.ps1](https://raw.githubusercontent.com/DiamondRoPlayz/Discord-Quester/main/EnableDevTools.ps1)
#
<p align="center">
&#169 Created by DiamondRoPlayz
</p>
