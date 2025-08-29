
function sfx_play(_sfx, _x = noone, _y = noone, _loopornot = false, _gain = 1){
	
	//Scale gain to SFX global
	_gain = _gain * global.game_settings.audio_sfx_vol
	
	var _dsmap_listener_data = audio_listener_get_data(0)
	var _x_listener = _dsmap_listener_data[? "x"]
	var _y_listener = _dsmap_listener_data[? "y"]
	
	var _xfinal = _x
	var _yfinal = _y
	
	// If no x, y specified, play through Listener SFX emitter. 
	// This emitter updates -> oPlayer.x and oPlayer.y
	// No added FX
	
	if (_x == noone) or (_y == noone){
		_xfinal = _x_listener
		_yfinal = _y_listener
		
		var _sound_effect = audio_play_sound_on(oAudia.emitter_listener[1], _sfx, _loopornot, 0, _gain)
	} else {
		
	// If x and y specified, play audio at location	
		var _sound_effect = audio_play_sound_at(_sfx, _xfinal, _yfinal, 0, 16, 160, 1, _loopornot, 0, _gain)	
	}

	ds_map_destroy(_dsmap_listener_data)
	
	return _sound_effect
	
}

function sfx_stop(_sfx){
	
	if (_sfx != noone) and (audio_is_playing(_sfx))
	audio_stop_sound(_sfx)
}

function sfx_play_timer(_sfx, _timername, _timermin, _timermax = 0, _x = noone, _y = noone, _gain = 1, _sfx2 = noone, _sfx3 = noone, _sfx4 = noone){
	//Create the variable
	if !variable_instance_exists(self.id, _timername)
	variable_instance_set(self.id, _timername, _timermin)
	
	var _curr = variable_instance_get(self.id,_timername)
	var _timernew = _timermin
	
	if _timermax > 0 
	_timernew = irandom_range(_timermin, _timermax)
	
	var _sfx_final = _sfx
	if (_sfx2 != noone) _sfx_final = choose(_sfx, _sfx2)
	if (_sfx3 != noone) _sfx_final = choose(_sfx, _sfx2, _sfx3)	
	if (_sfx4 != noone) _sfx_final = choose(_sfx, _sfx2, _sfx3, _sfx4)	
	
	if (_curr > 0){
		variable_instance_set(self.id, _timername, (_curr - 1))
	} else {
		variable_instance_set(self.id, _timername, _timernew)
		sfx_play(_sfx_final, _x, _y, false, _gain)
	}
}

//Unused since sfx_play can handle
function sfx_play_emitter(_sfx, _emitter, _loopornot = false, _gain = 1){

	audio_play_sound_on(_emitter, _sfx, _loops, 0, _gain)
	
}

function msc_play(_msc, _loopornot = true, _gain = 0.5){
	with oAudia
	msc_asset_next = _msc
}

function msc_fade_out(_frames = 300){
	
	var _time = (_frames / 60) * 1000
	
	with oAudia
	{
		if audio_is_playing(msc_playing_current)
		audio_sound_gain(msc_playing_current, 0, _time)
	}
}

function msc_switch_fade(_msc) {
	
}



