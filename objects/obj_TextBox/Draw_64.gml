/// @description Draw the Text

TalkKey = mouse_check_button_pressed(mb_right);

//Set the position of the text
TextBox_X = 32;
TextBox_Y = room_height - TextBox_Height - 32;

///////////////////////////////////Set up the text box
if (!TextBox_Setup)
	{
		TextBox_Setup = true;
		DrawSetText(c_black, ft_Sign, fa_left, fa_top);
		
		//Loop through pages
		TextBox_PageNumber = array_length(TextBox_Text);
		for (var p = 0; p < TextBox_PageNumber; p++)
		{
			
			//Find how many characters are in each page
			TextBox_TextLength[p] = string_length(TextBox_Text);
			
			//Set the offset of the x coordinate
				TextBox_OffsetX[p] = 960 - TextBox_Width/2;
			
		}//end loop through pages
		
	}//end if textbox not set up

//Type the text
if (TextBox_DrawChar < TextBox_TextLength[TextBox_Page])
{
	TextBox_DrawChar += TextBox_TextSpeed;
	TextBox_DrawChar = clamp(TextBox_DrawChar, 0, TextBox_TextLength[TextBox_Page]);
}

//Flip through pages

/////////////////////if talk key pressed
if (TalkKey)
{
	///if the text has finished typing for this page
	if (TextBox_DrawChar == TextBox_TextLength[TextBox_Page])
	{
		//if there are more pages left
		if (TextBox_Page < TextBox_PageNumber - 1)
		{
			TextBox_Page++;
			TextBox_DrawChar = 0;
		}//end still pages left
		
		//If there are no more pages left
		else
		{
			instance_destroy();
		}//end no more pages
		
	}//end text finished
	
	//If not done typing
	else
	{
		TextBox_DrawChar = TextBox_TextLength[TextBox_Page];
	}//end not done typing
	
}//end if talk key pressed

////////////////////Draw the textbox

//Set textbox image variables
TextBox_Image += TextBox_ImageSpeed;
TextBox_SpriteWidth = sprite_get_width(TextBox_Sprite);
TextBox_SpriteHeight = sprite_get_height(TextBox_Sprite);

//draw back of text box
draw_sprite_ext(TextBox_Sprite, TextBox_Image, TextBox_X + TextBox_OffsetX[TextBox_Page], TextBox_Y, TextBox_Width/TextBox_SpriteWidth, TextBox_Height/TextBox_SpriteHeight, 0, c_white, 1);

//draw the text
var _drawtext = string_copy(TextBox_Text[TextBox_Page], 1, TextBox_DrawChar);

DrawSetText(c_black, ft_NPC, fa_left, fa_top);
draw_text_ext(TextBox_X + TextBox_OffsetX[TextBox_Page] - 64, TextBox_Y, _drawtext, TextBox_LineSep, TextBox_LineWidth);

//show_debug_message("Text Displayed");

//draw_sprite_ext(spr_BigMoon, 0, TextBox_X + TextBox_OffsetX[TextBox_Page] + TextBox_Border, TextBox_Y + TextBox_Border, 1, 1, 0, c_white, 1);
show_debug_message("TextBox_X: {0}", TextBox_X);
show_debug_message("TextBox_Y: {0}", TextBox_Y);