/// DRAW

// best path
draw_set_color(c_blue);
for(var i = 0; i < points_number-1; i++)
{
	var index = order[i];
	var p1    = points[index];
	
	var index = order[i+1];
	var p2    = points[index];
	
	draw_line_width(p1[0], p1[1], p2[0], p2[1], 4);
}
draw_set_color(c_white);

// current path
draw_set_color(c_lime);
for(var i = 0; i < points_number-1; i++)
{
	var index = best_path[i];
	var p1    = points[index];
	
	var index = best_path[i+1];
	var p2    = points[index];
	
	draw_line_width(p1[0], p1[1], p2[0], p2[1], 8);
}
draw_set_color(c_white);

// point
for(var i = 0; i < points_number; i++)
{
	var point = points[i];
	draw_circle(point[0], point[1], 8, false);
}

draw_text(10, 10, $"fps_real: {fps_real}");
draw_text(10, 20, $"fps: {fps}");