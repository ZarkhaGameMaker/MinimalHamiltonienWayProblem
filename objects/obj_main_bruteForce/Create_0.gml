/// CREATE
random_set_seed(75739374);

points = [
    //[1920*0.22, 1080*0.32],
    //[1920*0.57, 1080*0.69],
    //[1920*0.39, 1080*0.80],
    //[1920*0.15, 1080*0.43],
    //[1920*0.48, 1080*0.23],
    //[1920*0.43, 1080*0.35],
    //[1920*0.58, 1080*0.43],
    //[1920*0.72, 1080*0.56],
    //[1920*0.33, 1080*0.51],
    //[1920*0.50, 1080*0.51],
];

points_number    = 7;
points           = array_shuffle(points, 0, points_number);
order            = []; for(var i = 0; i < points_number; i++) { order[i] = i; }
best_length      = infinity;
best_path        = [];
done             = false;
state            = 0;
elagage_index    = false;
elagage_value    = false;
elagage          = false;

for(var i = 0; i < points_number; i++)
{
	array_push(points, [1920/2 - 1500/2 + 1500*(random(0.5)+0.25), 1080/2 - 1500/2 + 1500*(random(0.5)+0.25)])
}

/// ============================================================================================================
function next_permutation(arr)
{
	if(elagage)
	{
		elagage = false;
		
		for(var i = elagage_index; i > 0; i--)
		{
			order[i]++;
		}
		
		//// get index already exist | [3,1,x,x,x] -> [0 = undefined, 1 = true, 2 = undefined, 3 = true, 4 = undefined]
		//indexExist[points_number-1] = undefined;
		//for(var i = 0; i < elagage_index; i++) { indexExist[order[i]] = true; }
		//	
		//// [3,-1-,2,4,0] -> [3,-2-,2,4,0]
		//order[elagage_index]++;
		//	
		//if(order[elagage_index] == points_number)
		//{
		//	
		//}
		//	
		//show_debug_message(elagage_index);
		//	
		//// erase and rebuild next permut | [3,2,x,x,x] -> [3,2,0,1,4]
		//for(var i = elagage_index+1; i < points_number; i++)
		//{
		//	for(var j = 0; j < points_number; j++)
		//	{
		//		if(indexExist[j]) { continue; }
		//		order[i]      = j;
		//		indexExist[j] = true;
		//		break;
		//	}
		//}
		//show_debug_message("---");
		//
		//show_debug_message($"array: {order}");
		//return true;
	}
	else
	{
	    // 1. Trouver le plus grand k tel que (arr[k] < arr[k+1])
	    var k = -1;
	    for(var i=points_number-2; i>=0; i--)
		{
	        if (arr[i] < arr[i+1]) { k = i; break; }
	    }
	    if(k == -1) return false; // plus de permutations
    
	    // 2. Trouver le plus grand l tel que (arr[k] < arr[l])
	    var l = -1;
	    for(var j=points_number-1; j>k; j--)
		{
	        if(arr[k] < arr[j]) { l = j; break; }
	    }
    
	    // 3. Swap arr[k], arr[l]
	    var tmp = arr[k];
	    arr[k] = arr[l];
	    arr[l] = tmp;
    
	    // 4. Inverser la séquence après k
	    var _start = k+1;
	    var _end   = points_number-1;
	    while(_start < _end)
		{
	        tmp = arr[_start];
	        arr[_start] = arr[_end];
	        arr[_end] = tmp;
	        _start++;
	        _end--;
	    }
	
		show_debug_message($"k: {k} / l: {l} / array: {arr}");
	}
	
	return true;
}