
function PlayerState_LunarCannon(){

	audio_play_sound(sound_MoonShoot, 5, false);
	var MagicAttack = instance_create_layer(x, y - 1, layer, obj_LunarCannon);
	MagicAttack.speed = 7;
	LunarCannonCooldown = LunarCannonCooldownMax;
			
	//switch-case for the players direction
	switch(obj_Player.image_xscale){
					
		case 1:
			MagicAttack.direction = 0;
			break;
			
		case -1:
			MagicAttack.direction = 180;
			break;
		
	}//end player direction switch case
			
	PlayerState = PLAYERSTATE.NEUTRAL;

}