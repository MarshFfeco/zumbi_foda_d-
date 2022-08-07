/// @description efeitinho
draw_self();

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_shoot_effect, 0, x, y, image_xscale * 1.2, image_yscale * 1.2, image_angle, c_blue, 1);
gpu_set_blendmode(bm_normal);