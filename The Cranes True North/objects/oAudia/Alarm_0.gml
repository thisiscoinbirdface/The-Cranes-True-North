
if (msc_asset_next != noone){
	if (!audio_is_playing(msc_asset_next)){
		
		audio_stop_sound(msc_playing_current)
		msc_playing_current = audio_play_sound_on(emitter_listener[0], msc_asset_next, true, true, 0)
		audio_sound_gain(msc_playing_current, gain_master, 3000)
	
		msc_asset_current = msc_asset_next
		msc_asset_next = noone
		
	} else {

		var _trackpos = audio_sound_get_track_position(msc_playing_current)
		var _gain = audio_sound_get_gain(msc_playing_current)
		audio_stop_sound(msc_playing_current)
		msc_playing_current = audio_play_sound_on(emitter_listener[0], msc_asset_next, true, true, _gain)
		audio_sound_set_track_position(msc_playing_current, _trackpos)		
		
		msc_asset_current = msc_asset_next
		msc_asset_next = noone			
	}
} else {
	audio_stop_sound(msc_playing_current)
}



