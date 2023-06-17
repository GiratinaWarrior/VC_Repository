/// @description
var _currentDist = abs(RapidPunchFinish_MainBody.x - x);

//Do certain things based on what sprite the Finishing move is
switch (sprite_index)
{
	//If the Finish is going outwards
	case spr_ShrineGeneral_LeftArm_RapidPunchFlurry_PhaseOne:
		
		//If the Finish has reached its maximum distance, turn about
		if (_currentDist >= RapidPunchFinish_MaxDist)
		{
			speed *= -1;
			image_xscale *= -1;
			sprite_index = spr_ShrineGeneral_RightArm_RapidPunchFlurry_PhaseOne;
		}
		
		break;//end Finish moving away

	//If the Finish is returning
	case spr_ShrineGeneral_RightArm_RapidPunchFlurry_PhaseOne:
		
		//If the Finish has returned
		if (_currentDist <= 0)
		{
			with (RapidPunchFinish_MainBody)
			{
				ShrineGeneral_RapidPunch_State = SHRINEGENERAL_RAPIDPUNCH_STATE.COOLDOWN;
			}
			instance_destroy();
		}
	
		break;//end Finish return

}