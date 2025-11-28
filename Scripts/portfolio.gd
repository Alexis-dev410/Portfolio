extends Node2D


func _ready():
	var dir = DirAccess.open("res://games")
	if dir:
		for file in dir.get_files():
			print(file)
		for folder in dir.get_directories():
			print("DIR:", folder)
	else:
		print("Folder not found")


func _on_parkour_play_button_pressed() -> void:
	var game_path := ProjectSettings.globalize_path("res://games/Assignment 1.exe")
	OS.shell_open(game_path)


func _on_prison_play_button_pressed() -> void:
	var game_path := ProjectSettings.globalize_path("res://games/Assignment 4.exe")
	OS.shell_open(game_path)


func _on_td_play_button_pressed() -> void:
	var game_path := ProjectSettings.globalize_path("res://games/Assignment 5.exe")
	OS.shell_open(game_path)
