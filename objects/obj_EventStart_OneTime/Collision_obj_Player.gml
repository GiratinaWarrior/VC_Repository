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
if (object_index == obj_EventStart_OneTime)
{
	instance_destroy();
}
else if (object_index == obj_EventStart_Stay)
{
	
}