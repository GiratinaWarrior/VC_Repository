/// @description
if (Health <= 0)
{
	
	instance_destroy(ShrineGeneral_LeftArm);
	instance_destroy(ShrineGeneral_RightArm);
	instance_destroy(obj_ShrineGeneral_RapidPunch);
	instance_destroy(obj_ShrineGeneral_RapidPunch_Finish);
	audio_stop_sound(sound_ShrineGeneral_RapidPunch);
	
	ShrineGeneral_State_One = 9;
	
	/*
	with (instance_create_depth(x, y, depth - 1, obj_ShrineGeneralDeath))
	{
		image_xscale = other.image_xscale;
	}
	*/
	with(obj_ShrineGeneralBossIntro)
	{
		if (ShrineArenaBossIntro_GeneralIdle == noone)
		{
			ShrineArenaBossIntro_GeneralIdle = layer_sprite_create("Jest", other.x, other.y, spr_ShrineGeneral_FullBody_PhaseOne);
			layer_sprite_speed(ShrineArenaBossIntro_GeneralIdle, 0);
			layer_sprite_xscale(ShrineArenaBossIntro_GeneralIdle, other.image_xscale);
		}
		ShrineArenaBossIntro_State = SHRINEARENABOSSINTRO.BATTLE_END;
	}
	
	//instance_destroy();
	
}