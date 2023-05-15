/// @description PlayerState_RosyCut(sprite, hitbox, direction)
/// @arg sprite
/// @arg hitbox
/// @arg direction

function PlayerState_RosyCut(argument0, argument1, argument2){

	var _sprite = argument0;
	var _hitbox = argument1;
	
	if (sprite_index != _sprite)
	{
		//image_index = 0;
		image_speed = 1;
		sprite_index = _sprite;
	}
	
	var _offsetmax = 32;
		
	if (_hitbox == spr_RosyCutHitbox_Horizontal)
	{
		var _offsetx = argument2 * _offsetmax;
		var _offsety = 0;
	}
	else if (_hitbox == spr_RosyCutHitbox_Vertical)
	{
		var _offsetx = 0;
		var _offsety = argument2 * _offsetmax;
	}
	
	var _newhitbox = instance_create_layer(x + _offsetx, y + _offsety, layer, obj_RosyCutHitbox);
	_newhitbox.sprite_index = _hitbox;

	if (_newhitbox == spr_RosyCutHitbox_Horizontal)
	{
		_newhitbox.image_xscale = argument2;
	}
	else if (_newhitbox == spr_RosyCutHitbox_Vertical)
	{
		_newhitbox.image_yscale = argument2;
	}
	
	DrawSetText(c_black, font_Sign, fa_center, fa_center);
	draw_text_ext_transformed(obj_Player.x, obj_Player.y - 100, argument2, 0, 10000, 10, 10, 0);
	
	
	if (animation_end(_sprite))
	{
		
		PlayerState = PLAYERSTATE.NEUTRAL;
		
		//sprite_index = PlayerSpriteSet[PLAYERSPRITE_NEUTRAL.IDLE];
		
		if (instance_exists(_newhitbox))
		{
			instance_destroy(_newhitbox);
		}
	}

}