//DRAW GUI

enable_disable()

//draw_set_font(m5x7)
	
if (!enabled){
	debug_array_clear()
	exit
}

draw_set_alpha(0.35)
draw_rectangle_color(0, 0, gui_w/2, gui_h, 
			c_black, c_black, c_black, c_black,false)
draw_set_alpha(1)

draw_buttons()
if (keyboard_check_pressed(ord("G"))) game_restart()
if (keyboard_check_pressed(ord("R"))) room_restart()
if (keyboard_check_pressed(ord("V"))) { 
	audio_master_vol = !audio_master_vol
	audio_master_gain(audio_master_vol) 	
}
draw_mouse_xy()

get_stats()
draw_stats()
draw_debug_vars()

debug_array_clear()

inst_create()
inst_array_clear()


