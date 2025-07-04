/// @desc Important Stuff

#region Movement

ySpeed += Gravity;

	//turn around at a ledge
	Wall_LedgeTurn();

	//Turn direction at a wall
	Wall_SwitchRun();

	//Collision for walls when falling
	Wall_FallOn();

	x += xSpeed;

	y += ySpeed;

#endregion

#region Change State

//If MM has not been attacked
if (!Attacked)
{
	//If the Masked Mantis is on the ground
	if (place_meeting(x, y + 1, obj_Wall))
	{
	
		Grounded = true;
	
		//If it's time for a Super Jump, enter the charge mode
		if (JumpTimer > JumpLimit && JumpPower != 0)
		{
			MantisState = MASKMANTIS_STATE.CHARGE;
		}//end Super Jump time
	
		//If Super Jump is not ready yet, just walk around
		else
		{
			JumpTimer++;
			MantisState = MASKMANTIS_STATE.WALK;
		}//end Super Jump not ready 
	
	}//end if MM on the ground

	//If the Masked Mantis is not on the ground
	else
	{
	
		JumpTimer = 0;
	
		Grounded = false;
	
		//If MM is jumping, activate the jumping state
		if (ySpeed < 0)
		{
			MantisState = MASKMANTIS_STATE.JUMP;
		}//end MM jumping
	
		//If MM is falling, initiate the falling state
		else
		{
			MantisState = MASKMANTIS_STATE.FALL;
		}//end MM falling
	
	}//end MM in the air 
}

//Else If MM has been attacked
else
{
	MantisState = MASKMANTIS_STATE.KNOCKBACK;
}

#endregion

//State Machine
switch(MantisState)
{
	//If MM is walking
	case MASKMANTIS_STATE.WALK:
	
		//Face the direction they're moving
		if (xSpeed != 0)
		{
			image_xscale = -sign(xSpeed);
		}
	
		//Change the sprite to walking
		image_speed = 1;
		sprite_index = spr_MaskMantisMoving; 
		
		break; //end MM waling
		
	//If MM is charging a jumping
	case MASKMANTIS_STATE.CHARGE:
		//Stop moving
		x -= xSpeed;
		
		//Set the sprite to the charging sprite
		sprite_index = spr_MaskMantisCharge;
		
		//If the charge is finished
		if (ChargeTimer > ChargeLimit)
		{
			ySpeed = -JumpPower; //Jump
			ChargeTimer = 0; //Reset the Charge Timer
		}
		//If the charge is not finished
		else
		{
			ChargeTimer++; //Increment the Charge Timer
		}
		break; //end MM charging
		
	//If MM is jumping
	case MASKMANTIS_STATE.JUMP:
	
		//Damage = 2;
	
		//Face the direction they're moving
		if (xSpeed != 0)
		{
			image_xscale = -sign(xSpeed);
		}
	
		//Set the sprite to the jumping sprite
		sprite_index = spr_MaskMantisJumping;
		
		//Reset the horizontal speed back to normal
		//xSpeed = MantisSpeed * image_xscale;
		xSpeed = -JumpPower/2 * image_xscale;
		
		
		if (place_meeting(x, y + ySpeed, obj_Wall))
		{
			ySpeed = 0;
		}
		
		SpeedTrail(c_green);
		
		break; //end MM jumping
		
	//If MM is falling
	case MASKMANTIS_STATE.FALL:
		
		//Face the direction they're moving
		if (xSpeed != 0)
		{
			image_xscale = -sign(xSpeed);
		}
		
		//Set the sprite to the falling sprite
		sprite_index = spr_MaskMantisFalling;
		
		if (place_meeting(x, y + ySpeed + 1, obj_Wall))
		{
			xSpeed = MantisSpeed * image_xscale;
		}
		
		break; //end MM falling
	
	//If hit by an attack
	case MASKMANTIS_STATE.KNOCKBACK:
		
		image_speed = 0;
		
		xSpeed = lengthdir_x(5, HitFrom);
		
		break;
	
}
