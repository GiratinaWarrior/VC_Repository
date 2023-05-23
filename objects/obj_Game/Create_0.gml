/// @description Our global variables

//The number of orbs we've retrieved
global.OrbsCollected = 0;

global.MaxHealth = 10;

//Which orbs we've retrieved in specific
// 0 = false, unretrieved
// 1 = true, retrieved
global.FieldOrb = 0;
global.OceanOrb = 0;
global.TundraOrb = 0;
global.DesertOrb = 0;

global.Spawnpoint = Room_RoseRoom;
global.SpawnX = 904;
global.SpawnY = 228;

//Immortal = 1 | mortal
//Immortal = 0 | immortal
global.Immortal = 1;

//The names of the player
global.Title = "Cardinal";
global.Name = "Rose";

//The range our player can see
global.xrange = 495;
//global.yrange = 172;

//Music and sound effects
global.FieldTheme = music_FieldTheme;
global.FieldSound = sound_WindBlowing;

global.OceanTheme = music_OceanTheme;
global.OceanSound = sound_StormySeas;

global.TundraTheme = music_TundraTheme;
global.TundraSound = sound_Blizzard;

global.Health = global.MaxHealth;

global.WarpTargetX = 904;
global.WarpTargetY = 228;

global.AbilityUnlocked_SeleneSword = true;
global.AbilityUnlocked_LunarCannon = true;
global.AbilityUnlocked_StarJump = false;
global.AbilityUnlocked_CrescentBlitz = false;
global.AbilityUnlocked_ClingToHope = false;
global.AbilityUnlocked_NightNight = false;

enum SAVED_VAR
{
	SPAWNPOINT,
	SPAWNX,
	SPAWNY,
	HEALTH,
	ORBSCOLLECTED,
	FIELDORB,
	OCEANORB,
	TUNDRAORB,
	DESERTORB,
	SELENESWORD_UNLOCKED,
	LUNARCANNON_UNLOCKED,
	STARJUMP_UNLOCKED,
	CRESCENTBLITZ_UNLOCKED,
	CLINGTOHOPE_UNLOCKED,
	NIGHTNIGHT_UNLOCKED
}

SetGlobalArray();






