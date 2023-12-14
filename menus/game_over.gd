extends Control

@export var game_stats: GameStats

@onready var score_value_label = %ScoreValueLabel
@onready var high_score_value_label = %HighScoreValueLabel

func _ready() -> void:
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	
	score_value_label.text = str(game_stats.score)
	high_score_value_label.text = str(game_stats.highscore)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0;
		get_tree().change_scene_to_file("res://menus/menu.tscn")
	elif  Input.is_action_just_pressed('ui_reset'):
		game_stats.score = 0;
		get_tree().change_scene_to_file("res://world.tscn")
		
