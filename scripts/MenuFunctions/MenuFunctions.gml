/// @description Menu(x, y, options, description, font, box, text color, text chosen color)
/// @arg x
/// @arg y
/// @arg options
/// @arg description
/// @arg font
/// @arg box
/// @arg text color
/// @arg text chosen color

/// x and y refer to the position of the menu
/// options refers to the individual menu options, which holds a name and function
/// description refers to a description of what the menu is, such as "Choose an attack"
/// font is the font of the text
/// box is the box sprite that surrounds the menu
/// text color is the default color of the text
/// text chosen color is the color of the text that is being hovered over

#macro TEXT_MARGIN 8

function Menu(_x, _y, _options, _description = -1, _font = ft_TitleScreen, _box = blanksprite, _textcolor = c_white, _textcolorchosen = c_yellow){
	
	//Create Menu object instance
	with (instance_create_depth(x, y, -999, obj_Menu))
	{
		
		Menu_Hover = 0;
		
		Menu_Box = _box;
		
		Menu_TextColor = _textcolor;
		
		Menu_ChosenTextColor = _textcolorchosen;
		
		//Set the options and description
		Menu_Options = _options;	
		Menu_Desc = _description;
		Menu_NumOfOptions = array_length(_options);
		Menu_HoverMarker = "> ";
		
		//Set the font and text margin
		Menu_Margin = TEXT_MARGIN;
		Menu_Font = _font;
		draw_set_font(Menu_Font);
		
		//Set the width
		Menu_Width = 1;
		
		if (_description != -1)
		{
			Menu_Width = max(Menu_Width, string_width(_description));
		}
		
		for (var i = 0; i < Menu_NumOfOptions; i++)
		{
			Menu_Width = max(Menu_Width, string_width(_options[i][0]));
		}
		Menu_Width += string_width(Menu_HoverMarker);
		
		//Set the height
		Menu_HeightLine = 30;
		Menu_Height = Menu_HeightLine * (Menu_NumOfOptions + !(Menu_Desc == -1));
		
		//Set the size of the text box
		Menu_FullWidth = Menu_Width + (Menu_Margin * 2);
		Menu_FullHeight = Menu_Height + (Menu_Margin * 2);
	
	}//end create Menu instance

}//end Menu function