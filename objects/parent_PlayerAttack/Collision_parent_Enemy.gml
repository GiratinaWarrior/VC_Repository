/// @description Attack collides with enemy

//If the attack can't phase through enemies, destroy itself
if (!CanPhase_Enemy)
{
	instance_destroy();
}//end if can't phase through enemy