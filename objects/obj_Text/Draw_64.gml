/// @description Display the text

//The location of the text box on the GUI
TextBox_X = TextBox_EdgeMargin;

//Decide where the should be positioned on the screen
switch (TextBox_UIPosition)
{
	
	//If the text box should be at the top of the screen
	case TEXTBOX_POS.TOP:
		TextBox_Y = TextBox_Pos_TopPlacement;
		break;//end top of screen
		
	//If the text box should be at the bottom of the screen
	case TEXTBOX_POS.BOTTOM:
		TextBox_Y = TextBox_Pos_BottomPlacement;
		break;//end bottom of screen
		
	default:
		TextBox_Y = TextBox_UIPosition;
		break;
	
}//end textbox position

//show_debug_message("TextBox_UIPosition: {0}", TextBox_UIPosition);

//Draw the text box to the screen
draw_sprite_stretched(TextBox_BoxSprite, 0, TextBox_X, TextBox_Y, TextBox_Width, TextBox_Height); 

//Set the text just right
DrawSetText(TextBox_TextColor, TextBox_Font, fa_left, fa_top);

//Increase the number of characters displayed
if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
{
	TextBox_CharCount += TextBox_CharIncrease;
}//end increase characters displayed

//The section of the text to be displayed
TextBox_TextSect = string_copy(TextBox_Text[TextBox_Page], 1, TextBox_CharCount); 

//Draw the text to the screen
draw_text_ext(TextBox_X + TextBox_BufferX, TextBox_Y + TextBox_BufferY, TextBox_TextSect, TextBox_TextHeight * 2, TextBox_TextWidth);