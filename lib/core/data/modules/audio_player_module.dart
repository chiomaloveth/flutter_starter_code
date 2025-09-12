// import 'package:audio_service/audio_service.dart';
// import 'package:audioplayers/audioplayers.dart';

import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

// import '../../services/audio_player/audio_handler.dart';
import '../../services/audio_player/audio_player_service.dart';
import '../../services/audio_player/audio_player_service_impl.dart';

@module
abstract class AudioPlayerModule {
  @singleton
  AudioPlayer audioPlayer() => AudioPlayer();

  @singleton
  AudioPlayerService audioPlayerService(AudioPlayer player) => AudioPlayerServiceImpl(player: player);

  // @preResolve
  // @singleton
  // Future<AppAudioHandler> audioHandler(AudioPlayerService playerService) => AudioService.init(
  //   builder: () => AppAudioHandler(playerService: playerService),
  //   config: const AudioServiceConfig(
  //     androidNotificationChannelId: 'com.niigma.mobile.channel.audio',
  //     androidNotificationChannelName: 'Niigma Playback',
  //     androidNotificationOngoing: true,
  //   ),
  // );
}
