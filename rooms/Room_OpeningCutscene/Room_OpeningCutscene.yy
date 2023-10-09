{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Room_OpeningCutscene",
  "creationCodeFile": "rooms/Room_OpeningCutscene/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_6CEB337B","path":"rooms/Room_OpeningCutscene/Room_OpeningCutscene.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"PrologueEnd","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Dialogue","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6CEB337B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PrologueCutscene","path":"objects/obj_PrologueCutscene/obj_PrologueCutscene.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":544.0,"y":480.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"PrologueCutsceneTiles","depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":17,"SerialiseWidth":30,"TileCompressedData":[
-270,-2147483648,-30,20,-210,47,],"TileDataFormat":1,},"tilesetId":{"name":"tiles_ValnyxShrinePeakTileSet","path":"tilesets/tiles_ValnyxShrinePeakTileSet/tiles_ValnyxShrinePeakTileSet.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"StarPod","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"StarSky","assets":[
        {"resourceType":"GMRParticleSystem","resourceVersion":"1.0","name":"particle_4B99D237","colour":4294967295,"frozen":false,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"particleSystemId":{"name":"ps_StarrySky","path":"particles/ps_StarrySky/ps_StarrySky.yy",},"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":256.0,},
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_72442D55","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.5,"scaleY":0.5,"spriteId":{"name":"spr_BigMoon","path":"sprites/spr_BigMoon/spr_BigMoon.yy",},"x":256.0,"y":256.0,},
      ],"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":30.0,"animationSpeedType":0,"colour":4278519045,"depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":-1.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":1.0,"vtiled":true,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Cutscene",
    "path": "folders/Rooms/Cutscene.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 540,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 960,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":540,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":960,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1980,"wview":1980,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}