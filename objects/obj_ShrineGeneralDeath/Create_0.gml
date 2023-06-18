/// @description Reset room audio, stop player movement

ySpeed = 0;
Gravity = 0.3;

SetRoomAudio(blanksound);

with (obj_Player)
{
	hascontrol = false;
	move = 0;
	image_xscale = sign(other.x - x);
}
