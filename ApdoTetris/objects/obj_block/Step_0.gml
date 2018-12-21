get_input();

calc_movement();

collision();

if !landed {
	x += horizontal_speed;
	y += vertical_speed;
}