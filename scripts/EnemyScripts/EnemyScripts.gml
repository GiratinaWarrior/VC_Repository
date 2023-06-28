// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enemy_RecoverFromAttack(_additionalfunc = function(){}){
	
	_EnemyRecoverAdditionalFunction = _additionalfunc;
	
	var _recovery = function()
	{
		Attacked = false;
		HitFlash = 0;
		HitFrom = 0;
		image_alpha = 1;
		_EnemyRecoverAdditionalFunction();
		Attacked = false;
	}
	
	var _newMeth = method(self, _recovery);
	
	//FlashLength
	var _newshit = time_source_create(time_source_game, FlashLength, time_source_units_frames, _newMeth);
	
	time_source_start(_newshit);
	
}

function Enemy_Stunned(_morehurtfunc = function(){}, _morerecoverfunc = function(){})
{
	//Decrease enemy health
	Health -= other.PlayerAttackDamage;
	
	//store the direction of the attack relative to the enemy
	HitFrom = point_direction(other.x, other.y, x, y);
	
	Attacked = true;
	
	_morehurtfunc();
	
	Enemy_RecoverFromAttack(_morerecoverfunc);
	
}

function Instance_InView(_inst = id)
{
	//If the player is alive, check if the player can see the instance
	if (abs(_inst.x - obj_Camera.x) <= global.xrange && abs(_inst.y - obj_Camera.y) <= global.yrange)
	{
		return true;
	}
	
	//If the player cannot see the instance
	else
	{
		return false;
	}
	
	
}	