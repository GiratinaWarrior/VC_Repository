/// @description SummonPlayer();
function SummonPlayer(){
	if (!instance_exists(obj_NewPlayer))
			{
			
				var _x = global.SpawnX;
				var _y = global.SpawnY;
				
				if (argument_count > 0) _x = argument0;
				if (argument_count > 1) _y = argument1;
				
				instance_create_layer(_x, _y, layer, obj_NewPlayer);
				
				
			}
}