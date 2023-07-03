/// @description Insert description here
// You can write your code in this editor

#macro WINDOW_WIDTH 1920
#macro WINDOW_HEIGHT 1080

#macro RES_W 960
#macro RES_H 540

camera = view_camera[0];
follow = obj_Player;
view_w_half = camera_get_view_width(camera) / 2;
view_h_half = camera_get_view_height(camera) / 2;

xTo = xstart;
yTo = ystart;

NoxCityForeLayer = layer_get_id("ForeCity");
NoxCityMidLayer = layer_get_id("MidCity");
NoxCityBackLayer = layer_get_id("BackCity");

MountainLayer = layer_get_id("Mountains");
MountainLayer2 = layer_get_id("Mountains2");
MountainLayer3 = layer_get_id("Mountains3");

TreeLayer = layer_get_id("Trees");
TreeLayer2 = layer_get_id("Trees2");
TreeLayer3 = layer_get_id("Trees3");

OceanSpeed = 2;
OceanLayer = layer_get_id("Ocean");
OceanLayer2 = layer_get_id("Ocean2");
OceanLayerX1 = x/1.5;
OceanLayerX2 = x/3;




