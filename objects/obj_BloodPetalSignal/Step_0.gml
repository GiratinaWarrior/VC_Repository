/// @description Insert description here
// You can write your code in this editor

image_angle -= BloodPetalSignal_RotateSpeed;
	
if (instance_exists(obj_LavenderBossBattle_Prologue))
{
	if (obj_LavenderBossBattle_Prologue.LavenderBossBattlePrologue_CurrentState == LAVENDERBOSSBATTLE_PROLOGUE_STATE.IDLE)
	{
		FadeAndDestroy(0.1);
	}
	else
	{
		image_alpha = min(image_alpha + BloodPetalSignal_FadeChange, 0.7);
	}
	
	x = obj_LavenderBossBattle_Prologue.x + StartXOffset;
	y = obj_LavenderBossBattle_Prologue.y + StartYOffset;
}


