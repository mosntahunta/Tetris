game_over = false;
lines_cleared = 0;

// highscore
save_name = "game.sav";
highscore = 0;

// open savefile
ini_open(save_name);
// read an old high score or set it to 0 if none
highscore = ini_read_real("Score", "Highscore", 0);
ini_close();