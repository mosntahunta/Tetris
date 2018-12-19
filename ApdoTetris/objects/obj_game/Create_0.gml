lines = ds_list_create();
max_num_lines = 20;

for(var i = max_num_lines - 1; i >= 0; i--) {
	// todo: x and y should not be hardcoded
	ds_list_add(other.lines, instance_create_layer(650, i * 50, "Line", obj_line));
}

