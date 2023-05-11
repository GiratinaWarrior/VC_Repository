/// @description Have foot steps
if (sprite_index ==  PlayerSpriteSet[PLAYERSTATE_SPRITE.RUN]) {
	audio_play_sound(choose(sound_Footstep1, sound_Footstep2, sound_Footstep3, sound_Footstep4), 1, false);
}