/// @description Draw Black Bars
if (mode != TRANS_MODE.OFF) 
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, w * 2, percent * h_half, false);
	draw_rectangle(0, h, w * 2, h - (percent * h_half), false);

}

draw_set_color(c_white);