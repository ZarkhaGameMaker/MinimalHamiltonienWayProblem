/// @desc

// Fonction pour calculer la distance total du chemin courant.
#region
function path_calculate(array)
{
	var dis = 0;
	for(var i = 0; i < point_number-2; i++)
	{
		var p1 = array[i];
		var p2 = array[i+1];
		dis   += point_distance(p1[0], p1[1], p2[0], p2[1]);
	}
	return(dis);
}
#endregion

// var
point_number        = 64;
point_array         = [];
point1_index        = 0;
point2_index        = 0;
path_distance       = -1;
new_path_finded     = false;
color               = c_aqua;
shorter_path_finded = false;

// add random point
for(var i = 0; i < point_number; i++)
{
	var len = sqrt(random(1)) * 512;
	var dir = irandom(359);
	var xx  = 1920/2 + lengthdir_x(len, dir);
	var yy  = 1080/2 + lengthdir_y(len, dir);
	array_push(point_array, [xx, yy]);
	//array_push(point_index, i);
}

// first, randomize index
point_array = array_shuffle(point_array, 0, array_length(point_array));

// calculate the path
path_distance = infinity;