if (global.JestTalkedTo_PrologueChapterAftermath)
{
	instance_destroy();
}

eventFunc = function()
{
		instance_create_layer(1568, 1504, "JestAftermath_Cutscene", obj_JestAftermathCutscene);
}