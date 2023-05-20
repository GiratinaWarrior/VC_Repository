// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Moon(){

		
		//sprite_index = spr_PlayerMoonShoot;
		audio_play_sound(sound_MoonShoot, 5, false);
		var MagicAttack = instance_create_layer(x, y - 1, layer, obj_LunarCannon);
		MagicAttack.speed = 7;
		firingdelay = 60;
			
		//switch-case for the players direction
		switch(obj_Player.image_xscale){
					
			case 1:
				MagicAttack.direction = 0;
				break;
			
			case -1:
				MagicAttack.direction = 180;
				break;
		
		}//end player direction switch case
			
		Wall_StopRun();

		AttackState = ATTACK.FREE;
		
}
