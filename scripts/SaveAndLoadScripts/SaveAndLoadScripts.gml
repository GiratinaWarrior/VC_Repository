/// SaveGame()
/// This function saves the important variables in the game
function SaveGame()
{
	
	
	//Construct of variables to save
	var _saveVar = 
	{
		SpawnPoint : global.Spawnpoint,
		SpawnX : global.SpawnX,
		SpawnY : global.SpawnY,
		PlayerHealth : global.Health,
		FieldOrbCollected : global.FieldOrb,
		OceanOrbCollected : global.OceanOrb,
		TundraOrbCollected : global.TundraOrb,
		DesertOrbCollected : global.DesertOrb,
		UnlockedSeleneSword : global.AbilityUnlocked_SeleneSword,
		UnlockedLunarCannon : global.AbilityUnlocked_LunarCannon,
		UnlockedStarJump : global.AbilityUnlocked_StarJump,
		UnlockedCrescentBlitz : global.AbilityUnlocked_CrescentBlitz,
		UnlockedClingToHope : global.AbilityUnlocked_ClingToHope,
		UnlockedNightNight : global.AbilityUnlocked_NightNight,
		OrbsCollected : global.OrbsCollected,
		SeenJestDebutCutscene : global.JestDebut_Cutscene_Seen,
		DefeatedShrineGeneral : global.ShrineGeneral_Defeated,
		FamilyCongratsCardinal : global.CardinalCongratulation_Family
	}
	
	var _dataString = json_stringify(_saveVar);
	var _buffer = buffer_create(string_byte_length(_dataString) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _dataString);
	buffer_save(_buffer, "SaveGame.save");
	buffer_delete(_buffer);
	
	
}


/// LoadSave()
/// This function loads a save file
function LoadSave()
{

	if (file_exists("SaveGame.save"))
	{
		//Get the save data
		var _buffer = buffer_load("SaveGame.save");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		
		//Load the data
		global.Spawnpoint = _loadData.SpawnPoint;
		global.SpawnX = _loadData.SpawnX;
		global.SpawnY = _loadData.SpawnY;
		global.Health = _loadData.PlayerHealth;
		global.FieldOrb = _loadData.FieldOrbCollected;
		global.OceanOrb = _loadData.OceanOrbCollected;
		global.TundraOrb = _loadData.TundraOrbCollected;
		global.DesertOrb = _loadData.DesertOrbCollected;
		global.AbilityUnlocked_SeleneSword = _loadData.UnlockedSeleneSword;
		global.AbilityUnlocked_LunarCannon = _loadData.UnlockedLunarCannon;
		global.AbilityUnlocked_StarJump = _loadData.UnlockedStarJump;
		global.AbilityUnlocked_CrescentBlitz = _loadData.UnlockedCrescentBlitz;
		global.AbilityUnlocked_ClingToHope = _loadData.UnlockedClingToHope;
		global.AbilityUnlocked_NightNight = _loadData.UnlockedNightNight;
		global.OrbsCollected = _loadData.OrbsCollected;
		global.JestDebut_Cutscene_Seen = _loadData.SeenJestDebutCutscene;
		global.ShrineGeneral_Defeated = _loadData.DefeatedShrineGeneral;
		global.CardinalCongratulation_Family = _loadData.FamilyCongratsCardinal;
		
	} 

}

/// DeleteSave()
// This function deletes a save file
function DeleteSave()
{
	if (file_exists("SaveGame.save"))
	{
		file_delete("SaveGame.save");
	}
}