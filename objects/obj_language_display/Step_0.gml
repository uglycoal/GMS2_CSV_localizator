if (keyboard_check_pressed(vk_right)) {
	lang += 1;
	lang = clamp(lang,0,array_length(global.language_array) - 1);
	language_init(global.language_array[lang]);
}
else if (keyboard_check_pressed(vk_left)) {
	lang -= 1;
	lang = clamp(lang,0,array_length(global.language_array) - 1);
	language_init(global.language_array[lang]);
}