#region IN-GAME

if (instance_exists(audia_listener_object)){

	//LISTENER
	audio_listener_set_position(0, audia_listener_object.x, audia_listener_object.y, 0)


//EMITTERS
	audio_emitter_position(emitter_listener[0], audia_listener_object.x, audia_listener_object.y, 0)
	audio_emitter_position(emitter_listener[1], audia_listener_object.x, audia_listener_object.y, 0)

}

#endregion


if (msc_asset_next != noone)
{
	audio_stop_sound(msc_playing_current)
	msc_playing_current = audio_play_sound_on(emitter_listener[0], msc_asset_next, true, true, 0)
	audio_sound_gain(msc_playing_current, gain_master, 3000)
	
	msc_asset_current = msc_asset_next
	msc_asset_next = noone
}

//Set the gain every step
msc_set_gain()


