var lines_cleared = 0;
var pos_cleared = ds_list_create();

// check for full lines and clear them
for(var i = ds_list_size(lines) - 1; i >= 0; i--) {
	var line = ds_list_find_value(lines, i);
	if line.full {
		// clear blocks
		for(var j = 0; j < ds_list_size(line.blocks); j++) {
			instance_destroy(ds_list_find_value(line.blocks, j));
		}
		
		// clear the line list
		ds_list_clear(line.blocks);
		
		line.full = false;
		lines_cleared++;
		ds_list_add(pos_cleared, i);
	}
}

if lines_cleared > 0 {
	// first move down any uncleared lines between the bottom most cleared line 
	// and top most cleared line
	var bottom_cleared_pos = ds_list_find_value(pos_cleared, ds_list_size(pos_cleared) - 1);
	var top_cleared_pos = ds_list_find_value(pos_cleared, 0);
	var line_cleared_remain = lines_cleared;
	
	while top_cleared_pos != bottom_cleared_pos {
		var current_line = ds_list_find_value(lines, top_cleared_pos);
		if ds_list_empty(current_line.blocks) {
			line_cleared_remain--;
		} else {
			move_line_down(current_line, line_cleared_remain);
		}
		top_cleared_pos--;
	}
	
	// move down all the uncleared lines above the top most cleared line
	// by the total number of lines cleared in this step
	for(var i = ds_list_find_value(pos_cleared, 0) + 1; i < ds_list_size(lines); i++) {
		var current_line = ds_list_find_value(lines, i);
		if !ds_list_empty(current_line.blocks) {
			move_line_down(current_line, lines_cleared);
		}
	}
	
	obj_game.lines_cleared += lines_cleared;
}