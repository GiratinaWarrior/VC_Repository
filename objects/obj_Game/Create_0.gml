/// @description Our global variables

//show_debug_overlay(true);

window_set_cursor(cr_none);

//---------------------Default Music (Unneeded)--------------//

//Music and sound effects
global.FieldTheme = music_FieldTheme;
global.FieldSound = sound_WindBlowing;

global.OceanTheme = music_OceanTheme;
global.OceanSound = sound_StormySeas;

global.TundraTheme = music_TundraTheme;
global.TundraSound = sound_Blizzard;

//------------------------------------Player Variables---------------------------//

//The range our player can see
global.xrange = RES_W/2;
global.yrange = RES_H/2;

global.WarpTargetX = 128;
global.WarpTargetY = 128;

global.Spawnpoint = Room_RoseRoom;
global.SpawnX = 128;
global.SpawnY = 128;

//Immortal = 1 | mortal
//Immortal = 0 | immortal
global.Immortal = 1;

//The names of the player
global.Title = "Cardinal";
global.Name = "Rose";

//The player variables
global.MaxHealth = 10;
global.Health = global.MaxHealth;

global.MaxVallen = 10;
global.Vallen = global.MaxVallen;

//Abilities unlocked
global.AbilityUnlocked_SeleneSword = true;
global.AbilityUnlocked_LunarCannon = true;
global.AbilityUnlocked_NightNight = true;
global.AbilityUnlocked_StarJump = false;
global.AbilityUnlocked_CrescentBlitz = false;
global.AbilityUnlocked_ClingToHope = false;

//-----------------------------------------------Story Flags-------------------------------------//


//The number of orbs we've retrieved
global.OrbsCollected = 0;

//Which orbs we've retrieved in specific
// 0 = false, unretrieved
// 1 = true, retrieved
global.FieldOrb = 0;
global.OceanOrb = 0;
global.TundraOrb = 0;
global.DesertOrb = 0;

//--------------Cutscenes---------------//

/////Main Shrine

//Jests first appearence 
global.JestDebut_Cutscene_Seen = false;

//Shrine General has been defeated by the player
global.ShrineGeneral_Defeated = false;

//Lavender comes to congratulate Rose
global.CardinalCongratulation_Family = false;

//The Carvaline Orb story is shown to the player
global.CarvalineOrb_Cutscene_Seen = false;

//Lavender has been defeated by Rose
global.Lavender_Defeated_Prologue = false;

//The Noxians celebrate Rose
global.CardinalNoctisCongrats_Cutscene_Seen = false;

/////Dark Shrine

//Valnyx Shrine comes under attack
global.ValnyxShrineUnderAttack_Active = false;

//Voizatia is first shown in front of the Carvaline Pedestal
global.VoizatiaDebuted = false;

//Malvalia is defeated by Rose
global.MalvaliaDefeated = false;

//The aftermath of Lavender and Voizatias fight is shown
global.VoizatiaLavenderAftermath_Cutscene_Seen = false;

//Regrouping with Jest in the Aftermath
global.JestTalkedTo_PrologueChapterAftermath = false;

//SetGlobalArray();