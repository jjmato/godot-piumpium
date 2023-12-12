extends Node2D

@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var stats_component = $StatsComponent as StatsComponent
@onready var move_component = $MoveComponent as MoveComponent
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var flash_component = $FlashComponent as FlashComponent
@onready var shake_component = $ShakeComponent as ShakeComponent
@onready var hitbox_component = $HitboxComponent as HitboxComponent
@onready var hurtbox_component = $HurtboxComponent as HurtboxComponent
@onready var score_component = $ScoreComponent as ScoreComponent

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
	hurtbox_component.hurt.connect(func(hitbox): 
		scale_component.tween_scale()
		shake_component.tween_shake()
		flash_component.flash()
	)
	
	stats_component.no_health.connect(func():
		score_component.adjust_score()
		queue_free()	
	)
	
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
