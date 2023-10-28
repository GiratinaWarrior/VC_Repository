/// @description Insert description here
// You can write your code in this editor

TipText = 
[
	"Press 'F' to heal yourself when you're injured",
	"Press 'Q' to launch your Lunar Cannon. \nIt makes for a good ranged attack, but takes up a lot of vallen, so use it sparingly",
	"Attacking enemies will recover your vallen, \nso don't be scared to get up and personal!",
	"Right Click or press Space to interact with objects, \neveryone has something to say",
	"If strike an enemy from above, \nyou'll be launched upwards, like a pogo stick!",
	"Running into a guy holding a spear is a very bad idea",
	"Hold the jump button to jump higher",
	"Some projectile attacks can be reflected with your Selene Sword, \nbut not all of them!",
]

CurrentTip = TipText[0];
NextTip = TipText[irandom_range(0, array_length(TipText) - 1)];

TipFade = 0;
TipFadeChange = 0.01 * 1;
TipFadeLimit = 2;




