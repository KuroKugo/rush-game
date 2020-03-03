extends CanvasLayer

signal start_game

func show_message(text):
	$GameTitle.text = text
	$GameTitle.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$GameTitle.text = "IDK"
	$GameTitle.show()
	yield(get_tree().create_timer(1), 'timeout')
	$NormalMode.show()
