/// @description Draw Menu
draw_set_font(font_TitleScreen);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

//For loop for the menu 
for (var i = 0; i < menu_items; i++) 
{
	var offset = 2;
	var txt = menu[i];
	
	//if this menu option is selected, add an arrow and make it white
	if (menu_cursor == i) 
	{
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	
	}
	//if its not selected 
	else {
		var col = c_grey;
	
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));

	draw_set_color(c_black);
	draw_text(xx - offset, yy, txt);
	draw_text(xx + offset, yy, txt);
	draw_text(xx, yy - offset, txt);
	draw_text(xx, yy + offset, txt);
	
	draw_set_color(col);
	draw_text(xx, yy, txt);
	
	
}




