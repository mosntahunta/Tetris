if alarm[DROP] < 0 {
	alarm[DROP] = drop_down_timer;
	vertical_speed = 0;
}

collision();

if !landed {
	x += horizontal_speed;
	y += vertical_speed;
}