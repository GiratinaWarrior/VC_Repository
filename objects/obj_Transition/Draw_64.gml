/// @description Draw Black Bars
if (mode != TRANS_MODE.OFF) 
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, w, percent * h_half, false);
	draw_rectangle(0, h, w, h - (percent * h_half), false);

	//var _fade = map(percent, 0, MaxReach, 0, 255);

	//draw_sprite_ext(spr_BlackShadow, 0, 0, 0, 100, 100, 0, 0, 255 * percent)

}

draw_set_color(c_white);
//draw_text(50, 50, string(percent));