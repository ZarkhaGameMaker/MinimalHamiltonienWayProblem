// @desc

// point
draw_set_color(c_white);
for(var i = 0; i < point_number; i++)
{
	var p = point_array[i];
	draw_circle(p.x, p.y, 8, false);
}

// circle
draw_circle(1920/2, 1080/2, 400, true);