///@arg array?
///@arg index

//this is the heart of this system, it only accepts strings as indexes, but they can be numbers or text
//first argument is if you want function to return an array or a singular string
function dialogue() {
	var arg, _ra = argument[0];
	var d_array = [];
	if _ra == true {
		var arg;
		var d_array = [];		
		for (arg = 0; arg < argument_count-1; arg++) {
			var key = argument[arg+1];
			var result = ds_map_find_value(global.dialoguemap, string(key));
			
			//fill undefined array space with this if nothing exists with that index (key)
			if is_undefined(result) d_array[arg] = "No text with that index: " + string(key) + ", was found!";
			else d_array[arg] = result;
		}
		return d_array;
	}
	else {
		var key = string(argument[1]);
		var result = ds_map_find_value(global.dialoguemap, string(key));
		
		//return this if nothing exists with that index (key)
		if is_undefined(result) return "No text with that index: " + string(key) + ", was found!";
		else return result;
	}
}