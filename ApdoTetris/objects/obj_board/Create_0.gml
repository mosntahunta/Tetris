global.map = layer_tilemap_get_id("Collisions");
global.tile_size = 40;

window_width = display_get_gui_width();
window_height = display_get_gui_height();

// board dimensions in tiles
board_width = 10;
board_height = 25;

// offset from the edge of the window to the playing board
xOffset = window_width / 2 - (global.tile_size / 2) * board_width;
yOffset = window_height / 2 - (global.tile_size / 2) * board_height;

// lines to detect collision with landed blocks and clear them when full
lines = ds_list_create();
max_num_lines = 23;

for(var i = max_num_lines - 1; i >= 0; i--) {
	var line = instance_create_layer(global.tile_size * 20 - global.tile_size, i * global.tile_size + 2 * global.tile_size, "Line", obj_line);
	line.index = max_num_lines - i;
	ds_list_add(lines, line);
}

