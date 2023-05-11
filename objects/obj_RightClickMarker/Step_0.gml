/// @description Insert description here
// You can write your code in this editor

// if oPlayer exists and is close to the sign, do the next step
if (instance_exists(obj_NewPlayer)) && (point_in_circle(obj_NewPlayer.x,obj_NewPlayer.y,x,y,64))
{
 // image transparency is either 1 or increases by +0.05 every frame, whichever value is smaller.
 image_alpha = min(1,image_alpha+0.05)
}
// if image transparency is more than 0, oPlayer exists and oPlayer isn't close to the sign, do the next step
if (image_alpha > 0) && (instance_exists(obj_NewPlayer)) &&  (!point_in_circle(obj_NewPlayer.x,obj_NewPlayer.y,x,y,64))
{
 // image transparency reduces by 0.05 every frame
 image_alpha -= 0.05
}