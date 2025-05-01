extends Node

const COINS = preload("res://Idle Assets/Sound/coins.wav")
const NORMAL_SFX = preload("res://Idle Assets/Sound/normal sfx.mp3")

@export_category("Objects")
@export var streamPlayers: Array[AudioStreamPlayer]

func playAudio(clip: AudioStream, volume: float) -> void:
	var player := getFreeAudioPlayer()
	if player == null:
		return
		
	player.stream = clip
	player.volume_db = volume
	player.play()
	
func playCoins() -> void:
	playAudio(COINS, 2)
	
func PlayUi() -> void:
	playAudio(NORMAL_SFX, 0.5)
	
func getFreeAudioPlayer() -> AudioStreamPlayer:
	for audio: AudioStreamPlayer in streamPlayers:
		if not audio.playing:
			return audio
	return null
	
