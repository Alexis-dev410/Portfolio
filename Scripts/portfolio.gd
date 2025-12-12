extends Node2D

func _ready() -> void:
	# List games for debugging.
	var dir := DirAccess.open("res://games")
	if dir:
		for file in dir.get_files():
			print("FILE:", file)
		for folder in dir.get_directories():
			print("DIR:", folder)
	else:
		print("Folder not found: res://games")


func launch_game(relative_path: String) -> void:
	$BackgroundMusic.stream_paused = true
	
	# Convert res:// path to an OS filesystem path in exported builds.
	var game_path := ProjectSettings.globalize_path(relative_path)
	
	print("Launching:", game_path)
	
	# Using OS.create_process is the safest way
	var result := OS.create_process(game_path, [])
	
	if result == -1:
		push_error("❌ Failed to launch: " + game_path)
	else:
		print("✔ Game launched")


func _on_parkour_play_button_pressed() -> void:
	launch_game("res://games/Assignment 1.exe")


func _on_prison_play_button_pressed() -> void:
	launch_game("res://games/Assignment 4.exe")


func _on_td_play_button_pressed() -> void:
	launch_game("res://games/Assignment 5.exe")


func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_IN:
		$BackgroundMusic.stream_paused = false
