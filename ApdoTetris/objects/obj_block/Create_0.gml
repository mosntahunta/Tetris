vertical_speed = 0;
horizontal_speed = 0;

landed = false;

// collision
enum collision_state 
{
	NONE,
	HORIZONTAL,
	VERTICAL
}

collision_type = collision_state.NONE;