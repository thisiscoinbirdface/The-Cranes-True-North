//list_wrap()
//wraps a variable between 0 and list size (useful for UI)
function list_wrap(_newValue, _listMax){
	
	var _result = _newValue
	
	if _newValue > _listMax
	_result = 0
	
	if _newValue < 0
	_result = _listMax
	
	return _result
}

//center_x and center_y (from seedpod scripts)
function center_x(_inst = self){
	return (_inst.bbox_left + _inst.bbox_right) / 2
}

function center_y(_inst = self){
	return (_inst.bbox_top + _inst.bbox_bottom) / 2
}
