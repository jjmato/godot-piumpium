extends Node2D

@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent as ScaleComponent
@onready var flash_component = $FlashComponent as FlashComponent
@onready var hitbox_component = $HitboxComponent as HitboxComponent

func  _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	scale_component.tween_scale()
	flash_component.flash()
	
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
