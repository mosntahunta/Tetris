if !spawned {
	var first_block = ds_list_find_value(blocks, 1);
	var second_block = ds_list_find_value(blocks, 2);
	var third_block = ds_list_find_value(blocks, 3);
	// position the rotating blocks
	switch(tetrominoe_type) {
		case tetrominoe.L_SHAPE_LEFT:
			first_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			first_block.y = axis_block.y;
			
			show_debug_message("first_block");
			show_debug_message(first_block.x);
			show_debug_message(first_block.y);
		
			second_block.x = axis_block.bbox_right + axis_block.sprite_width / 2 + 1;
			second_block.y = axis_block.y;
			
			show_debug_message("second_block");
			show_debug_message(second_block.x);
			show_debug_message(second_block.y);
			
			third_block.x = axis_block.bbox_right + axis_block.sprite_width / 2 + 1;
			third_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
			
			show_debug_message("third_block");
			show_debug_message(third_block.x);
			show_debug_message(third_block.y);
		break;
	
		case tetrominoe.L_SHAPE_RIGHT:
			first_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			first_block.y = axis_block.y;
		
			second_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			second_block.y = axis_block.y;
			
			third_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			third_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
		break;
	
		case tetrominoe.Z_SHAPE_LEFT:
			first_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			first_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
		
			second_block.x = axis_block.x;
			second_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
			
			third_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			third_block.y = axis_block.y;
		break;
	
		case tetrominoe.Z_SHAPE_RIGHT:
			first_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			first_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
		
			second_block.x = axis_block.x;
			second_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
			
			third_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			third_block.y = axis_block.y;
		break;
	
		case tetrominoe.LINE_SHAPE:
			first_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			first_block.y = axis_block.y;
		
			second_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			second_block.y = axis_block.y;
			
			third_block.x = axis_block.bbox_right + 1.5 * axis_block.sprite_width;
			third_block.y = axis_block.y;
		break;
	
		case tetrominoe.T_SHAPE:
			first_block.x = axis_block.bbox_left - axis_block.sprite_width / 2;
			first_block.y = axis_block.y;
		
			second_block.x = axis_block.x;
			second_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
			
			third_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			third_block.y = axis_block.y;
		break
	
		case tetrominoe.SQUARE_SHAPE:
			first_block.x = axis_block.x;
			first_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
		
			second_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			second_block.y = axis_block.bbox_top - axis_block.sprite_height / 2;
			
			third_block.x = axis_block.bbox_right + axis_block.sprite_width / 2;
			third_block.y = axis_block.y;
		break;
	
		case tetrominoe.NO_SHAPE:
		break;
	}
	spawned = true;	
}