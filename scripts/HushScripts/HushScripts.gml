//Branching Dialogue
function hush_scene(
			_text, _name = noone, _portrait = noone, _options = noone, 
			_options_link = noone, _function = noone
		)	constructor 
{
	text = _text;
	name = _name;
	portrait = _portrait;
	options = _options;
	options_link = _options_link;	
	func = _function;
}

function hush_create(_scene_array, _entry_func = noone, _exit_func = noone, 
									_cust_vars_arr = noone, _cust_func_arr = noone){
	
	if instance_exists(oHushBox) exit	
	
	var _dia = instance_create_layer(0, 0, "Instances", oHushBox)
	
	_dia.scene_array = _scene_array
	_dia.scene_max = array_length(_scene_array) - 1
	_dia.custom_vars_array = _cust_vars_arr
	_dia.custom_func_array = _cust_func_arr
	_dia.entry_function = _entry_func
	_dia.exit_function = _exit_func
	_dia.creator = id
}


