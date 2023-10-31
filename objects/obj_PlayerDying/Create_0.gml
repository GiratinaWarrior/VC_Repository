/// @description Creation
xSpeed = 0;
ySpeed = -1;
Gravity = 0;
Done = 0;

layer = layer_create(-9998, "PlayerDeath");

//PlayerDeathParticles = CreateParticleSystem(ps_PlayerDeath, layer, x, y);

/*
PlayerDeathParticles = part_system_create_layer(layer, false, ps_PlayerDeath);
part_system_position(PlayerDeathParticles, x, y);
*/

PlayerDeathFade = layer_sprite_create(layer, x, y, spr_DeathFade);

depth = -999;

image_index = 0;
image_speed = 1;
image_alpha = 1;

global.Health = global.MaxHealth;

//obj_Camera.follow = obj_PlayerDying;

SetRoomAudio_Music(blanksound, 0, 0);

audio_stop_all();

audio_play_sound(sound_PlayerDeath, 1, false);