/// @description
xSpeed = 0;
ySpeed = 0.00001;
Gravity = 0.3;

obj_Player.hascontrol = false;

var _contCutscene = function()
{
	//Activate the next stage of the cutscene
	with (obj_MalvaliaFirstFightCutscene)
	{
		MalvaliaFirstFightCutscene_State = MALVALIAFIRSTFIGHTCUTSCENE.MALVALIA_DEFEATED_TALK;
	}
}
	
//After a certain amount of time has passed, activate the next stage of the cutscene
TimeSourceCreateAndStart(140, _contCutscene, [], 1);



