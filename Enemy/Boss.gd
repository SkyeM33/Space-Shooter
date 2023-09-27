extends CharacterBody2D

var primary = load("res://Enemy/Boss_Primary.gd")
var health =  20
var Bullet = load("res://Enemy/boss_bullet.tscn")
var Effects = null
var Boss = get_node_or_null("/root/Game/Boss")
var Explosion = load("res://Effects/explosion.tscn")

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(515, 150), 3)


func _on_timer_2_timeout():
	if position.x == 515:
		var Player = get_node_or_null("/root/Game/Player_Container/Player")
		var Effects = get_node_or_null("/root/Game/Effects")
		if Player != null and Effects != null:
			var bullet = Bullet.instantiate()
			var d = global_position.angle_to_point(Player.global_position) + PI/2
			bullet.rotation = d
			bullet.global_position = global_position + Vector2(50, -50).rotated(d)
			Effects.add_child(bullet)
			

func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instantiate()
			Effects.add_child(explosion)
			explosion.global_position = global_position
			hide()
			await explosion.animation_finished
		Global.update_score(700)
		queue_free()
		
