image_alpha = 0;

BloodPetalSignal_RotateSpeed = 2;
BloodPetalSignal_FadeChange = 0.05;

BloodPetalSignal_Back = instance_create_depth(x, y, depth + 1, obj_BloodPetalSignal_Back);

StartXOffset = x - obj_LavenderBossBattle_Prologue.x;
StartYOffset = x - obj_LavenderBossBattle_Prologue.x;

with (BloodPetalSignal_Back)
{
	image_alpha = 0;
	BloodPetalSignal_FadeChange = other.BloodPetalSignal_FadeChange;
	BloodPetalSignal_RotateSpeed = -other.BloodPetalSignal_RotateSpeed;
	StartXOffset = x - obj_LavenderBossBattle_Prologue.x;
	StartYOffset = x - obj_LavenderBossBattle_Prologue.x;
}