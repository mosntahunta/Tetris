///
/// output the number of lines with blocks
///

var number_of_lines = 0;

for(var j = 0; j < ds_list_size(lines); j++) {
	var line = ds_list_find_value(lines, j);
	if !ds_list_empty(line.blocks) {
		number_of_lines++
	}
}

return number_of_lines;