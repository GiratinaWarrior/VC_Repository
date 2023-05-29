/// @description Set the variables

depth = -999;

///Text box parameters
TextBox_Width = 1086;
TextBox_Height = 1080/4;
TextBox_Border = 0;
TextBox_LineSep = 60;
TextBox_LineWidth = TextBox_Width - (TextBox_Border * 2);


TextBox_Sprite = spr_TextBox;
TextBox_Image = 0;
TextBox_ImageSpeed = 1;

///Text
TextBox_Page = 0;
TextBox_PageNumber = 0;
TextBox_Text = 
[
	"Hello, let's test out this textbox.",
	"SCREAM MORTAL. So this is the STRING WORLD",
	"Ah i see. counterpoint. You're a terrorist"
]
TextBox_TextLength[0] = string_length(TextBox_Text[0]);
TextBox_DrawChar = 0;
TextBox_TextSpeed = 1;
TextBox_Setup = false;

