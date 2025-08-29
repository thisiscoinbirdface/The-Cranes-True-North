//SCRIPTS
function warden_var(_var, _str = noone){
	
	if _str = noone _str = ""
	
	//Adjust certain variables
	if (_var == noone)_var = "noone"
	
	oWarden.debug_var_to_array(_var, _str)
	
}

function warden_inst(_obj, _key = "N", _x = 0, _y = 0){
	
	oWarden.debug_inst_to_array(_obj, _key, _x, _y)
	
}




