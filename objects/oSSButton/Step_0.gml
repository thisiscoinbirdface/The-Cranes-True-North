//mouse check
var _mouse_in_rect = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
var _mouse_click = mouse_check_button_pressed(mb_left)

if (_mouse_in_rect) and (_mouse_click){
	button_function()
}


