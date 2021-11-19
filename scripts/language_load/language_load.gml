function language_load() {
	global.language_array = [];
	global.language_extensions = [];
	global.language_names = [];
	show_debug_message(working_directory + "lang\\");
	if directory_exists(working_directory + "lang\\") {
		var file = file_find_first(working_directory + "lang\\" + "*.csv",0);
		var _csv = load_csv("lang\\" + file);
	
		//write an array of meta names for menus
		array_push(global.language_names,ds_grid_get(_csv,0,0));
		//write an array of languages that use different font
		array_push(global.language_extensions,ds_grid_get(_csv,1,0));
		//write an array of file names
		array_push(global.language_array,file);	
	
		while file != "" {
			file = file_find_next();
			if file != "" {
				show_debug_message(file);
				_csv = load_csv("lang\\" + file);
				array_push(global.language_names,ds_grid_get(_csv,0,0));
				array_push(global.language_extensions,ds_grid_get(_csv,1,0));
				array_push(global.language_array,file);
			}
		}
	}
	ds_grid_destroy(_csv);
	//destroy loaded csv 
	show_debug_message(string(global.language_names)); //display names
	show_debug_message(string(global.language_extensions)); //display extensions if any
	show_debug_message(string(global.language_array)); //display filenames
}