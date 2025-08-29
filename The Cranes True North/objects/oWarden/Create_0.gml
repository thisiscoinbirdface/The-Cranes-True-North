gui_w = display_get_gui_width()
gui_h = display_get_gui_height()

enabled = true


debug_var_array = []
debug_text_array = []
debug_buttons_array = 
[
	"G to restart game",
	"R to restart room",
	"V to toggle audio"
]

stats_var_array = [fps_real, round(current_time/1000)]
stats_text_array = ["fps", "seconds"]
stats_get_timer_max = 10
stats_get_timer = stats_get_timer_max

instance_create_array_id = []
instance_create_array_key = []
instance_create_array_x = []
instance_create_array_y = []

col_buttons = c_pink_rose
col_text = c_avocado_green
col_var = c_vanilla
col_stats = c_ash_gray

//Audio toggle
audio_master_vol = 1
audio_master_gain(audio_master_vol)

function enable_disable(){
	if keyboard_check_pressed(vk_tab)
	enabled = !enabled
}

function draw_buttons(){
	
	_size = array_length(debug_buttons_array)
	
	for (var i = 0; i < _size; i++){
		
		var _x = 2
		var _y = (12 * i)
		
		draw_set_color(col_buttons)
		draw_text(_x, _y, debug_buttons_array[i])
		draw_set_color(c_white)
		
	}	
	
}

function draw_mouse_xy(){
	
	var _text = string(
		string(round(mouse_x)) + ", " + string(round(mouse_y)))
	
	draw_set_color(c_baby_blue)
	draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0) - 12,_text)
	draw_set_color(c_white)
	
	
}

function debug_var_to_array(_var, _str){
	
	var _size = array_length(debug_var_array)
	debug_var_array[_size] = _var
	debug_text_array[_size] = _str
	
	
}

function draw_debug_vars(){
	
	var _stats_h = array_length(stats_var_array)
	var _size = array_length(debug_var_array)
	var _buttons_h = array_length(debug_buttons_array)
	
	for (var i = 0; i < _size; i++){
		
		var _x = 2
		var _y = 2 + (12 * _buttons_h) + (12 * _stats_h) + (12 * i) 
		
		draw_set_color(col_text)
		draw_text(_x, _y, debug_text_array[i])
		draw_set_color(c_white)
		
		var _l = string_width(debug_text_array[i])
		draw_set_color(col_var)
		draw_text(_x + _l + 8, _y, debug_var_array[i])
		draw_set_color(c_white)
		
	}
	
}

function debug_array_clear(){
	debug_var_array = []
	debug_text_array = []	
}

//Basic Stats
function get_stats(){
	if (stats_get_timer > 0){
		stats_get_timer --
	} else {
		stats_get_timer = stats_get_timer_max
		
		var _sec = round(current_time/1000) mod 60
		var _min = round(current_time/1000) div 60
		var _time = string_concat(_min, ":", _sec)
		
		stats_var_array = [round(fps_real), _time]
		stats_text_array = ["fps", "time"]	
	}
}

function draw_stats(){
	var _size = array_length(stats_var_array)
	var _buttons_h = array_length(debug_buttons_array)
	
	for (var i = 0; i < _size; i++){
		
		var _x = 2
		var _y = 2 + (_buttons_h * 12) + (12 * i)
		
		draw_set_color(col_stats)
		draw_text(_x, _y, stats_text_array[i])
		draw_set_color(c_white)
		
		var _l = string_width(stats_text_array[i])
		draw_set_color(col_stats)
		draw_text(_x + _l + 8, _y, stats_var_array[i])
		draw_set_color(c_white)
		
	}
}
	
function debug_inst_to_array(_obj, _key, _x, _y){
	
	var _size = array_length(instance_create_array_id)
	instance_create_array_id[_size] = _obj
	instance_create_array_key[_size] = _key
	instance_create_array_x[_size] = _x
	instance_create_array_y[_size] = _y
	
}

function inst_create(){
	
	var _size = array_length(instance_create_array_id)
	
	for (var i = 0; i < _size; i++){
		var _obj = instance_create_array_id[i]		
		var _key = instance_create_array_key[i]
		var _x = instance_create_array_x[i]
		var _y = instance_create_array_y[i]		
		
		
		if (keyboard_check_pressed(ord(_key)))
		instance_create_layer(_x, _y, "Instances", _obj)
	}	
}

function inst_array_clear(){
	
	instance_create_array_id = []
	instance_create_array_key = []
	instance_create_array_x = []
	instance_create_array_y = []	
	
}





