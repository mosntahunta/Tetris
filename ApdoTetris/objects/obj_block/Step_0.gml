if alarm[DROP] < 0 {
	alarm[DROP] = drop_down_timer;
	vertical_speed = 0;
}

var t1 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom + vertical_speed );
var t2 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom + vertical_speed );

if t1 == SOLID or t2 == SOLID {
	vertical_speed = 0;
}

if place_meeting(x, y + vertical_speed, obj_block) {
	vertical_speed = 0;
}

x += horizontal_speed;
y += vertical_speed;