///< get input

// keyboard input
left  = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up	  = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down  = keyboard_check(vk_down) or keyboard_check(ord("S"));

// controller input
var _dev = 4; // nintendo switch pro controller, ps4.

if (gamepad_is_connected(_dev)) {
	var _deadzone = 0.3;
	left		= gamepad_axis_value(_dev, gp_axislh) < - _deadzone or left;
	right		= gamepad_axis_value(_dev, gp_axislh) > _deadzone or right;
	up			= gamepad_axis_value(_dev, gp_axislv) < - _deadzone or up; // todo: only allow pressed, not held
	down		= gamepad_axis_value(_dev, gp_axislv) > _deadzone or down;
}