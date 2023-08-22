/// @description CutsceneText(text, name, color, font, box)
/// @param textarray is the text displayed
/// @param name is the name of the speaker
/// @param pos is the location of the textbox on the screen
/// @param font is the font choice of the text
/// @param color is the color of the text
/// @param box is the sprite of the textbox
function CutsceneText(_text = [""], _name = "" , _pos = TEXTBOX_POS.BOTTOM, _font = ft_NPC, _color = c_black , _box = spr_TextBox, _skippable = true){
	
//	var _textObj = instance_create_depth(x, y, -99, obj_Text);
	
	with(instance_create_depth(x, y, -99, obj_Text))
	{
		TextBox_Text = _text;
		if (_name != "")
		{
			for (var i = 0; i < array_length(TextBox_Text); i++)
			{
				TextBox_Text[i] = _name + ": " + TextBox_Text[i];
			}
		}
		TextBox_Font = _font;
		TextBox_BoxSprite = _box;
		TextBox_TextColor = _color;
		
		TextBox_UIPosition = _pos;
		
		TextBox_Cutscene = true;
		
		TextBox_TextSkippable = _skippable;
		
	}
	
	//return _textObj;
	
}
	
//---------This function creates a new text in the text array--------------------//
/// @param text
function Text(_text)
{
	
	TextBox_Text[TextBox_PageNumber] = _text;
	TextBox_PageNumber++;

}
