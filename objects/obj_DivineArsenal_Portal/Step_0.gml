/// @description Insert description here
// You can write your code in this editor

//portal state machine
switch(DivineArsenalPortal_State)
{
	//Appear State: the portal is summoned
	case DIVINEARSENALPORTAL_STATE.APPEAR:
		
		image_alpha = min(image_alpha + 0.05, 1);
		
		if (image_alpha == 1)
		{
			DivineArsenalPortal_State = DIVINEARSENALPORTAL_STATE.IDLE;
		}
		
		break;//end Appear State
		
	//Idle State: the portal is waiting around
	case DIVINEARSENALPORTAL_STATE.IDLE:
	
		if (DivineArsenalPortal_ShootTimer++ > DivineArsenalPortal_ShootTimerLimit)
		{
			var _range = 56;
			instance_create_depth(x, y + random_range(-_range, _range), depth - 1, obj_DivineArsenal_Weapon);
			DivineArsenalPortal_ShootTimer = 0;
		}
	
		break;//end Idle State
		
	//Conjure State: a weapon is created
	case DIVINEARSENALPORTAL_STATE.DISAPPEAR:
		
		FadeAndDestroy(0.05);
		
		break;//end Conjure State
		
}//end state machine




