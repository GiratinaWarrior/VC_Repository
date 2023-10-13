// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ChakrolemState_Chase(){

	//Set the sprite 
	if (sprite_index != spr_Chakrolem_Walk)
	{
		sprite_index = spr_Chakrolem_Walk;
		image_index = 0;
		image_speed = 1;
	}
	
	//Have the sprite be animated in tandem with the speed it moves at
	//image_speed = map(abs(xSpeed), 0, Chakrolem_ChaseSpeed, 0, 3);
	
	//If the player is alive
	if (instance_exists(obj_Player))
	{
		
		if (PlayerInRange == false)
		{
			Chakrolem_SurpriseSeq = noone;
			Chakrolem_State = CHAKROLEM_STATE.IDLE;
		}
		
		//Set the Chakrolem to move in the direction of the Player
		Chakrolem_Dir = sign(obj_Player.x - x);
		xSpeed = Chakrolem_ChaseSpeed * Chakrolem_Dir; //Approach(xSpeed, Chakrolem_ChaseSpeed * Chakrolem_Dir, sign(xSpeed));
		
		//If Chakrolem makes contact with the Player, starting charging
		if (place_meeting(x + Chakrolem_ChaseSpeed, y, obj_Player))
		{
			Chakrolem_State = CHAKROLEM_STATE.CHARGE;
		}
		
		
	}//end player alive
	
}//end ChakrolemState_Chase

function ChakrolemState_Charge()
{
	
	//Slow down Chakrolem
	xSpeed = 0//Approach(xSpeed, 0, sign(xSpeed) * 2);
	
	//Once Chakrolem has come to a stop
	if (xSpeed == 0)
	{
		
		//Set the sprite
		if (sprite_index != spr_Chakrolem_Charge_Full)
		{
			image_index = 0;
			image_speed = 1;
			sprite_index = spr_Chakrolem_Charge_Full;
		}
		
		//Freeze at the last frame
		AnimationStopAtEnd(spr_Chakrolem_Charge_Full);
		
		//Once the animation has ended, move on to the exlosion
		if (image_speed == 0)
		{
			Chakrolem_State = CHAKROLEM_STATE.EXPLODE;
		}
		
	}
	
}

function ChakrolemState_Explode()
{
	if (Chakrolem_Bomb == noone)
	{
		Chakrolem_Bomb = instance_create_depth(x, y, depth - 1, obj_ChakrolemBomb);
	}
}