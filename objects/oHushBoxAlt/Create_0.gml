//set up typist
typist = scribble_typist();
typist.in(1, 0);


function _scene_struct(_text, _active_spk, _name_1, _port_1, _name_2 = noone, _port_2 = noone, _entry_func = noone) 
constructor
{
	active_speaker = _active_spk;
	name_1 = _name_1;
	port_1 = _port_1;
	name_2 = _name_2;
	port_2 = _port_2;
	text = _text;
	entry_func = _entry_func;
}

func_1 = function(){game_restart()}

scene_array = 
[
	new _scene_struct("Cities lie; rain tells the truth in taps.", 1, "Kaia", sprite_mc),
	new _scene_struct("Disperse. Return to halls", 2, "Kaia", sprite_mc, "Megaphone"),
	new _scene_struct("Civility with a baton.", 1, "Kaia", sprite_mc),
	new _scene_struct("[i]Injured Student stumbles past, presses a confiscated badge into MC’s palm.", 1, "Kaia", sprite_mc),
]


scene_current = 0
scene_enter = true
function scene_increment(){
	if (scene_current < (array_length(scene_array) - 1)){
		scene_current ++
		scene_enter = true
	}	
}

