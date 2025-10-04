// @desc

// random
randomize();

// var
point_number  = 32;
point_array   = [];
path          = [0]; // start -> point index 0
path_distance = infinity;

// create point
for(var i = 0; i < point_number; i++)
{
	var len = sqrt(random(1)) * 400;
	var dir = irandom(359);
	var xx  = 1920/2 + lengthdir_x(len, dir);
	var yy  = 1080/2 + lengthdir_y(len, dir);
	array_push(point_array, {x: xx, y: yy, connexions: [], nextPoint: 0});
}

// calculate connexion
for(var i = 0; i < point_number; i++)
{
	var p1 = point_array[i];
	for(var j = 0; j < point_number-2; j++)
	{
		if(i == j) { continue; }
		
		var p2 = point_array[j];
		array_push(p1.connexions, [j, point_distance(p1.x, p1.y, p2.x, p2.y)]); // [point index, distance]
	}
	
	var f = function(i1, i2) { return i1[1] - i2[1]; }
	array_sort(p1.connexions, f);
}

var pointTarget = 0;
for(var i = 0; i < point_number-1; i++)
{
	var point     = point_array[pointTarget];
	var connexion = point.connexions[nextPoint];
	path[i]       = connexion[0];
}

// init shortest path
/*
var dis = 0;
for(var i = 0; i < point_number; i++)
{
	path[i] = i;
	dis    += point_distance();
}*/

// settings
draw_set_circle_precision(64);