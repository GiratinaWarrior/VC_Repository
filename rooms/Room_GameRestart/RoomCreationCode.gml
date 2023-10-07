with(obj_Player)
{
	hascontrol = false;
	instance_destroy();
}
/*
with (obj_Game)
{
	instance_destroy();
}
with (obj_Camera)
{
	instance_destroy();
}
with (obj_Controls)
{
	instance_destroy();
}
*/
DeleteSave();
global.Spawnpoint = Room_OpeningCutscene;


if !(instance_exists(obj_Text))
{
	with(obj_Player)
	{
		instance_destroy();
	}
	room_goto(Room_TitleScreen);
}