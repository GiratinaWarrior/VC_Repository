/// @description Set yourself up at the start of the room

if (Player_FrontLayer == noone)
{
	Player_FrontLayer = layer_create(-9999, "PlayerDeath");
}



//Set the players coordinates accordingly
x = global.WarpTargetX;
y = global.WarpTargetY;

//Make the player face the direction with more stuff
image_xscale = sign((room_width/2) - x);

//Move the player to the right layer
if (layer_exists("Player"))
{
	layer = layer_get_id("Player");
}

/*
	Give back the players ability to move when they switch rooms
	If the room is not a cutscene room
*/
if (!RoomIsCutscene)
{
	hascontrol = true;
}

