/// @description Flash 
if (!Attacked)
{
	draw_self();
}
else
{
	gpu_set_fog(true, c_yellow, 0, 0);
	draw_self();
	gpu_set_fog(false, c_yellow, 0, 0);
}





