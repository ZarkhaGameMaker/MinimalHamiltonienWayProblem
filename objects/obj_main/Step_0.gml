/// STEP ============================================================================================================

// à chaque step, tester la prochaine permutation
switch(state)
{
	case 0:
		if(next_permutation(order))
		{
			// length
			var length = 0;
			for(var i = 0; i < array_length(order)-1; i++)
			{
			    var p1 = points[order[i]];
			    var p2 = points[order[i+1]];
			    length += point_distance(p1[0], p1[1], p2[0], p2[1]);
				if(length > best_length) break;
			}
			
			// check
		    if(length < best_length)
			{
		        best_length = length;
		        best_path   = [];
				
				array_copy(best_path, 0, order, 0, points_number);
				show_debug_message(best_length);
		    }
		}
		else { state = 1; show_debug_message($"time: {current_time}"); }
	break;
	
	case 1:
	
	break;
}