# GMS2 CSV Localizator
Simple set of scripts to (relatively) automate working with .csv files and hot-swapping languages.

# Before you start
This system works with .csv files and with a bit specific way of making them. 

Language files must be put in a folder in included files called `lang`, for now, at least.

First position in the first row should contain language name to be displayed in the game, second position may contain something special to use in-game for language specific calibrations (i.e. using different font).

First column contains indexes, they can be both integers, real numbers (probably no more than 2 digits after the dot) and plain text.

Second column contains text for the game, of course.

(Check included files in the source code to see examples)

# Initializing
Everything is fairly simple!

0. Create `lang` folder in your Included Files and drop .csv files in there.
1. Put obj_language_handler in your starting room.
2. Inside of obj_language_handler set default language (by specifying name of the file like - "file.csv")
3. Use `dialogue()` to get the text, by specifying it's index.

# Scripts and Use

* `language_load()` - should be called once in the start of the game.

It creates 3 global variables: language_array, language_extensions and language_names.

`global.language_array` - it contains file names, which can be used like this `language_init(global.language_array[n])`

`global.language_extentions` - it contains any user-made markings to do language specific things in game.

`global.language_names` - it contains language names which you can use to display in Settings, for example.


* `language_init( name )` - provide this script with the name of the file to load ("file.csv") and it will do it. Only call it once, for efficiency sake.

As stated above, `global.language_array` can be used to access file names in a directory.


* `dialogue( bool, index, ... )` - first argument specifies if you want to return an array (`false` returns string). Second and next arguments are indexes for the text. Full use looks like this `draw_text(32, 32, dialogue(false, "Text1"))`;

# P. S.

This is completely barebones system, so you will need to hook up a few things manually - like saving which language was selected, default this selection if files were added or deleted, etc. But I hope it can prove useful or at least interesting.

