/// @desc
draw_set_color(color);
for(var i = 0; i < point_number-1; i++)
{
	var p1 = point_array[i];	
	var p2 = point_array[i+1];
	draw_line_width(p1[0], p1[1], p2[0], p2[1], 4);
}

draw_set_color(c_white);
for(var i = 0; i < point_number; i++)
{
	var point = point_array[i];
	draw_circle(point[0], point[1], 8, false);
}