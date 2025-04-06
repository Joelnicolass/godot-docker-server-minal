extends Node3D

var is_master: bool = false
var initial_transform: Transform3D


func _enter_tree() -> void:
	set_multiplayer_authority(str(name).to_int())
	print("Player " + str(name) + " has authority: " + str(is_multiplayer_authority()))


func _ready() -> void:
	if name == "1":
		print("Player " + str(name) + " is the master")
		self.visible = false
	if is_multiplayer_authority():
		global_transform = initial_transform


func _process(_delta: float) -> void:
	if is_master:
		if Input.is_action_pressed("ui_right"):
			translate(Vector3(0.1, 0, 0))
		if Input.is_action_pressed("ui_left"):
			translate(Vector3(-0.1, 0, 0))
		if Input.is_action_pressed("ui_up"):
			translate(Vector3(0, 0, -0.1))
		if Input.is_action_pressed("ui_down"):
			translate(Vector3(0, 0, 0.1))