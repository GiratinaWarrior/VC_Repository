/// @description
if (sprite_index == Flower_MoveFromRightSprite || sprite_index == Flower_MoveFromLeftSprite)
{
	sprite_index = Flower_DefaultSprite;
	Flower_HitByPlayer = false;
}
else if (sprite_index == Flower_DieSprite)
{
	sprite_index = Flower_RegrowSprite;
}
else if (sprite_index == Flower_RegrowSprite)
{
	sprite_index = Flower_DefaultSprite;
	Flower_IsCut = false;
}










