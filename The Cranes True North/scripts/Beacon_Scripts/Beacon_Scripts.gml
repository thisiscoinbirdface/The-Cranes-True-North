//PubSub system
//Enums of all beacons
enum BEACON_LIST
{
	TestBeacon,
	SlamDunk,
}


//Create/clear the lists
function beacon_create(){
	global.beacon_events = ds_list_create()
}

//Process all beacons
function beacon_process(){
	
	
}

//Clear everything at the end step
function beacon_end_step(){
	ds_list_clear(global.beacon_events)	
}

function beacon_cleanup(){	
	ds_list_destroy(global.beacon_events)
}


//Light a beacon - send an update
function beacon_light(_name){
	
	ds_list_add(global.beacon_events, _name)
	
}

//Spot a beacon - listen for updates
function beacon_spot(_name, _func = noone){
	
	var _return = false
	
	var _list = global.beacon_events
	var _size = ds_list_size(_list)
	
	for (var i = 0; i < _size; i++){
		if (_list[| i] == _name){
			//Return true if the beacon has been lit
			_return = true
			
			//Run optional function
			if (_func != noone) _func()
			
			exit
		}
	}
	
	return _return
	
}
