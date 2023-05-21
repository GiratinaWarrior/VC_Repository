/// @description Insert description here

// You can write your code in this editor

draw_sprite(spr_NPCTextBox, 0, x, y);

draw_set_font(ft_NPC);
draw_set_color(c_white);

DrawSetText(c_white, ft_NPC, fa_left, fa_top);

if (CharCount < string_length(Text[Page]))
{
	CharCount += CharIncrease;
}

TextSect = string_copy(Text[Page], 1, CharCount);

draw_text_ext(x + xBuffer, y + yBuffer, TextSect, StringHeight - 33, BoxWidth);