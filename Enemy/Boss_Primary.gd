extends Node2D

var Bullet = load("res://Enemy/boss_bullet.tscn")
var Effects = null
var Boss = get_node_or_null("/root/Game/Boss")
var rot = 0



func _on_timer_timeout():
	var Player = get_node_or_null("/root/Game/Player_Container/Player")
	var Effects = get_node_or_null("/root/Game/Effects")
	if Player != null and Effects != null:
			var bullet = Bullet.instantiate()
			var d = global_position.angle_to_point(Player.global_position) + PI/2
			bullet.rotation = d
			bullet.global_position = global_position + Vector2(20000,50).rotated(d)
			Effects.add_child(bullet)
	
	
	
	
	
	#Effects = get_node_or_null("/root/Game/Effects")
	#if Effects != null:
	#	var bullet = Bullet.instance()
	#	bullet.rotation = rot + PI/2
	#	bullet.global_position = global_position + Vector2(2000,0).rotated(rot)
	#	Effects.add_child(bullet)
	#	rot += 0.1

