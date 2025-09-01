GMLIVE_ENABLE
depth = LAYER_DEPTH_UI

//dia box
//options
//left portrait
//right portrait
//left name
//right name







//left portrait
	var _port_1 = sprite_dean
	var _a_1 = 1
	var _x = 0
	var _y = RES_H - sprite_get_height(_port_1)
	draw_sprite_ext(_port_1, 0, _x, _y, 1, 1, 0, c_white, _a_1)

//left portrait
	var _port_2 = sprite_lio
	var _a_2 = 0.5
	var _x = RES_W - sprite_get_width(_port_2)
	var _y = RES_H - sprite_get_height(_port_2)
	draw_sprite_ext(_port_2, 0, _x, _y, 1, 1, 0, c_white, _a_2)
	
//dialog box
	var _textbox = dialog_box
	var _x = 256
	var _y = RES_H - sprite_get_height(_textbox)
	draw_sprite(_textbox, 0, _x, _y)

//left name
	var _namebox = dialog_name
	
	var _name_1 = "Dean"
	var _x = 256
	var _y = RES_H - sprite_get_height(_textbox)
	draw_sprite(_namebox, 0, _x, _y)
		//name
		var _x = _x + sprite_get_width(_namebox)/2
		var _y = _y + sprite_get_height(_namebox)/2
		scribble(_name_1).starting_format("fBrause").align(fa_middle, fa_center).draw(_x, _y)
		
//right name
	var _name_2 = "Lio"
	var _x = RES_W - 256 - sprite_get_width(_namebox)
	var _y = RES_H - sprite_get_height(_textbox)
	draw_sprite(_namebox, 0, _x, _y)
		//name
		var _x = _x + sprite_get_width(_namebox)/2
		var _y = _y + sprite_get_height(_namebox)/2
		scribble(_name_2).starting_format("fBrause").align(fa_middle, fa_center).draw(_x, _y)


///DRAW THE TEXT
	var _text = "lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum"
	var _x = 256 + 128
	var _y = RES_H - sprite_get_height(_textbox) + 128
	var _wrap_w = sprite_get_width(_textbox) - 300

	scribble(_text).starting_format("fLondon", c_black).wrap(_wrap_w).draw(_x, _y)
	