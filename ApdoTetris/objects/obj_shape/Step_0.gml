// user input
get_input();
	
// rotate blocks in the shape
if tetrominoe_type != tetrominoe.SQUARE_SHAPE and tetrominoe_type != tetrominoe.NO_SHAPE {
	if up {
		rotate_shape(axis_block, blocks, 1);
	} else if shift {
		rotate_shape(axis_block, blocks, -1);
	}
}

calc_movement();
	
horizontal_collision = false;
vertical_collision = false;
	
// check for collision with each block
for(var i = 0; i < ds_list_size(blocks); i++) {
	var block = ds_list_find_value(blocks, i);
	with block {
		// apply shape speed to block speed
		block.horizontal_speed = other.horizontal_speed;
		block.vertical_speed = other.vertical_speed;
			
		collision();
			
		if block.horizontal_collision other.horizontal_collision = true;
		if block.vertical_collision other.vertical_collision = true;
	}
}
	
if horizontal_collision horizontal_speed = 0;
if vertical_collision {
	vertical_speed = 0;
	// attempt to land
	if alarm[LAND] < 0 {
		alarm[LAND] = land_timer;
	}
}

// apply the speed to the x-y values of each block periodically
for(var i = 0; i < ds_list_size(blocks); i++) {
	var block = ds_list_find_value(blocks, i);
	if down {
		if alarm[VERTICAL_MOVE] < 0 block.y += vertical_speed;
	} else {
		if alarm[DROP] < 0 block.y += vertical_speed;
	}
			
	if left or right {
		if alarm[HORIZONTAL_MOVE] < 0 {
			block.x += horizontal_speed;
			alarm[LAND] = -1;
		}
	}
}

// reset the alarm timers when expired
if alarm[DROP] < 0 alarm[DROP] = drop_down_timer;
if alarm[VERTICAL_MOVE] < 0 alarm[VERTICAL_MOVE] = vertical_move_timer;
if alarm[HORIZONTAL_MOVE] < 0 alarm[HORIZONTAL_MOVE] = horizontal_move_timer;
