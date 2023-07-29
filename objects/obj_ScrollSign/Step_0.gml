/// @description Insert description here
// You can write your code in this editor
y += NPC_BounceSpeed;

if (y >= midpoint + NPC_Amplitude) || (y <= midpoint - NPC_Amplitude) 
{
	NPC_BounceSpeed *= -1;
}