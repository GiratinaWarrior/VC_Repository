/// @description Insert description here
// You can write your code in this editor

if (Health <= 0)
{
	with (obj_LavenderBossIntro_Prologue)
	{
		LavenderBossIntroPrologue_State = LAVENDERBOSSINTROPROLOGUE_STATE.BATTLE_END;
		LavenderBossIntroPrologue_BattleEnd_Lavender = instance_create_layer(other.x, other.y, other.layer, obj_LavenderBossBattle_Prologue_Defeated);
		LavenderBossIntroPrologue_BattleEnd_Lavender.image_index = other.image_index;
		LavenderBossIntroPrologue_BattleEnd_Lavender.image_xscale = other.image_xscale;
	}
	instance_destroy(parent_EnemyAttack);
	instance_destroy(parent_Enemy);
	
	instance_destroy();
}




