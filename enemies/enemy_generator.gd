extends Node2D

@export var GreenEnemyScene: PackedScene

var margin = 8
var screen_widht = ProjectSettings.get_setting("display/window/size/viewport_width")

@onready var spawner_component = $SpawnerComponent as SpawnerComponent
@onready var green_spawn_timer: Timer = $GreenSpawnTimer

func _ready() -> void:
	# duplicate this for more enemy types
	# green_spawn_timer.timeout.connect(handle_spawn.bind(GreenEnemyScene, green_spawn_timer))
	green_spawn_timer.timeout.connect(func():
		handle_spawn(GreenEnemyScene, green_spawn_timer)
	)

func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	var position = Vector2(randf_range(margin, screen_widht-margin), -16)
	spawner_component.spawn(position)
	timer.start()
