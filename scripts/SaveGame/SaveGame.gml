// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){

	//Overwrite old save
	if (file_exists(SAVEFILE)) {
		file_delete(SAVEFILE);
	}
	
	SetGlobalArray();
	
	//Create new save
	var file;
	var saveArray = global.SavedVar;
	file = file_text_open_write(SAVEFILE);
	//file_text_write_real(file, global.Spawnpoint);
	for (var f = 0; f < array_length(saveArray); f++)
	{
		file_text_write_real(file, saveArray[f]);
	}
	global.SavedVar = saveArray;
	file_text_close(file);
	//show_debug_message("Game Saved");
	
}