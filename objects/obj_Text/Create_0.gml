/// @description Create the TextBox and it's variables

//The distance the textbox is from the edge of the screen
TextBox_EdgeMargin = 10;

//The width and height of the text box
TextBox_Width = 1980 - TextBox_EdgeMargin * 2;
TextBox_Height = 360 - TextBox_EdgeMargin * 1; 

//The Text displayed by the textbox
TextBox_Text = "default";

//The height of the text
TextBox_TextHeight = string_height(TextBox_Text);

//The page the text is on
TextBox_Page = 0;

//The number of characters displayed
TextBox_CharCount = 0;

//The rate the characters appear at
TextBox_CharIncrease = 1;

//The location of the text box on the GUI
TextBox_X = TextBox_EdgeMargin;
TextBox_Y = 1080 - TextBox_Height - TextBox_EdgeMargin;//1080 - TextBox_EdgeMargin;

//The minimum distance the text can be from the textbox
TextBox_BorderBuffer = 30;
TextBox_BufferX = TextBox_BorderBuffer;
TextBox_BufferY = TextBox_BorderBuffer;

TextBox_TextWidth = TextBox_Width - (TextBox_BufferX * 2);