/// @description PlayerTakenDamage();
function PlayerTakenDamage(){

	//show_debug_message(global.Immortal);
	if (global.Immortal == 1)
	{
		audio_play_sound(sound_PlayerDamage, 5, false);
	
		global.Health -= other.Damage * global.Immortal;
	
		AttackerID = other.id;
	
		AttackState = ATTACK.HURT;
	
		hascontrol = false;
	}

}