/// @description Creation
xSpeed = 0;
ySpeed = -1;
Gravity = 0;
Done = 0;

Player_CauseOfDeath = "";

layer = layer_create(-9998, "PlayerDeath");

//PlayerDeathParticles = CreateParticleSystem(ps_PlayerDeath, layer, x, y);

/*
PlayerDeathParticles = part_system_create_layer(layer, false, ps_PlayerDeath);
part_system_position(PlayerDeathParticles, x, y);
*/

for (var i = 0; i < 10; i++)
{
	with (instance_create_depth(x + (random_range(-1, 1) * 16), y + (random_range(-1, 1) * 16), depth - 1, obj_PlayerHealthParticles))
	{
		sprite_index = spr_PlayerDeathParticle_Blood;
		xSpeed = random_range(-1, 1) * 1;
		ySpeed = random_range(0, 1) * -7;
		Gravity = 0.1;
		PlayerParticle_FadeRate = 0.01;
		PlayerParticle_SpinSpeed = 0;
	}
}

for (var i = 0; i < 10; i++)
{
	with (instance_create_depth(x + (random_range(-1, 1) * 16), y + (random_range(-1, 1) * 16), depth - 1, obj_PlayerHealthParticles))
	{
		sprite_index = spr_PlayerDeathParticle_Moon;
		xSpeed = random_range(-1, 1) * 1;
		ySpeed = random_range(0, 1) * 2;
		Gravity = -0.1;
		PlayerParticle_FadeRate = 0.01;
		PlayerParticle_SpinSpeed = 0;
	}
}

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