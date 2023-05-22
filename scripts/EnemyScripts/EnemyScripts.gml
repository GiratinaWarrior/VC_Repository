// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enemy_RecoverFromAttack(_func){
	
	Attacked = false;
	HitFlash = 0;
	HitFrom = 0;
	image_alpha = 1;
	
}

function Enemy_Stunned()
{
	//Decrease enemy health
	Health -= other.PlayerAttackDamage;
	
	//store the direction of the attack relative to the enemy
	HitFrom = point_direction(other.x, other.y, x, y);
	
	Attacked = true;
	
	//FlashLength
	
	
}