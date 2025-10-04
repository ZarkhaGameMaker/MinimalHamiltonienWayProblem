/// @desc

// init random
random_set_seed(7837359);

// create paths
for(var i = 0; i < 2; i++) { instance_create_depth(0, 0, 0, obj_way_simpleSwap_agent); }
path_shorterDistance = infinity;
path_inst            = noone;