/// @description Insert description here
// You can write your code in this editor

BorderBuffer = 5;

xBuffer = BorderBuffer;
yBuffer = BorderBuffer;

Text = "default";
BoxWidth = sprite_get_width(spr_NPCTextBox) - (2 * xBuffer);
StringHeight = string_height(Text);
Page = 0;
CharCount = 0;
CharIncrease = obj_NPC.TalkSpeed;