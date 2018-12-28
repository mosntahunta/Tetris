if obj_game.lines_cleared < 10 {
	return room_speed * drop_down_timer_level[EASY];
} else if obj_game.lines_cleared >= 10 and obj_game.lines_cleared < 20 {
	return room_speed * drop_down_timer_level[NORMAL];
} else if obj_game.lines_cleared >= 20 and obj_game.lines_cleared < 30 {
	return room_speed * drop_down_timer_level[HEROIC];
} else if obj_game.lines_cleared >= 30 and obj_game.lines_cleared < 40 {
	return room_speed * drop_down_timer_level[LEGENDARY];
} else {
	return room_speed * drop_down_timer_level[LINSANITY];
}