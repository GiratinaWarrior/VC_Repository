var _func = function()
{
	time_source_destroy(RoomGameEnd_TimeSource);
	RoomGameEnd_TimeSource = noone;
	game_end();
}

RoomGameEnd_TimeSource = TimeSourceCreateAndStart(20, _func)