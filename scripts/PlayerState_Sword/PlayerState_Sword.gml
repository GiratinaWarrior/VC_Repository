/// @description SwordPlayerState(animation, hitbox)
/// @arg animation
/// @arg hitbox
function PlayerState_Sword(argument0, argument1){
	
	var _attackanimation = argument0;
	var _attackhitbox = argument1;

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
	
	PlayerSwordProcess(_attackanimation, _attackhitbox);
	
	if (animation_end())
	{
		//sprite_index =  PlayerSpriteSet[PLAYERSTATE_SPRITE.IDLE];
		//global.Immortal = 1;
		AttackState = ATTACK.FREE;
	}
	
}