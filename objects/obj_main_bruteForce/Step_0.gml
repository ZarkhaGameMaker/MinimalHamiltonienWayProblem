/// STEP ============================================================================================================

// à chaque step, tester la prochaine permutation
switch(state)
{
	case 0: // calcule
		if(next_permutation(order))
		{
			// length
			var length = 0;
			for(var i = 0; i < points_number-1; i++)
			{
			    var p1 = points[order[i]];
			    var p2 = points[order[i+1]];
			    length += point_distance(p1[0], p1[1], p2[0], p2[1]);
				if(length > best_length)
				{
					if(i < points_number-2)
					{
						//elagage_index = i+1;
						//elagage_value = order[elagage_index];
						//elagage       = true;
					}
					break;
				}
			}
			
			// check
		    if(length < best_length)
			{
		        best_length = length;
		        best_path   = [];
				
				array_copy(best_path, 0, order, 0, points_number);
				//show_debug_message(best_length);
		    }
		}
		else { state = 1; show_debug_message($"time: {current_time}"); }
	break;
		
	case 1: // end
	
	break;
}

if(keyboard_check_pressed(vk_enter)) { game_restart(); }

/*
switch(state)
{
	case 0: // calcule
		if(next_permutation(order))
		{
			// length
			var length = 0;
			for(var i = 0; i < array_length(order)-1; i++)
			{
			    var p1 = points[order[i]];
			    var p2 = points[order[i+1]];
			    length += point_distance(p1[0], p1[1], p2[0], p2[1]);
				if(length > best_length)
				{
					elagage_index = i+1;
					elagage_value = order[elagage_index];
					state = 1;
					break;
				}
			}
			
			// check
		    if(length < best_length)
			{
		        best_length = length;
		        best_path   = [];
				
				array_copy(best_path, 0, order, 0, points_number);
				//show_debug_message(best_length);
		    }
		}
		else { state = 2; show_debug_message($"time: {current_time}"); }
	break;
	
	case 1: // elagage
		if(next_permutation(order))
		{
			if(order[elagage_index] != elagage_value) { state = 0; }
		}
		else { state = 2; show_debug_message($"time: {current_time}"); }
	break;
		
	case 2: // end
	
	break;
}

if(keyboard_check_pressed(vk_enter)) { game_restart(); }