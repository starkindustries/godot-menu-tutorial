extends Control

var scene_to_load: String

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set keyboard focus to New Game button
	$Menu/CenterRow/Buttons/NewGame.grab_focus()	

	for button in $Menu/CenterRow/Buttons.get_children():
		button.pressed.connect(_on_Button_pressed.bind(button.scene_to_load))


func _on_Button_pressed(scene: String):
	scene_to_load = scene
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_fade_in_fade_finished():
	get_tree().change_scene_to_file(scene_to_load)
