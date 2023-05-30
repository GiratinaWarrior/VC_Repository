/// @description
draw_sprite_stretched(TextBox_BoxSprite, 0, TextBox_X, TextBox_Y, TextBox_Width, TextBox_Height); 

DrawSetText(TextBox_TextColor, TextBox_Font, fa_left, fa_top);

if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
{
	TextBox_CharCount += TextBox_CharIncrease;
}

TextBox_TextSect = string_copy(TextBox_Text[TextBox_Page], 1, TextBox_CharCount); 

draw_text_ext(TextBox_X + TextBox_BufferX, TextBox_Y + TextBox_BufferY, TextBox_TextSect, TextBox_TextHeight * 2, TextBox_TextWidth);