{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Room_TitleScreen",
  "creationCodeFile": "${project_dir}/rooms/Room_TitleScreen/RoomCreationCode.gml",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_44A5A2C9","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_3247DCC5","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_1B62C163","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_11E6360B","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_6FD78AFB","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_5F7AF40B","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
    {"name":"inst_5376F333","path":"rooms/Room_TitleScreen/Room_TitleScreen.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Title","assets":[
        {"resourceType":"GMRSequenceGraphic","resourceVersion":"1.0","name":"graphic_61860F26","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":true,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"sequenceId":{"name":"seq_VoidValiant","path":"sequences/seq_VoidValiant/seq_VoidValiant.yy",},"x":990.0,"y":272.0,},
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_2D45D6FF","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":true,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":3.0,"scaleY":3.0,"spriteId":{"name":"spr_VoidValiantGif","path":"sprites/spr_VoidValiantGif/spr_VoidValiantGif.yy",},"x":990.0,"y":256.0,},
        {"resourceType":"GMRSequenceGraphic","resourceVersion":"1.0","name":"graphic_7D120816","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"sequenceId":{"name":"seq_VoidCardinal","path":"sequences/seq_VoidCardinal/seq_VoidCardinal.yy",},"x":992.0,"y":288.0,},
      ],"depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Clouds","assets":[
        {"resourceType":"GMRParticleSystem","resourceVersion":"1.0","name":"particle_73EADE3E","colour":4294967295,"frozen":false,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"particleSystemId":{"name":"ps_TitleClouds","path":"particles/ps_TitleClouds/ps_TitleClouds.yy",},"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":0.0,"y":384.0,},
      ],"depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Petals","assets":[
        {"resourceType":"GMRParticleSystem","resourceVersion":"1.0","name":"particle_49A13083","colour":4294967295,"frozen":false,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"particleSystemId":{"name":"ps_TitlePetals","path":"particles/ps_TitlePetals/ps_TitlePetals.yy",},"rotation":0.0,"scaleX":1.0,"scaleY":1.2546085,"x":672.0,"y":575.5311,},
      ],"depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"MoonObject","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5376F333","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_TitleMoon","path":"objects/obj_TitleMoon/obj_TitleMoon.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-256.0,"y":512.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRPathLayer","resourceVersion":"1.0","name":"MoonOrbit","colour":4278190335,"depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"pathId":{"name":"pt_TitleMoon","path":"paths/pt_TitleMoon/pt_TitleMoon.yy",},"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRLayer","resourceVersion":"1.0","name":"Processes","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Cursor","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_44A5A2C9","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Cursor","path":"objects/obj_Cursor/obj_Cursor.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1184.0,"y":512.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":false,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Game","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1B62C163","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Game","path":"objects/obj_Game/obj_Game.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1024.0,"y":512.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"SpawnPoint","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Camera","depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5F7AF40B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Camera","path":"objects/obj_Camera/obj_Camera.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":864.0,"y":544.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"PlayAudio","depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_11E6360B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayBGM","path":"objects/obj_PlayBGM/obj_PlayBGM.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1152.0,"y":448.0,},
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6FD78AFB","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayBGS","path":"objects/obj_PlayBGS/obj_PlayBGS.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1184.0,"y":448.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Transition","depth":1100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
        {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Menu","depth":1200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
            {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3247DCC5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_MenuTitleScreen","path":"objects/obj_MenuTitleScreen/obj_MenuTitleScreen.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":771.0,"y":638.0,},
          ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
      ],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Backgrounds","animationFPS":30.0,"animationSpeedType":0,"colour":4278190080,"depth":1300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":{"name":"spr_TitleScreenBackground","path":"sprites/spr_TitleScreenBackground/spr_TitleScreenBackground.yy",},"stretch":true,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":true,"x":0,"y":0,},
  ],
  "parent": {
    "name": "SpecialScreens",
    "path": "folders/Rooms/SpecialScreens.yy",
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
    "Height": 1080,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":1080,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":1920,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": false,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}