if !instance_exists(shape) and alarm[SPAWN] < 0
{
	alarm[SPAWN] = spawn_timer;
}