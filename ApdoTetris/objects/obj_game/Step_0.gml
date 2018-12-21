var lines_cleared = 0;
var pos_cleared = 0;

for(var i = ds_list_size(lines) - 1 ; i >= 0; i--) {
	var line = ds_list_find_value(lines, i);
	if line.full {
		// clear blocks
		for(var j = 0; j < ds_list_size(line.blocks); j++) {
			instance_destroy(ds_list_find_value(line.blocks, j));
		}
		
		ds_list_clear(line.blocks);
		
		line.full = false;
		lines_cleared++;
		pos_cleared = i;
	}
}

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


// count number of lines
// todo for debugging purposes, place it in a script
//var number_of_lines = 0;

//for(var j = 0; j < ds_list_size(lines); j++) {
//	var line = ds_list_find_value(lines, j);
//	if !ds_list_empty(line.blocks) {
//		number_of_lines++
//	}
//}

//show_debug_message("number of lines");
//show_debug_message(number_of_lines);