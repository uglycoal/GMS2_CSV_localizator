function language_init(name){
	//initializer of the actual text to use in game
	//comment show_debug_message() stuff to hide display of parsed stuff
	global.dialoguemap = ds_map_create();
	var grid = load_csv("lang\\" + name);
	if ds_exists(grid, ds_type_grid) { //prevents possible crash
		var height = ds_grid_height(grid) - 1;
		
		var i = 1; 
		repeat (height)
		{
			var str = grid[# 1, i];
			//discard numbers and . from string key
			//if it is empty, then original value was numeric without letters
			//if it is not empty, then original value held letters too and should remain a string;
			var key_temp = string_letters(grid[# 0, i]);
		
			if key_temp == "" {
				if grid[# 0, i] != "" {
					var key = real(grid[# 0, i]);
				}
			}
			else {
				var key = grid[# 0, i];	
			}
			var add_0 = "";
			var len = [];
		
		
			//count from the end to . AND only when it is just a number value
			if is_real(key) {
				var stlen = string_length(string(key));
				for (var j = 0; j < stlen; j++) {
					if (string_char_at(string(key),stlen-j) != ".") {
						len[j] = string_char_at(key,stlen-j);
					}
					else break;
				}
				//this hacky shit adds a 0 after every .n_ to be .n0, 
				//so both string and int work as searching value in dialogue() 
				if array_length(len) == stlen {
					show_debug_message("Is integer value.");
				}
				else {
					if array_length(len) < 2 add_0 = "0";
					show_debug_message("Is real. Numbers after . : " + string(array_length(len)));	
				}
			}
			else {
				show_debug_message("Is a string value.");
			}
		
			key = string(key) + add_0;	
			show_debug_message(key);
			ds_map_add(global.dialoguemap, key, str);
			i++;
		}
	}
	else show_message("Failed to load .csv file.");
}