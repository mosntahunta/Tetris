///
/// check for collision with another block or the walls at position
///
/// check_collision(x_pos, y_pos)
/// @arg x_pos - x position to check collision with
/// @arg y_pos - y position to check collision with
///

var x_pos = argument0;
var y_pos = argument1;

// reset the collision state
horizontal_collision = false;
vertical_collision = false;

// collsion with tiles (wall or ground)
var t1 = tilemap_get_at_pixel(global.map, x_pos, y_pos );

if t1 == SOLID {
	return true;
}

// collision with another `landed` block
var inst = instance_position(x_pos, y_pos, obj_block);
if inst != noone and inst.landed {
	return true;
}

return false;