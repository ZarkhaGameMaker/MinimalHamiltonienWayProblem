/// CREATE

points = [
    [1920*0.22, 1080*0.32],
    [1920*0.57, 1080*0.69],
    [1920*0.39, 1080*0.80],
    [1920*0.15, 1080*0.43],
    [1920*0.48, 1080*0.23],
    [1920*0.43, 1080*0.35],
    [1920*0.58, 1080*0.43],
    [1920*0.72, 1080*0.56],
    [1920*0.33, 1080*0.51],
    [1920*0.50, 1080*0.51],
];

points_number = array_length(points);
points        = array_shuffle(points, 0, points_number);
order         = []; for(var i = 0; i < points_number; i++) { order[i] = i; }
best_length   = infinity;
best_path     = [];
done          = false;
state         = 0;

/// ============================================================================================================
function next_permutation(arr)
{
    var n = array_length(arr);
    
    // 1. Trouver le plus grand k tel que (arr[k] < arr[k+1])
    var k = -1;
    for(var i=n-2; i>=0; i--)
	{
        if (arr[i] < arr[i+1]) { k = i; break; }
    }
    if(k == -1) return false; // plus de permutations
    
    // 2. Trouver le plus grand l tel que (arr[k] < arr[l])
    var l = -1;
    for(var j=n-1; j>k; j--)
	{
        if(arr[k] < arr[j]) { l = j; break; }
    }
    
    // 3. Swap arr[k], arr[l]
    var tmp = arr[k];
    arr[k] = arr[l];
    arr[l] = tmp;
    
    // 4. Inverser la séquence après k
    var _start = k+1;
    var _end   = n-1;
    while(_start < _end)
	{
        tmp = arr[_start];
        arr[_start] = arr[_end];
        arr[_end] = tmp;
        _start++;
        _end--;
    }
	
	//show_debug_message(arr);
    
    return true;
}