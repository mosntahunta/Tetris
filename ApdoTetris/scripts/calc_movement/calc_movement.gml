///< calculate movement
if !landed {
	if alarm[DROP] < 0 {
		alarm[DROP] = drop_down_timer;
		vertical_speed = 0;
	}
	
	if alarm[MOVE] < 0 {
		alarm[MOVE] = move_timer;
		horizontal_speed = 0;
		vertical_speed = 0;
	}
}