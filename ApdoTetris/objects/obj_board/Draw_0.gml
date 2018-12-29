// draw the board


draw_set_color(make_color_rgb(57, 96, 158));
draw_rectangle(xOffset, yOffset, window_width - xOffset, window_height - yOffset - global.tile_size, false);
draw_sprite_stretched(spr_background, 0, xOffset, yOffset, 
window_width - 2 * xOffset + 1, window_height - yOffset - 2 * global.tile_size + 1);

draw_set_color(c_white);
draw_set_alpha(0.2);
for (var i = 0; i < board_width; i++) {
  draw_line(xOffset + i * global.tile_size, yOffset, xOffset + i * global.tile_size, window_height - yOffset - global.tile_size);
}
for (var i = 0; i < board_height; i++) {
  draw_line(xOffset, yOffset + i * global.tile_size, window_width - xOffset, yOffset + i * global.tile_size);
}
draw_set_alpha(1);