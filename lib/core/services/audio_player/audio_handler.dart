// import 'package:audio_service/audio_service.dart';
// import 'package:audioplayers/audioplayers.dart';

// import '../../../injectable.dart';
// import 'audio_player_service.dart';

// class AppAudioHandler extends BaseAudioHandler with SeekHandler {
//   final AudioPlayerService _playerService;

//   AppAudioHandler({AudioPlayerService? playerService}) : _playerService = playerService ?? getIt() {
//     _notifyAudioHandlerAboutPlaybackEvents();
//   }

//   void _notifyAudioHandlerAboutPlaybackEvents() {
//     _playerService.onPositionChanged.listen((pos) {
//       playbackState.add(PlaybackState(playing: _playerService.isPlaying, updatePosition: pos));
//     });

//     _playerService.onPlayerStateChanged.listen((state) {
//       playbackState.add(
//         PlaybackState(
//           controls: switch (state) {
//             PlayerState.completed => [MediaControl.play],
//             PlayerState.paused => [MediaControl.play],
//             PlayerState.stopped => [MediaControl.play],
//             PlayerState.playing => [MediaControl.pause, MediaControl.stop],
//             _ => [MediaControl.play],
//           },
//           playing: _playerService.isPlaying,
//         ),
//       );
//     });

//     _playerService.onPlayerComplete.listen((_) {
//       playbackState.add(PlaybackState(controls: [MediaControl.play], playing: _playerService.isPlaying));
//     });
//   }

//   @override
//   Future<void> play() => _playerService.resume();

//   @override
//   Future<void> pause() => _playerService.pause();

//   @override
//   Future<void> stop() => _playerService.stop();

//   @override
//   Future<void> playMediaItem(MediaItem mediaItem) async {
//     await _playerService.playRemoteAudio(mediaItem.id);
//     return super.playMediaItem(mediaItem);
//   }
// }
