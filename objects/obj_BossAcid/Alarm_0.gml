/// @description Do poison damage to the player
with (obj_PlayerHealth)
{
	global.Health -= 0.1;
}

audio_play_sound(sound_AcidDamage, 1, false);