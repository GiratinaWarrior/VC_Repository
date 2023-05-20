/// @description Draw the Menu

//Draw box
draw_sprite_stretched(spr_MenuBox, 0, x - Menu_Margin, y - Menu_Margin, Menu_FullWidth, Menu_FullHeight);

var _textcolor = c_black;

//set the text
DrawSetText(_textcolor, Menu_Font, fa_left, fa_top);

//create a description check variable
var _desc = !(Menu_Desc == -1);

//loop for each menu option, and print them individually
for (l = 0; l < (Menu_NumOfOptions + _desc); l++)
{
	draw_set_color(_textcolor);
	//If there is a description, write the description
	if (l == 0) && (_desc)
	{
		draw_text(x, y, Menu_Desc);
	}//end if description
	
	//If there is no description, or its already been drawn
	else
	{
		//Get option string
		var _str = Menu_Options[l - _desc][0];
		
		//If we're hovering over this menu option
		if (Menu_Hover == l - _desc)
		{
			draw_set_color(c_yellow);
			_str = Menu_HoverMarker + _str;
		}
		
		//Draw the text
		draw_text(x, y + (l * Menu_HeightLine), _str);
	}//end draw options
}