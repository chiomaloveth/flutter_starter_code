// import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';

abstract class AudioPlayerService {
  Future<void> playLocalAudio(String filePath);
  Future<bool> playRemoteAudio(String audioUrl);
  Future<void> stop();
  Future<void> pause();
  Future<void> resume();
  Future<void> setLoopMode(bool isLoop);
  Future<void> dispose();

  bool get isPlaying;
  PlayerState get playerState;

  Stream<Duration> get onPositionChanged;
  Stream<PlayerState> get onPlayerStateChanged;
  Stream<void> get onPlayerComplete;
}
