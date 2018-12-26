///
/// check for collision with another block or the walls and
/// determine whether or not the block has landed
///

// reset the collision state
horizontal_collision = false;
vertical_collision = false;

// collsion with tiles (wall or ground)
var t1 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom + vertical_speed );
var t2 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom + vertical_speed );

if t1 == SOLID or t2 == SOLID {
	vertical_collision = true;
}

var side;
// determine which side to test
if (horizontal_speed > 0) {
	side = bbox_right; 
} else {
	side = bbox_left;
}

var t1 = tilemap_get_at_pixel(global.map, side + horizontal_speed, bbox_bottom );
var t2 = tilemap_get_at_pixel(global.map, side + horizontal_speed, bbox_top );

if t1 == SOLID or t2 == SOLID {
	horizontal_collision = true;
}

// collision with another `landed` block
var inst = instance_place(x, y + vertical_speed, obj_block);
if inst != noone and inst.landed {
	vertical_collision = true;
}

var inst = instance_place(x + horizontal_speed, y, obj_block);
if inst != noone and inst.landed {
	horizontal_collision = true;
}