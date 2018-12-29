var gw = display_get_gui_width();
var gh = display_get_gui_height();

// high score
if lines_cleared > highscore {
	highscore = lines_cleared;
	ini_open(save_name);
	ini_write_real("Score", "Highscore", highscore);
	ini_close();
}

draw_text_ext_color(gw / 2 + global.tile_size * 5 + 20, global.tile_size, "Highscore: " + string(highscore), 5, 300, c_red, c_red, c_red, c_red, 1);

// lines cleared
draw_text_ext_color(gw / 2 + global.tile_size * 5 + 20, global.tile_size * 2, "Lines: " + string(lines_cleared), 5, 300, c_red, c_red, c_red, c_red, 1);
//draw_text_ext_color(gw - 100, 28, lines_cleared, 5, 100, c_aqua, c_aqua, c_gray, c_gray, 1);

