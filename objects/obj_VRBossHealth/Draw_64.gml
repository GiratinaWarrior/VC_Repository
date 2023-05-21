/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_BossHealthBar, 0, VR_BarX, VR_BarY, (VR_Health/VR_MaxHealth) * VR_BossBarWidth, VR_BossBarHeight);
draw_sprite_stretched(spr_BossHealthBorder, 0, VR_BarX, VR_BarY, VR_BossBarWidth, VR_BossBarHeight);

DrawSetText(c_black, ft_BossName, fa_center, fa_center);
draw_text(VR_BarX + VR_BossBarWidth/2, VR_BarY + VR_BossBarHeight/2, "Violet Rosery");

//offset black
draw_text(VR_BarX + VR_BossBarWidth/2 + Offset, VR_BarY + VR_BossBarHeight/2 + Offset, "Violet Rosery");
draw_text(VR_BarX + VR_BossBarWidth/2 + Offset, VR_BarY + VR_BossBarHeight/2 - Offset, "Violet Rosery");
draw_text(VR_BarX + VR_BossBarWidth/2 - Offset, VR_BarY + VR_BossBarHeight/2 + Offset, "Violet Rosery");
draw_text(VR_BarX + VR_BossBarWidth/2 - Offset, VR_BarY + VR_BossBarHeight/2 - Offset, "Violet Rosery");

draw_set_color(c_purple);
draw_text(VR_BarX + VR_BossBarWidth/2, VR_BarY + VR_BossBarHeight/2, "Violet Rosery");



