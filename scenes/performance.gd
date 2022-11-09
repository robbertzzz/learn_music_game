extends Node3D
@onready var audio_stream:AudioStreamPlayer3D = $AudioStreamPlayer3D


# You can load a file without having to import it beforehand using the code snippet below. Keep in mind that this snippet loads the whole file into memory and may not be ideal for huge files (hundreds of megabytes or more).
func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound


#NOTE THIS DOESN't WORK in GODOT 4 cause of https://github.com/godotengine/godot/issues/61091
func load_ogg(path):
	var oggfile = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamOggVorbis.new()
	var packetSeq = OggPacketSequence.new()
	var len = oggfile.get_length()
	var data = oggfile.get_buffer(len)
	packetSeq.packet_data = data
	sound.packet_sequence = packetSeq
	sound.instantiate_playback()
	return sound


# Called when the node enters the scene tree for the first time.
func _ready():
	print(PlayerVariables.current_song)
	
	
	var currentStream:AudioStream
	if PlayerVariables.current_song == "":
		# just for quick debugging
		currentStream = load_mp3("res://Arlow - How Do You Know [NCS Release].mp3")
	else:
		currentStream = load_mp3(PlayerVariables.current_song)

	audio_stream.stream = currentStream
	audio_stream.playing = true
#	audio_stream.volume_db = -16
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
