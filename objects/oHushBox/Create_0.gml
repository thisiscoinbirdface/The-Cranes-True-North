enum HUSH_STATE
{
	Entry,
	Dialogue,
	Exit
}
state = HUSH_STATE.Entry
function switch_state(_new){
	state = _new
}

depth = LAYER_DEPTH_UI

//Scribbe and text settings
typist = scribble_typist();
typist.in(1, 0);
font_size = 16 //font_get_size(global.game_settings.font)
options_max = 3	//how many options max possible for the player

//STRUCT system
//Every screen or "scene" of dialogue is contained within a struct
//All scenes are contained within an overall "scene_array"
//Structs contain (1) dialogue (2) portrait (3) name (4) options (5) links?
//The links are numbers of the next scene to go to (then go to that array index and run that scene)

    //EXAMPLE 
    //    scene_array[0] =                    THE FIRST SCENE - scene 0 
    //    new branch_struct_new(                Constructor function
    //    str("test.A"),                            polyglot string of the text
    //    str("names.paladin"),                    polyglot string of the name (or noone)
    //    noone,                                    sprite_index of portrait (or noone)
    //    [str("test.A1-B"), str("test.A2-C")],    an ARRAY of polyglot strings for each option (or noone)
    //    [1, 99])                                ARRAY - next scene number per option (99 means exit) (or noone)
    //    noone,                                    function - triggered at the start of this scene

//This is basically a complete dialogue object
//If you set options and options_link to noone, it's a regular dialogue box (just goes to next scene)
//Like this, each scene is basically nothing more than a line of dialogue + possible responses

function branch_struct_new(
        _text, _name, _portrait, _options, _options_link, _function
        )    constructor 
{
    text = _text;
    name = _name;
    portrait = _portrait;
    options = _options;
    options_link = _options_link;
    func = _function;
}
scene_array[0] = noone

scene_current = 0        //Which scene is playing right now
scene_max = 0            //Last scene
selected_option = 0      //For options, which one is currently selected
is_new_scene = true      //One frame for the entry of a new scene
options_visible = false

function switch_scene(_next){

    if (_next == 99) {
        switch_state(HUSH_STATE.Exit)
    } else {
        scene_current = _next
        is_new_scene = true
        options_visible = false
        selected_option = 0
    }
}
//Custom functions
//Use these for custom commands (quests, itemget etc) 
custom_func_array = -1
custom_vars_array = -1

entry_function = noone
exit_function = noone

//Creator - the ID of whoever created this dialogue box
creator = noone

function load_draw_vars(){
	//Get camera first
	cam_x = camera_get_view_x(view_camera[0])
	cam_y = camera_get_view_y(view_camera[0])
	
	//Textbox vars
	sprite_textbox = dialog_box
	tx_w = RES_W
	tx_h = sprite_get_height(sprite_textbox)
	tx_x_top = cam_x
	tx_y_top = cam_y + RES_H - tx_h
	hush_surf= new Canvas(tx_w, tx_h)

	//Inner text vars
	tx_inner_x_buff = 12
	tx_inner_y_buff = 8
	tx_inner_w = tx_w - (tx_inner_x_buff * 2)
	tx_inner_h = tx_h - (tx_inner_y_buff * 2)

	//Optionsbox vars
	opt_w = RES_W * 0.4
	opt_h = (font_size * options_max) + (tx_inner_y_buff * 2)
	opt_x_top = cam_x + RES_W - opt_w
	opt_y_top = cam_y + RES_H - tx_h - opt_h	
	options_surf = new Canvas(opt_w, opt_h)

}

load_draw_vars()

//TEST SCENE
scene_array = 
[
	new hush_scene("Testste geiuert ergb oiregergre ergerger", "Crane", sprite_sera,["glib", "glob", "glab"], [1, 2, 3]),
	new hush_scene("1 geiuert ergb oiregergre ergerger"),
	new hush_scene("2 geiuert ergb oiregergre ergerger"),
	new hush_scene("3 geiuert ergb oiregergre ergerger"),
]
scene_max = array_length(scene_array) - 1