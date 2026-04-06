extends CanvasLayer

@export var coins_label: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.coins_changed.connect(_on_coins_changed)
	coins_label.text = "0" # Set


func _on_coins_changed(amount: int) -> void:
	coins_label.text = str(amount)

func _process(delta: float) -> void:
	pass
