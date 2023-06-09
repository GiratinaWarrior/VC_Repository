/// @description
xSpeed = 0;
ySpeed = 0;
Gravity = 0.3;

ShrineGeneral_OneSpeed = 2;
ShrineGeneral_TwoSpeed = 5;

ShrineGeneral_Speed = ShrineGeneral_OneSpeed;

ShrineGeneral_State_One = 0;

enum SHRINEGENERAL_STATE_ONE
{
	IDLE,
	RAPID,
	ROCKET
}

ShrineGeneral_LeftArm = instance_create_depth(x, y, depth + 1, obj_ShrineGeneral_LeftArm_PhaseOne);
ShrineGeneral_RightArm = instance_create_depth(x, y, depth - 1, obj_ShrineGeneral_RightArm_PhaseOne);