/// @description Display the text

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