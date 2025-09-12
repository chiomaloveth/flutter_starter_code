import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:nova/injectable.dart';



import 'audio_player_service.dart';
// import 'package:audioplayers/audioplayers.dart';

// @Singleton(as: AudioPlayerService)
class AudioPlayerServiceImpl extends AudioPlayerService {
  final AudioPlayer _player;

  static final Logger _logger = Logger('MindRestServiceImpl');

  AudioPlayerServiceImpl({AudioPlayer? player}) : _player = player ?? getIt();
  @override
  Future<void> dispose() async {
    await _player.stop();
  }

  @override
  Future<void> playLocalAudio(String filePath) async {
    try {
      // if (filePath.startsWith('assets/')) {
      //   filePath = filePath.replaceFirst('assets/', '');
      // }
      await _player.setAsset(filePath);
      await _player.play();
    } catch (e, t) {
      _logger.severe('playLocalAudio failed ', e, t);
    }
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> resume() async {
    await _player.play();
  }

  @override
  Future<bool> playRemoteAudio(String audioUrl) async {
    try {
      await _player.setUrl(audioUrl);
      await _player.play();
      return true;
    } catch (e, t) {
      _logger.severe('playRemoteAudio failed ', e, t);
      return false;
    }
  }

  @override
  Future<void> setLoopMode(bool isLoop) async {
    await _player.setLoopMode(isLoop ? LoopMode.one : LoopMode.all);
  }

  @override
  Stream<Duration> get onPositionChanged => _player.positionStream;

  @override
  Stream<PlayerState> get onPlayerStateChanged => _player.playerStateStream;

  @override
  Stream<void> get onPlayerComplete =>
      _player.playerStateStream.where((state) => state.processingState == ProcessingState.completed);

  @override
  bool get isPlaying => _player.playerState.playing; // == AudioPlayerState.playing;

  @override
  PlayerState get playerState => _player.playerState;
}
