sprite_index = spr_RoseBookshelf;


EntityAdditionFunc = function()
{
	
	RoseRoomBookShelf_MainTextArray = 
	[
		"The books are all so beautiful...",
		"Let's see what book we should read now",
		"....",
	]
	
	if (myTextbox == noone)
	{

		var BookArray;

		BookArray[0] = function()
		{
			
			var _dawnOfNoxText = 
			[
				 "It's 'The Dawn of Nox'",
				 "Ah, the nostalgia it brings...",
				 "Mother used to read this as our bedtime story.",
				 "Not that I remember the plot or anything...",
				 "Oh well, not like it matters anyway, right?"
			];
			
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _dawnOfNoxText)
			
		}
		
		BookArray[1] = function()
		{
			
			var _godOfLaughs = 
			[
				"It's 'To be the Lord of Laughs'",
				"What's up with these jokes?", 
				"Does the Lord of Laughs only know puns?"
			];
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _godOfLaughs);
		
		}
		
		BookArray[2] = function()
		{
			
			var _flowerHandbook = 
			[
				"It's 'Flower Handbook'", 
				"Ooh, our families names are in here",
				"Except Brother, but he already had a name."
			];
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _flowerHandbook);
			
		}
		
		BookArray[3] = function()
		{
			var _shrineGeneralGuide = 
			[
				"It's 'How to Conjure the Greatest Servant Ever'",
				"Wait! Is this the book Mother used to make that Shrine General!",
				"How did she not realize it was satire?",
				"No wonder he turned out like that!"
			]
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _shrineGeneralGuide);
		}
		
		BookArray[4] = function()
		{
		
			var _valnyxShrine = 
			[
				"It's 'The Nature of Valnyx Shrine'!",
				"It says here that Valnyx Shrine can transform!",
				"But only to the will of the strongest person inside it.",
				"Let's hope no one stronger than Mother arrives."
			]
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _valnyxShrine);
		}
		
		BookArray[5] = function()
		{
			
			var _mysteryBook = 
			[
				"Hmm?",
				"There's a wierd book hidden at the back of the shelf?",
				"The cover's dusty, and the language isn't Noxian",
				"Who exactly was reading this?"
			];
			
			TextBox_Text = array_concat(RoseRoomBookShelf_MainTextArray, _mysteryBook)
		
		}
		
		var chosenText = BookArray[irandom_range(0, 4)];
		
		chosenText();
	
	}
	
}
