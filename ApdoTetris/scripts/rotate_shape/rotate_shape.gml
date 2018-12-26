///
/// Rotates a shape 90 degrees in reference to the axis block
///
/// rotate_shape(axis_block, blocks)
/// @arg axis_block - the block in the axis position where all the other blocks will rotate on
/// @arg blocks - all the blocks in the shape
/// @arg dir - rotation direction: 1 is right, -1 is left
///

var axis_block = argument0;
var blocks = argument1;
var dir = argument2;

var x_coordinates = ds_map_create();
var y_coordinates = ds_map_create();

var horizontal_displacement = 0;
var vertical_displacement = 0;
var rotate_success = true;

for(var i = 0; i < ds_list_size(blocks); i++) {
	var block_to_rotate = ds_list_find_value(blocks, i);
	
	// calculate the (x, y) distance between the two blocks
	var x_dist = axis_block.x - block_to_rotate.x;
	var y_dist = axis_block.y - block_to_rotate.y;

	// apply the direction transform matrix to the (x, y) distance
	var x_transform = -y_dist * dir;
	var y_transform = x_dist * dir;

	// subtract the transform from the axis block position to
	// get the rotated coordinates
	var x_rotate = axis_block.x - x_transform;
	var y_rotate = axis_block.y - y_transform;
	
	// shift the block by one position left, right and up to check
	// if it is still colliding with the wall or another landed block
	if check_collision(x_rotate, y_rotate) {
		// check left
		horizontal_displacement = -block_to_rotate.sprite_width;
		if check_collision(x_rotate + horizontal_displacement, y_rotate) {
			// check right
			horizontal_displacement = block_to_rotate.sprite_width;
			if check_collision(x_rotate + horizontal_displacement, y_rotate) {
				// check above
				horizontal_displacement = 0;
				vertical_displacement = block_to_rotate.sprite_height;
				if check_collision(x_rotate, y_rotate + vertical_displacement) {
					rotate_success = false;
					break;
				}
			}
		}
	}
		
	ds_map_add(x_coordinates, block_to_rotate, x_rotate);
	ds_map_add(y_coordinates, block_to_rotate, y_rotate);
}

// check if there are any blocks still colliding with the wall or another landed block
for(var i = 0; i < ds_list_size(blocks); i++) {
	var block_to_rotate = ds_list_find_value(blocks, i);
	var new_x = ds_map_find_value(x_coordinates, block_to_rotate) + horizontal_displacement;
	var new_y = ds_map_find_value(y_coordinates, block_to_rotate) + vertical_displacement;
		
	if check_collision(new_x, new_y) {
		rotate_success = false;
		break;
	}
		
	ds_map_set(x_coordinates, block_to_rotate, new_x);
	ds_map_set(y_coordinates, block_to_rotate, new_y);
}

// finally set the new rotated and displaced coordinates to the block
if rotate_success {
	for(var i = 0; i < ds_list_size(blocks); i++) {
		var block_to_rotate = ds_list_find_value(blocks, i);
		block_to_rotate.x = ds_map_find_value(x_coordinates, block_to_rotate);
		block_to_rotate.y = ds_map_find_value(y_coordinates, block_to_rotate);
	}
}

ds_map_destroy(x_coordinates);
ds_map_destroy(y_coordinates);

// restart the land timer when rotated
alarm[LAND] = -1;