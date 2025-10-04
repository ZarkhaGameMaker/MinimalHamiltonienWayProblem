for(var i = 0; i < instance_number(obj_way_simpleSwap_agent); i++)
{
	var path = instance_find(obj_way_simpleSwap_agent, i);
	if(path.shorter_path_finded)
	{
		if(path.path_distance < path_shorterDistance)
		{
			path_inst            = path;
			path_shorterDistance = path.path_distance;
		}
		else if(path.path_distance > path_shorterDistance)
		{
			if(instance_number(obj_way_simpleSwap_agent) > 1)
			{
				instance_destroy(path);
				instance_create_depth(0, 0, 0, obj_way_simpleSwap_agent);
			}
		}
	}
}