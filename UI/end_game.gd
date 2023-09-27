extends Control


func _ready():
	$Label.text = "Game over\nThanks for playing!\nYour final score was " + str(Global.score) + "."
	if Global.score == 1400:
		$Label.text = "Game over\nThanks for playing!\nYour final score was " + str(Global.score) + ".\nHighest possible score!\nGreat job! The galaxy is safe!"

func _on_play_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_pressed():
	get_tree().quit()
