/// @description CutsceneText(text, name, color, font, box)
/// @arg text is the text displayed
/// @arg name is the name of the speaker
/// @arg font is the font choice of the text
/// @arg color is the color of the text
/// @arg box is the sprite of the textbox
function CutsceneText(_text = [""], _name = "" ,_font = ft_NPC, _color = c_black , _box = spr_TextBox){
	
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
	}
	
}