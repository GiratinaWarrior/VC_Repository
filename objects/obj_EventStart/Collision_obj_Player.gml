/// @description
with(other)
{
	hascontrol = false;
}
if (!EventTriggered)
{
	eventFunc();
	EventTriggered = true;
}
instance_destroy();