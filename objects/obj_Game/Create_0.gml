/// @description Our global variables

//The number of orbs we've retrieved
global.OrbsCollected = 0;

global.MaxHealth = 10;

global.Spawnpoint = Room_RoseRoom;
global.SpawnX = 128;
global.SpawnY = 128;

//Immortal = 1 | mortal
//Immortal = 0 | immortal
global.Immortal = 1;

//The names of the player
global.Title = "Cardinal";
global.Name = "Rose";

//The range our player can see
global.xrange = RES_W/2;
global.yrange = RES_H/2;

//Music and sound effects
global.FieldTheme = music_FieldTheme;
global.FieldSound = sound_WindBlowing;

global.OceanTheme = music_OceanTheme;
global.OceanSound = sound_StormySeas;

global.TundraTheme = music_TundraTheme;
global.TundraSound = sound_Blizzard;

global.Health = global.MaxHealth;

global.WarpTargetX = 128;
global.WarpTargetY = 128;

//------------Abilities Unlocked------------//

global.AbilityUnlocked_SeleneSword = true;
global.AbilityUnlocked_LunarCannon = true;
global.AbilityUnlocked_StarJump = false;
global.AbilityUnlocked_CrescentBlitz = false;
global.AbilityUnlocked_ClingToHope = false;
global.AbilityUnlocked_NightNight = false;

//--------------Story Flags-----------------//


//Which orbs we've retrieved in specific
// 0 = false, unretrieved
// 1 = true, retrieved
global.FieldOrb = 0;
global.OceanOrb = 0;
global.TundraOrb = 0;
global.DesertOrb = 0;

global.JestDebut_Cutscene_Seen = false;
global.ShrineGeneral_Defeated = false;
global.CardinalCongratulation_Family = false;
global.CarvalineOrb_Cutscene_Seen = false;
global.CardinalNoctisCongrats_Cutscene_Seen = false;
global.ValnyxShrineUnderAttack_Active = false;


//SetGlobalArray();