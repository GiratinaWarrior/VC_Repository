/// @description PlayerState_SeleneSword(sprite, hitbox, direction)
/// @arg sprite
/// @arg hitbox
/// @arg direction

function PlayerState_SeleneSword(argument0, argument1, argument2){

	var _attacksprite = argument0;
	var _attackhitbox = argument1;
	var _attackdir = argument2;

	if (sprite_index != _attacksprite)
	{
		sprite_index = _attacksprite;
		image_index = 0;
		image_speed = 1;
		var SwordSFX = choose(sound_SwordAttack,sound_SwordAttack2, sound_SwordAttack3, sound_SwordAttack4);
		audio_sound_gain(SwordSFX, 0.05, 0);
		audio_play_sound(SwordSFX, 5000, false);
	}

	if (ySpeed >= 0)
	{ 	
		Gravity_Normal = Gravity_Fall;
	} 
	else 
	{
		Gravity_Normal = Gravity_Jump;
		if (!key_jump)
		{
			ySpeed = 0;
		}
	}
	
	if (animation_end())
	{
		PlayerState = PLAYERSTATE.NEUTRAL;
	}
	

}