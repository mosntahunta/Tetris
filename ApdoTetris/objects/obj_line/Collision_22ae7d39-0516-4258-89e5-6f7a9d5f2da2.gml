// add block to the line if it has landed

if other.landed {
	if ds_list_find_index(blocks, other.id) == -1 {
		if index == obj_board.max_num_lines {
			obj_game.game_over = true;
		} else {
			ds_list_add(blocks, other.id);
			if ds_list_size(blocks) == max_num_blocks {
				full = true;
			}
		}
	}
}