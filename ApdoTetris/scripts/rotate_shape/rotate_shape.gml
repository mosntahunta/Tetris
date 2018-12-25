///
/// Rotates a shape 90 degrees in reference to the axis block
///
/// rotate_shape(axis_block, blocks)
/// @arg axis_block - the block in the axis position where all the other blocks will rotate on
/// @arg blocks - all the blocks in the shape
/// @arg dir - rotation direction: 1 is right, -1 is left

var axis_block = argument0;
var blocks = argument1;
var dir = argument2;

for(var i = 0; i < ds_list_size(blocks); i++) {
	var block_to_rotate = ds_list_find_value(blocks, i);
	if block_to_rotate != axis_block {
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

		block_to_rotate.x = x_rotate;
		block_to_rotate.y = y_rotate;
	}
}

