/// @description

WallCondition_Conditional = false;

WallCondition_RunConditionFunc = function()
{
	if (WallCondition_Conditional)
	{
		instance_destroy();
	}
}












