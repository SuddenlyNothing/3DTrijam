extends Control


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Options_pressed() -> void:
	OptionsMenu.set_active(true)
