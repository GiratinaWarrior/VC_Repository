

if (event_data[? "event_type"] == "sprite event")
{
	switch(event_data[? "message"])
	{
		case "ShrineSoldierStartAttack":
			audio_play_sound(sound_WeaponWoosh, 10, false);
			break;
	}
}