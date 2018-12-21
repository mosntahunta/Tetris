var lines_cleared = 0;
var pos_cleared = 0; // the bottom most line that was cleared

// check for full lines and clear them
for(var i = ds_list_size(lines) - 1; i >= 0; i--) {
	var line = ds_list_find_value(lines, i);
	if line.full {
		// clear blocks
		for(var j = 0; j < ds_list_size(line.blocks); j++) {
			instance_destroy(ds_list_find_value(line.blocks, j));
		}
		
		// clear the line
		ds_list_clear(line.blocks);
		
		line.full = false;
		lines_cleared++;
		pos_cleared = i;
	}
}

// move down all the blocks above to fill the cleared lines
if lines_cleared > 0 {
	for(var i = pos_cleared + lines_cleared; i < ds_list_size(lines); i++) {
		var line = ds_list_find_value(lines, i);
		if !ds_list_empty(line.blocks) {
			for(var j = 0; j < ds_list_size(line.blocks); j++) {
				var block = ds_list_find_value(line.blocks, j);
				if block != undefined {
					with block {
						y += sprite_height * lines_cleared;
					}
				}
			}
			ds_list_clear(line.blocks);
		}
	}
}