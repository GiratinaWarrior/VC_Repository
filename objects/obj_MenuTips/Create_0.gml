/// @description Insert description here
// You can write your code in this editor

TipText = 
[
	"Stick around for some tips, why don't ya?",
	"Press 'F' to heal yourself when you're injured",
	"Press 'Q' to launch your Lunar Cannon. \nIt makes for a good ranged attack, but takes up a lot of vallen, so use it sparingly",
	"Attacking enemies will recover your vallen, \nso don't be scared to get up and personal!",
	"If strike an enemy from above, \nyou'll be launched upwards, like a pogo stick!",
]

TipText_ShrineSoldier = 
[
	"Running into a guy holding a spear is a very bad idea"
];

TipText_ShrineGeneral = //array_concat(TipText,
	[
		"Watch the Shrine General's hands carefully, and you'll know what he'll do!",
		"If you jump over the Shrine General, he'll have no way to hit you!",
		"Press 'V' to skip to the fight sequence",
		"Harmpha Harmpha Har Har Har! Who's giving ya tips to win, what a loser! Har Har Har!"
	]
//)

TipText_DarkShrine = //array_concat(TipText,
	[
		"Guardark's will only attack you if you can see you straight ahead!",
		"Running into a giant possessed Axeye is a very bad idea",
		"Chakrolem's are faster than you. Maybe there's another way to stop them?"
	]
//)

TipText_Lavender = //array_concat(TipText,
	[
		"Lavender is kinda invincible when the Blood Petals fall.",
		"Those Poison Bubble Flowers look very alive! Is there a way to fix that?",
		"Running into a giant weapon is a very bad idea. But is what about jumping on it?"
	]
//)

TipText_Malvalia = //array_concat(TipText,
	[
		"Malvalia's too prideful to try dodging your attacks, perhaps you could take advantage of this?",
		"The Red Needles look like they hurt, she deserves a taste of her own medicine!"
	]
//)

CurrentTip = TipText[0];//TipText[irandom_range(0, array_length(TipText) - 1)]
//NextTip = TipText[irandom_range(0, array_length(TipText) - 1)];

TipFade = 0;
TipFadeChange = 0.01;
TipFadeLimit = 2;




