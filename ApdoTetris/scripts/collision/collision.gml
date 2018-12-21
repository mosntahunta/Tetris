///
/// check for collision with another block or the walls and
/// determine whether or not the block has landed
///

var t1 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom + vertical_speed );
var t2 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom + vertical_speed );

if t1 == SOLID or t2 == SOLID {
	vertical_speed = 0;
	landed = true;
}

if place_meeting(x, y + vertical_speed, obj_block) {
	vertical_speed = 0;
	landed = true;
}