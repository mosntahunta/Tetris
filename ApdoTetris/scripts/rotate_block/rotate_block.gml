///
/// Rotates a block 90 degrees in reference to the axis block
///
/// rotate_block(axis_block, block_to_rotate)
/// @arg axis_block
/// @arg block_to_rotate

// todo: implement rotating to the left or right

var axis_block = argument0;
var block_to_rotate = argument1;

// calculate the (x, y) distance between the two blocks
var x_dist = axis_block.x - block_to_rotate.x;
var y_dist = axis_block.y - block_to_rotate.y;

// apply the [0 -1][1 0] transform matrix to the (x, y) distance
var x_transform = -y_dist;
var y_transform = x_dist;

// subtract the transform from the axis block position to
// get the rotated coordinates
var x_rotate = axis_block.x - x_transform;
var y_rotate = axis_block.y - y_transform;

block_to_rotate.x = x_rotate;
block_to_rotate.y = y_rotate;