//set up typist
typist = scribble_typist();
typist.in(1, 0);


function _scene_struct(
	_text, _active_spk, _name_1, _port_1, _name_2 = noone, _port_2 = noone, 
	_entry_func = noone, _opt_arr = noone, _opt_next = noone, _opt_func = noone) 
constructor
{
	active_speaker = _active_spk;
	name_1 = _name_1;
	port_1 = _port_1;
	name_2 = _name_2;
	port_2 = _port_2;
	text = _text;
	entry_func = _entry_func;
	options_array = _opt_arr;
	options_next = _opt_next;
	options_func = _opt_func;
}

func_1 = function(){game_restart()}

scene_array = 
[
	new _scene_struct("Cities lie; rain tells the truth in taps.", 1, "Kaia", sprite_mc),
	new _scene_struct("Disperse. Return to halls.", 2, "Kaia", sprite_mc, "Megaphone"),
	new _scene_struct("Civility with a baton.", 1, "Kaia", sprite_mc),
	new _scene_struct("[slant]An injured student stumbles past, pressing a [rainbow]confiscated badge[/rainbow] into Kaia's palm.", 0, "Kaia", sprite_mc),
	new _scene_struct("Hear that? The [rainbow]towers are singing[/rainbow] off-key.", 2, "Kaia", sprite_mc, "Nix", sprite_nix),
	new _scene_struct("I hear budgets sing. Towers...that's new.", 1, "Kaia", sprite_mc, "Nix", sprite_nix),
	new _scene_struct("Peace Office is sweeping the cafes. We should move.", 2, "Kaia", sprite_mc, "Juno", sprite_sera),
	new _scene_struct("They're not my peace.", 1, "Kaia", sprite_mc, "Juno", sprite_sera),
	new _scene_struct("They think [wave]you[/wave] are their paperwork.", 2, "Kaia", sprite_mc, "Juno", sprite_sera),
	new _scene_struct("What should I do?", 1, "Kaia", sprite_mc, "Juno", sprite_sera, , 
					["Help the student into the cafe", "Watch patrol from arch", "Move now - talk inside"]),
	new _scene_struct("Three doors, one night: cafe, stacks, or roof?", 2, "Kaia", sprite_mc, "Nix", sprite_nix),
	new _scene_struct("Pick our first step.", 2, "Kaia", sprite_mc, "Juno", sprite_sera, , 
					["Go to the Canalside Cafe", "Head for the Archive Stacks", "Climb to the Rooftop Deck"], 
					[function(){game_restart()}, function(){game_restart()}, function(){game_restart()}]),
]



scene_current = 0
scene_enter = true
function scene_increment(_next_scene = noone){
	if (scene_current < (array_length(scene_array) - 1)){
		
		if (_next_scene != noone){
			scene_current = _next_scene
		} else {
			scene_current ++
		}
		scene_enter = true
	}	
}

