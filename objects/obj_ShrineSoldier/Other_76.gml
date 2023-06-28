

if (event_data[? "event_type"] == "sprite event")
{
	switch(event_data[? "message"])
	{
		case "ShrineSoldierStartAttack":
			audio_play_sound(sound_WeaponWoosh, 10, false);
			break;
			
		case "ShrineSoldier_Walk_Footstep_A": case "ShrineSoldier_Walk_Footstep_B":
			
			if (Instance_InView())
			{
				var _footVolume = 0.01;
				audio_sound_gain(sound_ShrineSoldierFootstep1, _footVolume, 0);
				audio_sound_gain(sound_ShrineSoldierFootstep2, _footVolume, 0);
				audio_sound_gain(sound_ShrineSoldierFootstep3, _footVolume, 0);
				audio_play_sound(choose(sound_ShrineSoldierFootstep1, sound_ShrineSoldierFootstep2, sound_ShrineSoldierFootstep3), 1, false);
			}
			
			break;
		
		
	}
}