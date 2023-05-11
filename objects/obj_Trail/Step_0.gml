/// @description Decrease the trails visibility
image_alpha -= FadeRate;
if (image_alpha <= 0) instance_destroy();