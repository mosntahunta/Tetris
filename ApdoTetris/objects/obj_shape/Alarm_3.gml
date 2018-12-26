for(var i = 0; i < ds_list_size(blocks); i++) {
	var block = ds_list_find_value(blocks, i);
	block.landed = true;
}
instance_destroy();