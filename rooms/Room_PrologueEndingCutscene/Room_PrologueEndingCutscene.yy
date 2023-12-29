{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Room_PrologueEndingCutscene",
  "creationCodeFile": "rooms/Room_PrologueEndingCutscene/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": true,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"PrologueEndCutsceneObj","path":"rooms/Room_PrologueEndingCutscene/Room_PrologueEndingCutscene.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Clouds","assets":[
        {"resourceType":"GMRParticleSystem","resourceVersion":"1.0","name":"particle_3536DFBD","colour":4294967295,"frozen":false,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"particleSystemId":{"name":"ps_DarkClouds","path":"particles/ps_DarkClouds/ps_DarkClouds.yy",},"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":224.0,},
        {"resourceType":"GMRSequenceGraphic","resourceVersion":"1.0","name":"graphic_2F004905","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":true,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"sequenceId":{"name":"seq_PrologueEndCutscene_VoizatiaEnter","path":"sequences/seq_PrologueEndCutscene_VoizatiaEnter/seq_PrologueEndCutscene_VoizatiaEnter.yy",},"x":480.0,"y":270.0,},
      ],"depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Cutscene","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"PrologueEndCutsceneObj","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PrologueEndCutscene","path":"objects/obj_PrologueEndCutscene/obj_PrologueEndCutscene.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":270.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"PrologueCutsceneTiles","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":17,"SerialiseWidth":30,"TileCompressedData":[
-270,-2147483648,-30,20,-210,47,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_DarkShrineMainBrickTileSet","path":"tilesets/tiles_DarkShrineMainBrickTileSet/tiles_DarkShrineMainBrickTileSet.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"StarSky","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_72442D55","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":{"name":"graphic_72442D55","path":"rooms/Room_OpeningCutscene/Room_OpeningCutscene.yy",},"inheritItemSettings":false,"rotation":0.0,"scaleX":0.5,"scaleY":0.5,"spriteId":{"name":"spr_BigMoon","path":"sprites/spr_BigMoon/spr_BigMoon.yy",},"x":256.0,"y":256.0,},
        {"resourceType":"GMRParticleSystem","resourceVersion":"1.0","name":"particle_4B99D237","colour":4294967295,"frozen":false,"ignore":false,"inheritedItemId":{"name":"particle_4B99D237","path":"rooms/Room_OpeningCutscene/Room_OpeningCutscene.yy",},"inheritItemSettings":false,"particleSystemId":{"name":"ps_StarrySky","path":"particles/ps_StarrySky/ps_StarrySky.yy",},"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":256.0,},
      ],"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":30.0,"animationSpeedType":0,"colour":4278519045,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":-1.0,"htiled":true,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":1.0,"vtiled":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Player","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
  ],
  "parent": {
    "name": "Cutscene",
    "path": "folders/Rooms/Cutscene.yy",
  },
  "parentRoom": {
    "name": "Room_OpeningCutscene",
    "path": "rooms/Room_OpeningCutscene/Room_OpeningCutscene.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 540,
    "inheritRoomSettings": true,
    "persistent": false,
    "Width": 960,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":540,"inherit":true,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":960,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}