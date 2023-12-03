extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_button_pressed():
	get_tree().quit()


func _on_settings_button_pressed():
	$%Settings.set_visible(true)
	$%StartButton.disabled = true
	$%SettingsButton.disabled = true
	$%QuitButton.disabled = true


func _on_settings_close_button_pressed():
	$%Settings.set_visible(false)
	$%StartButton.disabled = false
	$%SettingsButton.disabled = false
	$%QuitButton.disabled = false


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/main.tscn")
