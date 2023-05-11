/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

menu_x = room_width/2;// - gui_margin;
menu_y = room_height + 200;
menu_y_target = room_height/2 + 200;
menu_speed = 25; //lower is faster
menu_itemheight = font_get_size(font_TitleScreen);
menu_committed = -1;
menu_control = true;

menu[2] = "Continue";
menu[1] = "New Game"
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;

FirstPlayerRoom = Room_NoxCity;
