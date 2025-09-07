extends Control

var hud_info = {
	"lives": 5,
	"score": 0,
	"ammo": 30,
	"health": 100
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_info(key: String, value):
	hud_info[key] = value
	# Update the corresponding label
	match key:
		"lives":
			$LivesLabel.text = "Lives: " + str(value)
		"score":
			$ScoreLabel.text = "Score: " + str(value)
		"ammo":
			$AmmoLabel.text = "Ammo: " + str(value)
