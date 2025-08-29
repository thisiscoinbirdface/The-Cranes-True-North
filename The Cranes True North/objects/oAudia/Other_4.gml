if (amb_current != noone) and (!audio_is_playing(amb_current))
audio_play_sound(amb_current, 0, true, 0.5)

//PLAYER EMITTER
emitter_listener[0] = audio_emitter_create()
emitter_listener[1] = audio_emitter_create()
	
emitter_listener_bus[0] = audio_bus_create();
emitter_listener_bus[1] = audio_bus_create();

for (var i = 0; i > array_length(emitter_listener); i++){
	audio_emitter_bus(emitter_listener[i], emitter_listener_bus[i]);
}

var _ef_reverb = audio_effect_create(AudioEffectType.Reverb1);
_ef_reverb.size = 0.6;
_ef_reverb.mix = 0.5;
emitter_listener_bus[0].effects[0] = _ef_reverb;

//STANDARD AUDIO SWITCH (NO FADE)
//Play sounds after 1 frame
alarm[0] = 1

//FADE AUDIO SWITCH
alarm[1] = -1

//Set music based on room
//use msc_play(...) for each room
switch room
{
	case rm_test_320x240: msc_play(msc_test) break;
	case rm_test_192x144: msc_play(msc_test) break;
}
