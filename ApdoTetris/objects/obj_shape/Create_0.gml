// movement
left  = 0;
right = 0;
up	  = 0;
down  = 0;
shift = 0;

// speed
vertical_speed = 0;
horizontal_speed = 0;

landed = false;
horizontal_collision = false;
vertical_collision = false;

// collision
horizontal_collision = false;
vertical_collision = false;

// drop down speed levels
drop_down_timer_level[EASY] = 0.5;
drop_down_timer_level[NORMAL] = 0.3;
drop_down_timer_level[HEROIC] = 0.2;
drop_down_timer_level[LEGENDARY] = 0.1;
drop_down_timer_level[LINSANITY] = 0.05;

// alarm timers
horizontal_move_timer = room_speed * 0.05;
vertical_move_timer = room_speed * 0.025;
rotate_timer = room_speed * 0.05;
land_timer = room_speed * 0.4;

// spawn location
init_axis_point_x = 940;
init_axis_point_y = 100;

// spawn the blocks
axis_block = instance_create_layer(init_axis_point_x, init_axis_point_y, "Block", obj_block);
blocks = ds_list_create();

ds_list_add(blocks, axis_block);

repeat(3) {
	ds_list_add(blocks, instance_create_layer(init_axis_point_x, init_axis_point_y, "Block", obj_block));
}

// speed of the blocks
horizontal_speed_initial = axis_block.sprite_width;
vertical_speed_initial = axis_block.sprite_height;

// sprite index for the block
block_sprite = 0;

// shape has spawned
spawned = false;

// tetrominoe types
enum tetrominoe 
{
	NO_SHAPE,
	L_SHAPE_LEFT,
	L_SHAPE_RIGHT,
	Z_SHAPE_LEFT,
	Z_SHAPE_RIGHT,
	LINE_SHAPE,
	T_SHAPE,
	SQUARE_SHAPE
}

tetrominoe_type = tetrominoe.NO_SHAPE;