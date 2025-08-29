if (sfx == noone) exit

switch type
{
	case "timer":
		sfx_play_timer(sfx, "my_timer", timer_min, 
						timer_max, x, y, gain, sfx2, sfx3, sfx4)
		break;
	
	case "player_trigger":
		if (distance_to_object(oPlayer) < 128) 
		and (active == 0)
		{
			active = 240
			sfx_play(sfx, x, y, , gain)
		}
		
		if (active > 0) active--
		
		break;
	
	case "emitter":
		if (!audio_is_playing(sfx)){
			sfx_play(sfx, x, y, range, true)
		}
		break;
}




		