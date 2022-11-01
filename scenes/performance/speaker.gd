extends MeshInstance3D


var sound_effect_scene: PackedScene = preload("res://scenes/performance/speaker_sound.tscn")

func _ready():
	$"../Notes".note_started.connect(on_note_started)


func on_note_started():
	var sound_effect = sound_effect_scene.instantiate()
	$SpeakerCone/Marker3D.add_child(sound_effect)
