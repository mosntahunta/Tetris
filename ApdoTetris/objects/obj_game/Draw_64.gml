var gw = display_get_gui_width();
var gh = display_get_gui_height();

if game_over {
	// game over text
	fade_out_alpha += fade_speed;
	draw_set_alpha(fade_out_alpha);
	draw_rectangle_color(0, 0, gw, gh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_sprite(spr_game_over, 0, gw / 2, gh / 2);
	
	draw_set_halign(fa_center);
	draw_set_font(font_segoe);
	draw_text(gw / 2, gh / 2 - 35, "press the space key to restart...");
} else {
	// initial fade into the screen
	fade_in_alpha = lerp(fade_in_alpha, 0, fade_speed);
	draw_set_alpha(fade_in_alpha);
	draw_rectangle_color(0, 0, gw, gh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	// high score
	if lines_cleared > highscore {
		highscore = lines_cleared;
		ini_open(save_name);
		ini_write_real("Score", "Highscore", highscore);
		ini_close();
	}
	
	draw_set_font(font_cambria);
	
	draw_text_ext_color(gw / 2 + global.tile_size * 5 + 20, global.tile_size + 8, "Highscore: " + string(highscore), 5, 300, c_gray, c_gray, c_gray, c_gray, 1);

	// lines cleared
	draw_text_ext_color(gw / 2 + global.tile_size * 5 + 20, global.tile_size * 2 + 8, "Lines: " + string(lines_cleared), 5, 300, c_gray, c_gray, c_gray, c_gray, 1);
}
	
