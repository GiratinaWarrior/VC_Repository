/// @description Reset Game Speed & Room
SlideTransition(TRANS_MODE.GOTO, Room_GameOver);
with (obj_PlayerHealth)
{
	global.Health = MaxHealth;
}