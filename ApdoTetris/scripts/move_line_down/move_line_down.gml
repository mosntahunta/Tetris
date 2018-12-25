///
/// Moves all the blocks in a given line down by the specified block distance
///
/// move_line_down(line, distance)
/// @arg line - the line object to move down
/// @arg distance - number of blocks to move the line by

var line = argument0;
var distance = argument1;

for(var i = 0; i < ds_list_size(line.blocks); i++) {
	var block = ds_list_find_value(line.blocks, i);
	if block != undefined {
		with block {
			y += sprite_height * distance;
		}
	}
}
ds_list_clear(line.blocks);
