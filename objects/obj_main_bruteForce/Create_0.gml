/// CREATE
random_set_seed(1);

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

points_number    = 12;
points           = array_shuffle(points, 0, points_number);
order            = []; for(var i = 0; i < points_number; i++) { order[i] = i; }
best_length      = infinity;
best_path        = [];
done             = false;
state            = 0;
elagage_index    = false;
elagage_value    = false;
elagage          = false;
best_path_finded = false;

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
		
		// on obtient un array qui informe a quel index se trouve le point_index dans l'array order. pour [2, 4, 5, 1, 0, 3] on obtient un array [4, 3, 0, 5, 1, 2]
		arrayMapping = array_create(points_number, false);
		for(var i = 0; i < points_number; i++) { arrayMapping[order[i]] = i; }

		// add | elagage_index fait parti de la gauche.
		var breakFor;
		var prev_value;
		for(var i = elagage_index; i >= 0; i--)
		{
			breakFor   = true;
			prev_value = order[i];
			
			do
			{
				order[i] = (order[i]+1) mod points_number;
				if(order[i] == 0)
				{
					if(i == 0) { return false; }
					breakFor = false;
				}
			}
			until(arrayMapping[order[i]] > elagage_index)
			
			// ici on swip les valeurs dans les arrays, et on update l'emplacement des index dans l'array.
			order[arrayMapping[order[i]]] = prev_value;
			
			// MAJ du mapping :
			var tmp                  = arrayMapping[order[i]];
			arrayMapping[order[i]]   = arrayMapping[prev_value];
			arrayMapping[prev_value] = tmp;
			
			// Break or continue
			if(breakFor) { break; }
			
			elagage_index--;
		}
		
		if(elagage_index == -1) { return false; }
		
		// On trie la partie droite du tableau.
		var left  = [];
		var right = [];
		for(var i = 0; i < points_number; i++)
		{
			if(i <= elagage_index) { array_push(left , order[i]); }
			else                   { array_push(right, order[i]); }
		}
		
		array_sort(right, true); // 0, 1, 2...
		order = array_concat(left, right);
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
	}
	
	return true;
}