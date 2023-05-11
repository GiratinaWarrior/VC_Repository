/// @description Creation Code
xSpeed = 0;
ySpeed = 0;
Gravity = 0.3;
Done = 0;

image_index = 0;
image_speed = 1;
image_alpha = 1;

audio_play_sound(sound_Death, 10, false);

with (obj_Camera) follow = other.id;