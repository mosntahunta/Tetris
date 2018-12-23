lines = ds_list_create();
max_num_lines = 23;

for(var i = max_num_lines - 1; i >= 0; i--) {
	// todo: x and y should not be hardcoded
	ds_list_add(other.lines, instance_create_layer(760, i * 40 + 80, "Line", obj_line));
}

