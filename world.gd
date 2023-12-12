extends Node2D

@export var game_stats: GameStats

@onready var ship = $Ship
@onready var score_label: Label = $ScoreLabel

func _ready():
	game_stats.score_changed.connect(func(value: int): 
		score_label.text = 'Score: ' + str(value)	
	)
	
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://menus/game_over.tscn")
	)
