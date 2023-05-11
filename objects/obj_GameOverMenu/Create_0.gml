/// @description GUI/Vars/Menu setup

menu_x = room_width/2;// - gui_margin;
menu_y = room_height + 200;
menu_y_target = room_height/2 + 300;
menu_speed = 25; //lower is faster
menu_itemheight = font_get_size(font_TitleScreen);
menu_committed = -1;
menu_control = true;

menu[1] = "Strive";
menu[0] = "Surrender";

menu_items = array_length_1d(menu);
menu_cursor = 2;

//menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);