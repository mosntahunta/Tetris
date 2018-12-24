if !landed {
	get_input();

	calc_movement();
	
	var horizontal_collision = false;
	var vertical_collision = false;
	
	// check for collision with each block
	for(var i = 0; i < ds_list_size(blocks); i++) {
		var block = ds_list_find_value(blocks, i);
		with block {
			// apply shape speed to block speed
			block.horizontal_speed = other.horizontal_speed;
			block.vertical_speed = other.vertical_speed;
			
			collision();
			
			if landed other.landed = true;
			if collision_type == collision_state.HORIZONTAL horizontal_collision = true;
			if collision_type == collision_state.VERTICAL vertical_collision = true;
		}
	}
	
	if horizontal_collision horizontal_speed = 0;
	if vertical_collision vertical_speed = 0;
	
	if landed {
		// label all the blocks as landed
		for(var i = 0; i < ds_list_size(blocks); i++) {
			var block = ds_list_find_value(blocks, i);
			block.landed = landed;
		}
		instance_destroy();
	} else {
		// apply the speed to the x-y values periodically
		for(var i = 0; i < ds_list_size(blocks); i++) {
			var block = ds_list_find_value(blocks, i);
			if down {
				if alarm[VERTICAL_MOVE] < 0 block.y += vertical_speed;
			} else {
				if alarm[DROP] < 0 block.y += vertical_speed;
			}
			
			if left or right {
				if alarm[HORIZONTAL_MOVE] < 0 block.x += horizontal_speed;
			}
		}
	}
		
	
	// reset the alarm timers when expired
	if alarm[DROP] < 0 alarm[DROP] = drop_down_timer;
	if alarm[VERTICAL_MOVE] < 0 alarm[VERTICAL_MOVE] = vertical_move_timer;
	if alarm[HORIZONTAL_MOVE] < 0 alarm[HORIZONTAL_MOVE] = horizontal_move_timer;
}