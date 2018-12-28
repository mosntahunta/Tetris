lines = ds_list_create();
max_num_lines = 23;

for(var i = max_num_lines - 1; i >= 0; i--) {
	// todo: x and y should not be hardcoded
	var line = instance_create_layer(760, i * 40 + 80, "Line", obj_line);
	line.index = max_num_lines - i;
	ds_list_add(lines, line);
}

