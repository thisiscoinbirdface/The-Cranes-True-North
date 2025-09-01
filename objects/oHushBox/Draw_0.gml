GMLIVE_ENABLE

switch state
{
	case HUSH_STATE.Entry:
		switch_state(HUSH_STATE.Dialogue)
		break;


	case HUSH_STATE.Dialogue:
	//GET ALL VARS
			cam_x = camera_get_view_x(view_camera[0])
			cam_y = camera_get_view_y(view_camera[0])
	
			//Textbox vars
			sprite_textbox = dialog_box
			tx_w = RES_W
			tx_h = sprite_get_height(sprite_textbox)
			tx_x_top = cam_x + 256
			tx_y_top = cam_y + RES_H - tx_h
			hush_surf= new Canvas(tx_w, tx_h)

			//Inner text vars
			tx_inner_x_buff = 12
			tx_inner_y_buff = 8
			tx_inner_w = tx_w - (tx_inner_x_buff * 2)
			tx_inner_h = tx_h - (tx_inner_y_buff * 2)

			//Optionsbox vars
			opt_w = RES_W * 0.4
			opt_h = (font_size * options_max) + (tx_inner_y_buff * 2)
			opt_x_top = cam_x + RES_W - opt_w
			opt_y_top = cam_y + RES_H - tx_h - opt_h	
			options_surf = new Canvas(opt_w, opt_h)
			
			//Check keyboard press
			var _next_pressed = keyboard_check_pressed(vk_space)
		
			//Get current text and options
			var _text = scene_array[scene_current].text
			var _name = scene_array[scene_current].name
			var _portrait = scene_array[scene_current].portrait
			var _options = scene_array[scene_current].options
			var _links = scene_array[scene_current].options_link
			var _func = scene_array[scene_current].func		
			var _size = array_length(_options) 
			
		//NEW SCENE FUNCTIONS
			if (is_new_scene){
				is_new_scene = false
			
				if (_func != noone) _func()
			}
	
		
		//DRAW EVERYTHING
			//Start Canvas
			hush_surf.Start()

				//Draw textbox
				draw_sprite(dialog_box, 0, 0, 0)				
	//			draw_sprite_stretched(sprite_textbox, 0, 0, 0, tx_w, tx_h)
			
				//Draw text
				scribble(_text)
				.wrap(tx_inner_w, tx_inner_h)
				.draw(tx_inner_x_buff, tx_inner_y_buff, typist);

			//Finish canvas
			hush_surf.Finish()

			//Draw canvas
			hush_surf.Draw(tx_x_top, tx_y_top)
			hush_surf.Free();


		//Draw and manipulate options
		switch options_visible
		{
			
//			(tx_w * 0.7, tx_h)
			case true:
			options_surf.Start()
			
			var _w = opt_w
			var _h = opt_h 
			
			draw_sprite_stretched(spr_hushbox_template, 0, 0, 0, _w, _h)
			
			//Draw the options 
			for (var i = 0; i < _size; i++){
				
				var _opt_curr = _options[i]
				var _col = (selected_option == i ? c_white : c_grey)
				
				scribble(_opt_curr).line_height(0,12).align(fa_right, fa_bottom)
				.blend(_col, 1).scale(1)
				.draw(_w - tx_inner_x_buff, _h - (i*12) - tx_inner_y_buff - 4);	
				
			}
			warden_var(_size)
			
			options_surf.Finish()
			options_surf.Draw(opt_x_top, opt_y_top)
			
			//Cycle selected_option
			var _input_down_pressed = keyboard_check_pressed(ord("S"))
			var _input_up_pressed = keyboard_check_pressed(ord("W"))
			
			if (_input_down_pressed) {selected_option = list_wrap(selected_option - 1, _size - 1)}
			if (_input_up_pressed) {selected_option = list_wrap(selected_option + 1, _size - 1)}
			
			//Act on selected option
			if (_next_pressed){
				
				var _next = _links[selected_option]
				
				if (_next == 99){
					switch_state(HUSH_STATE.Exit)
				} else {
					typist.reset()
					switch_scene(_links[selected_option])		
				}
			}
			warden_var(_options)
			warden_var(selected_option)
			break;

			case false:
			var _is_typing = typist.get_state() == 1 ? false : true
			
			
			
			if (_next_pressed)
			{
				if (_is_typing){
					typist.skip(true)
				} else {
					//Here check if there are any options
					if (_options != noone){
						//If there are some options, then switch options_visible
						if (options_visible == false)
						options_visible = true
					} else {
						//If there are no options, scene next OR end dialogue
						if (scene_current < scene_max){
							if (_links != noone)
								switch_scene(_links[0])
							else
								switch_scene(scene_current + 1)
						} else {						
							switch_state(HUSH_STATE.Exit)
						}
						
						typist.reset()
						options_visible = false
						selected_option = 0
					}
				}
			}
		
			if (!_is_typing) and (_options != noone){
				if (options_visible == false)
				options_visible = true	
			}
		
			break;
		}

		break;
		
	case HUSH_STATE.Exit:
		instance_destroy()
		break;
}
