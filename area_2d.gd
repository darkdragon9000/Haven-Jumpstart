extends Area2D


func _on_body_entered(body):
	var level = get_tree()
	level.reload_current_scene()
