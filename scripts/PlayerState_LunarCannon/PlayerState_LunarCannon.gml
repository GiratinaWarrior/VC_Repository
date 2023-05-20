
function PlayerState_LunarCannon(){
	
		xSpeed = 0;
	
		var _fmoon = function()
		{
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
		}
		//var _hello = 1;
	
		image_speed = 1;
		
		sprite_index = spr_RoseLunarCannon;
	
		if (image_index > 3)
		{
			var _knockdir;
			if (image_xscale == 1) _knockdir = 180;
			else _knockdir = 0;
			Knockback(13, _knockdir);
		}
	
		if (animation_end()) 
		{
			_fmoon();
			xSpeed = 0;
			PlayerState = PLAYERSTATE.NEUTRAL;
		}

}