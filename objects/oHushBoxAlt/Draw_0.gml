GMLIVE_ENABLE
depth = LAYER_DEPTH_UI

//restart
if (keyboard_check_pressed(vk_shift)) {scene_current = 0}
//inputs
var _next_pressed = keyboard_check_pressed(vk_space) | mouse_check_button_pressed(mb_left)
var _is_typing = typist.get_state() == 1 ? false : true


//dialog array
active_speaker = scene_array[scene_current].active_speaker
name_1 = scene_array[scene_current].name_1
port_1 = scene_array[scene_current].port_1
name_2 = scene_array[scene_current].name_2
port_2 = scene_array[scene_current].port_2
text = scene_array[scene_current].text
entry_function = scene_array[scene_current].entry_func
options_array = scene_array[scene_current].options_array
options_next = scene_array[scene_current].options_next
options_func = scene_array[scene_current].options_func

#region dialog and portraits
//left portrait
	var _port_1 = port_1
	var _a_1 = active_speaker == 1 ? 1 : 0.5
	var _x = 0
	var _y = RES_H - sprite_get_height(_port_1)
	draw_sprite_ext(_port_1, 0, _x, _y, 1, 1, 0, c_white, _a_1)

//left portrait
	if (port_2 != noone){
		var _port_2 = port_2
		var _a_2 = active_speaker == 2 ? 1 : 0.5
		var _x = RES_W - sprite_get_width(_port_2)
		var _y = RES_H - sprite_get_height(_port_2)
		draw_sprite_ext(_port_2, 0, _x, _y, 1, 1, 0, c_white, _a_2)
	}
	
//dialog box
	var _textbox = dialog_box
	var _x = 256
	var _y = RES_H - sprite_get_height(_textbox)
	draw_sprite(_textbox, 0, _x, _y)

//left name
	var _namebox = dialog_name
	
	var _name_1 = name_1
	var _x = 256
	var _y = RES_H - sprite_get_height(_textbox)
	draw_sprite(_namebox, 0, _x, _y)
		//name
		var _x = _x + sprite_get_width(_namebox)/2
		var _y = _y + sprite_get_height(_namebox)/2
		scribble(_name_1).starting_format("fBrause").align(fa_middle, fa_center).draw(_x, _y)
		
//right name
	if (name_2 != noone){
		var _name_2 = name_2
		var _x = RES_W - 256 - sprite_get_width(_namebox)
		var _y = RES_H - sprite_get_height(_textbox)
		draw_sprite(_namebox, 0, _x, _y)
			//name
			var _x = _x + sprite_get_width(_namebox)/2
			var _y = _y + sprite_get_height(_namebox)/2
			scribble(_name_2).starting_format("fBrause").align(fa_middle, fa_center).draw(_x, _y)
	}

///DRAW THE TEXT
	var _text = text
	var _x = 256 + 128
	var _y = RES_H - sprite_get_height(_textbox) + 128
	var _wrap_w = sprite_get_width(_textbox) - 300

	scribble(_text).starting_format("fLondon", c_black).wrap(_wrap_w).draw(_x, _y, typist)

#endregion

//inputs
var _next_pressed = keyboard_check_pressed(vk_space) | mouse_check_button_pressed(mb_left)
var _is_typing = typist.get_state() == 1 ? false : true

//Options
var _options_array = options_array
var _options_next = options_next
var _options_func = options_func

if (_options_array != noone) and !(_is_typing) and !(scene_enter){
	//draw each option
	var _l = array_length(_options_array)
	var _optionsbox = dialog_menupoint
	for (var i = 0; i < _l; i++){
		var _x = RES_W/2
		var _y = RES_H - sprite_get_height(_textbox) - 48 - i * (sprite_get_height(_optionsbox) + 16)		
		var _xbox = _x - sprite_get_width(_optionsbox)/2
		var _ybox = _y - sprite_get_height(_optionsbox)/2

		//get mouse position
		var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y, _xbox, _ybox, _xbox + sprite_get_width(_optionsbox), _ybox + sprite_get_height(_optionsbox))
		
		//draw box and option
		var _col = _mouse_in_rect ? c_white : c_grey
		draw_sprite(_optionsbox, 0, _xbox, _ybox)
		scribble(_options_array[i]).starting_format("fLondon", _col).align(fa_middle, fa_center).draw(_x, _y)
		
		if (_next_pressed) and (_mouse_in_rect){
			if (_options_func != noone) {_options_func[i]()}
			if (_options_next != noone) {scene_increment(_options_next[i])}
			else {scene_increment()}
		}
	}
}
warden_var(scene_array[scene_current].options_func)

//scene entry function (after the text is done drawing)
if (scene_enter == true) and !(_is_typing){	
	if (entry_function != noone) {entry_function()}
	scene_enter = false
}

//skip typing
if (_next_pressed) and (_is_typing) {typist.skip(true)}


//next dialog if no options
if (_next_pressed) and !(_is_typing) and (_options_array == noone) {scene_increment()}



