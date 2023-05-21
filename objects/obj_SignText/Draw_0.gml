/// @description Draw the text
var halfw = w * 0.5;

//Draw Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - halfw - border, y - h - (border* 2), x + halfw + border, y, 15, 15, false);
draw_sprite(spr_TextMarker, 0, x, y);
draw_set_alpha(1);

//Draw Text
DrawSetText(c_white, ft_Sign, fa_center, fa_top);
draw_text(x, y - h - border, text_current);