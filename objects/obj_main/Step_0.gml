/// @desc

// copy array
var point_array_copy = [];
array_copy(point_array_copy, 0, point_array, 0, point_number);

// swap 2 points
var tmp                        = point_array_copy[point1_index];
point_array_copy[point1_index] = point_array_copy[point2_index];
point_array_copy[point2_index] = tmp;

// calculate distance path
var dis = path_calculate(point_array_copy);

// check
if(dis < path_distance)
{
	point_array   = point_array_copy;
	path_distance = dis;
}

// incress point_index
if(point1_index < point_number-1) { point1_index++; }
else
{
	point1_index = 0;
	
	if(point2_index < point_number-1) { point2_index++; }
	else                              { point2_index = 0; }
}