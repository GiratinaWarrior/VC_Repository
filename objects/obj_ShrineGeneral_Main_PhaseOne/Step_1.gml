/// @description
if (Health <= 0)
{
	
	instance_destroy(ShrineGeneral_LeftArm);
	instance_destroy(ShrineGeneral_RightArm);
	instance_destroy(obj_ShrineGeneral_RapidPunch);
	instance_destroy(obj_ShrineGeneral_RapidPunch_Finish);
	instance_create_depth(x, y, depth - 1, obj_ShrineGeneralDeath);
	instance_destroy();
	
}