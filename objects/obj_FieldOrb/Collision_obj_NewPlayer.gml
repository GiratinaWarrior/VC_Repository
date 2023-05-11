/// @description Insert description here
// You can write your code in this editor
with (obj_PlayBGM)
{
	NextBGM = blanksound;
}

if (FieldOrbTouched == false)
{	
	audio_play_sound(sound_OrbFound, 100, false);
	audio_sound_gain(sound_OrbFound, 0, 0);
	audio_sound_gain(sound_OrbFound, 1, 500);
	alarm[0] = 1200;
}

FieldOrbTouched = true;

with (obj_NewPlayer)
{
	hascontrol = false;
}