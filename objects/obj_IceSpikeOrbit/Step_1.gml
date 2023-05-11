/// @description If destroyed

if ((Indestructible == false) && (Health <= 0))
{
	instance_destroy();
}