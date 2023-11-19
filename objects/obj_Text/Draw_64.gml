/// @description Display the text

//array_resize(TextBox_Voices, array_length(TextBox_Text));

//The location of the text box on the GUI
TextBox_X = TextBox_EdgeMargin;

TextBox_TextHeight = string_height(TextBox_Text) * TextBox_TextHeightModifier;

switch(TextBox_Font)
{
	case ft_NPC:
		TextBox_TextHeightModifier = 1.2;
		break;
	
	case ft_Lavender:
		TextBox_TextHeightModifier = 1;
		break;
	
}

TextBox_TextHeight = string_height(TextBox_Text) * TextBox_TextHeightModifier;

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

TextBox_TextHeight = string_height(TextBox_Text) * TextBox_TextHeightModifier;

if (TextBox_BoxSprite != blanksprite)
{
	//Draw the text box to the screen
	draw_sprite_stretched(TextBox_BoxSprite, 0, TextBox_X, TextBox_Y, TextBox_Width, TextBox_Height); 
}

//Set the text just right
DrawSetText(TextBox_TextColor, TextBox_Font, fa_left, fa_top);

//Increase the number of characters displayed
if (TextBox_CharCount < string_length(TextBox_Text[TextBox_Page]))
{
	TextBox_CharCount += (TextBox_CharIncrease * TextBox_TalkSpeed);
}//end increase characters displayed

if (TextBox_CharCount <= TextBox_CharIncrease)
{
	audio_play_sound(sound_Select, 200, false);
	var _currentSound = TextBox_Voices[TextBox_Page];
//	show_debug_message("Current Sound: {0} ", _currentSound);
	audio_play_sound(_currentSound, 1000, false, 5);
	
	if (TextBox_Page != 0) && (TextBox_Voices[TextBox_Page] != blanksound) && (TextBox_Voices[TextBox_Page - 1] != TextBox_Voices[TextBox_Page])
	{
		audio_stop_sound(TextBox_Voices[TextBox_Page - 1]);
	}
	
}

//The section of the text to be displayed
TextBox_TextSect = string_copy(TextBox_Text[TextBox_Page], 1, TextBox_CharCount); 

TextBox_TextHeight = string_height(TextBox_Text) * TextBox_TextHeightModifier;

//Draw the text to the screen
draw_text_ext(TextBox_X + TextBox_BufferX, TextBox_Y + TextBox_BufferY, TextBox_TextSect, TextBox_TextHeight, TextBox_TextWidth);