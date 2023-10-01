/// @description Insert description here
// You can write your code in this editor

Speech[0] = "";
//Name = "";
NameInserted = false;
TextBox_Text[0] = "";
TextBox_PageNumber = 0;

TextBox_UIPosition = TEXTBOX_POS.BOTTOM;

//TextMarker_OffsetX = 0;
//TextMarker_OffsetY = -sprite_yoffset - 10;

Entity_Marker = instance_create_layer(x + TextMarker_OffsetX, y + TextMarker_OffsetY, layer, obj_RightClickMarker);

with (Entity_Marker)
{
	Marker_OffsetX = other.TextMarker_OffsetX;
	Marker_OffsetY = other.TextMarker_OffsetY;
}

Entity_Marker.Creator = id;

Entity_Marker.TalkRange = TalkRange;