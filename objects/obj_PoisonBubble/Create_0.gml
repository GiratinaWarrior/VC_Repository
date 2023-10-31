/// @description Insert description here
// You can write your code in this editor

PoisonBubble_Growth = 0.05;

PoisonBubble_Charged = false;

PoisonBubble_Wave = 0;

PoisonBubble_PopFunction = function()
{
	sprite_index = spr_PoisonBubble_Pop;
	audio_play_sound(sound_PoisonBubble_Pop,20, false);
}
