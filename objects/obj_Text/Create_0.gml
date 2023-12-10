/// @description Create the TextBox and it's variables

Name = "";

//The distance the textbox is from the edge of the screen
TextBox_EdgeMargin = 10;

//The width and height of the text box
TextBox_Width = WINDOW_WIDTH - TextBox_EdgeMargin * 2; //1900 
TextBox_Height = WINDOW_HEIGHT/3 - TextBox_EdgeMargin; //350

//The Text displayed by the textbox
TextBox_Text = array_create(1, "");

TextBox_Voices = array_create(20, blanksound);

//show_debug_message("TextBox_Voices[0] = {0}", TextBox_Voices[0]);

//The height of the text
TextBox_TextHeightModifier = 1.2;

//The height of the text
TextBox_TextHeight = string_height(TextBox_Text) * TextBox_TextHeightModifier;

//show_debug_message("TextBox_TextHeight: {0}", TextBox_TextHeight);

//The page the text is on
TextBox_Page = 0;

//The number of characters displayed
TextBox_CharCount = 0;

//The rate the characters appear at
TextBox_CharIncrease = 1;
TextBox_TalkSpeed = 1;

//The minimum distance the text can be from the textbox
TextBox_BorderBuffer = 30;
TextBox_BufferX = TextBox_BorderBuffer;
TextBox_BufferY = TextBox_BorderBuffer;

TextBox_TextWidth = TextBox_Width - (TextBox_BufferX * 2);

TextBox_BoxSprite = spr_NewTextBox;
TextBox_TextColor = c_black;
TextBox_Font = ft_NPC;

TextBox_Pos_TopPlacement = TextBox_EdgeMargin;
//ft_Lavender: 1040;
TextBox_Pos_BottomPlacement = WINDOW_HEIGHT - TextBox_Height - TextBox_EdgeMargin;

enum TEXTBOX_POS
{
	TOP = 10,
	BOTTOM = 1023,
}

TextBox_UIPosition = TEXTBOX_POS.BOTTOM;

TextBox_Cutscene = false;

TextBox_TextSkippable = true;



