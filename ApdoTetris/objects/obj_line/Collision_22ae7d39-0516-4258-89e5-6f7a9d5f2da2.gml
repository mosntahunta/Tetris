if other.landed {
	if ds_list_find_index(blocks, other.id) == -1 {
		ds_list_add(blocks, other.id);
		if ds_list_size(blocks) == max_num_blocks {
			full = true;
		}
	}
}