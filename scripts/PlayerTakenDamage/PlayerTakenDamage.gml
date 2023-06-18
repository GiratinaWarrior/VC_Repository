/// @description PlayerTakenDamage();
function PlayerTakenDamage(){

	//show_debug_message(global.Immortal);
	if (other.Damage > 0)
	{
		//audio_play_sound(sound_PlayerDamage, 5, false);
	
		AttackerID = other.id;
	
		global.Health -= other.Damage;
	
		PlayerState = PLAYERSTATE.HURT;
	
		hascontrol = false;
	}

}