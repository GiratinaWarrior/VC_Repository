/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_BossHealthBar, 0, KC_BarX, KC_BarY, (KC_Health/KC_MaxHealth) * KC_BossBarWidth, KC_BossBarHeight);
draw_sprite_stretched(spr_BossHealthBorder, 0, KC_BarX, KC_BarY, KC_BossBarWidth, KC_BossBarHeight);

DrawSetText(c_black, font_BossName, fa_center, fa_center);
draw_text(KC_BarX + KC_BossBarWidth/2, KC_BarY + KC_BossBarHeight/2, "King Chimarine");

//offset black
draw_text(KC_BarX + KC_BossBarWidth/2 + Offset, KC_BarY + KC_BossBarHeight/2 + Offset, "King Chimarine");
draw_text(KC_BarX + KC_BossBarWidth/2 + Offset, KC_BarY + KC_BossBarHeight/2 - Offset, "King Chimarine");
draw_text(KC_BarX + KC_BossBarWidth/2 - Offset, KC_BarY + KC_BossBarHeight/2 + Offset, "King Chimarine");
draw_text(KC_BarX + KC_BossBarWidth/2 - Offset, KC_BarY + KC_BossBarHeight/2 - Offset, "King Chimarine");

draw_set_color(c_blue);
draw_text(KC_BarX + KC_BossBarWidth/2, KC_BarY + KC_BossBarHeight/2, "King Chimarine");