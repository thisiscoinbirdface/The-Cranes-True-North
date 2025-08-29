audio_falloff_set_model(audio_falloff_exponent_distance_scaled)
audio_listener_set_orientation(0, 0, 0, 1, 0, -1, 0)
audio_listener_set_position(0, 0, 0, -200)

//this is the default listener object - usually the player.
audia_listener_object = noone

start_timer = 1

amb_current = noone

msc_asset_current = noone
msc_asset_next = noone
msc_playing_current = noone

msc_fade = function(){
	audio_sound_gain(msc_playing_current, 0, 1000)
}

gain_master = 1

//Gain getsetters from the global settings
function msc_get_gain(){
	gain_master = global.game_settings.audio_msc_vol
}

function msc_set_gain(){
	
	msc_get_gain()
	
	if (msc_playing_current != noone){
		audio_sound_gain(msc_playing_current, gain_master, 0)
	}

}

