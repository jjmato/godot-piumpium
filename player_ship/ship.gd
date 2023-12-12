extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $Timer
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var move_component = $MoveComponent as MoveComponent
@onready var animated_sprite_2d = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite_2d = $Anchor/FlameAnimatedSprite2D

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	pass
	
func _process(delta) -> void:
	animate_the_ship()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_accept'): 
		fire_rate_timer.wait_time = 0.1
	if event.is_action_released('ui_accept'): 
		fire_rate_timer.wait_time = 0.4
	
func fire_lasers() -> void:
	spawner.spawn(left_cannon.global_position)
	spawner.spawn(right_cannon.global_position)
	scale_component.tween_scale()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("left")
		flame_animated_sprite_2d.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("right")
		flame_animated_sprite_2d.play("right")
	else :
		animated_sprite_2d.play("center")
		flame_animated_sprite_2d.play("center")
