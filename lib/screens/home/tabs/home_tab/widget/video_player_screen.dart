import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class CustomYouTubeStylePlayer extends StatefulWidget {
  final String videoUrl;

  const CustomYouTubeStylePlayer({super.key, required this.videoUrl});

  @override
  State<CustomYouTubeStylePlayer> createState() => _CustomYouTubeStylePlayerState();
}

class _CustomYouTubeStylePlayerState extends State<CustomYouTubeStylePlayer> {
  VideoPlayerController? _controller;
  Map<String, String> _qualities = {};
  String? _currentQualityLabel;
  double? _currentSliderValue;
  bool _showControls = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMasterPlaylist();
  }

  Future<void> _loadMasterPlaylist() async {
    try {
      final response = await http.get(Uri.parse(widget.videoUrl));
      if (response.statusCode != 200) throw Exception('Не удалось загрузить m3u8');

      final lines = response.body.split('\n');
      final Map<String, String> qualities = {};
      String? lastInf;

      for (final line in lines) {
        if (line.startsWith('#EXT-X-STREAM-INF')) {
          lastInf = line;
        } else if (line.trim().endsWith('.m3u8') && lastInf != null) {
          final resMatch = RegExp(r'RESOLUTION=(\d+x\d+)').firstMatch(lastInf);
          final bwMatch = RegExp(r'BANDWIDTH=(\d+)').firstMatch(lastInf);

          final res = resMatch?.group(1) ?? 'Unknown';
          final bw = bwMatch?.group(1) ?? '0';

          final label = '$res (${(int.parse(bw) / 1000).round()} kbps)';
          final resolvedUrl = Uri.parse(widget.videoUrl).resolve(line.trim()).toString();
          qualities[label] = resolvedUrl;
        }
      }

      if (qualities.isNotEmpty) {
        final first = qualities.entries.first;
        _qualities = qualities;
        _currentQualityLabel = first.key;
        await _initializePlayer(first.value);
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Ошибка загрузки: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _initializePlayer(String url) async {
    _controller?.dispose();
    _controller = VideoPlayerController.network(url);
    await _controller!.initialize();
    await _controller!.play();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _switchQuality(String label) async {
    final url = _qualities[label];
    if (url != null) {
      final pos = _controller!.value.position;
      _controller!.pause();
      _controller!.dispose();

      final newController = VideoPlayerController.network(url);
      await newController.initialize();
      await newController.seekTo(pos);
      await newController.play();

      if (mounted) {
        setState(() {
          _controller = newController;
          _currentQualityLabel = label;
        });
      } else {
        newController.dispose();
      }
    }
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _controller != null && _controller!.value.isInitialized
          ? GestureDetector(
        onTap: _toggleControls,
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            ),
            if (_showControls) _buildControls(),
            _buildProgressBar(),
          ],
        ),
      )
          : Center(
        child: Text(
          'Не удалось загрузить видео',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Positioned.fill(
      child: Container(
        color: Colors.black26,
        child: Stack(
          children: [
            Center(
              child: IconButton(
                iconSize: 64,
                icon: Icon(
                  _controller!.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              child: PopupMenuButton<String>(
                color: Colors.black87,
                icon: Icon(Icons.high_quality, color: Colors.white),
                onSelected: _switchQuality,
                itemBuilder: (_) => _qualities.keys
                    .map((q) => PopupMenuItem(
                  value: q,
                  child: Text(q, style: TextStyle(color: Colors.white)),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 4,
          activeTrackColor: Colors.redAccent,
          inactiveTrackColor: Colors.white30,
          thumbColor: Colors.redAccent,
          overlayColor: Colors.redAccent.withOpacity(0.2),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
        ),
        child: Slider(
          min: 0,
          max: _controller!.value.duration.inMilliseconds.toDouble(),
          value: _currentSliderValue ??
              _controller!.value.position.inMilliseconds.toDouble(),
          onChanged: (value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
          onChangeEnd: (value) {
            _controller!.seekTo(Duration(milliseconds: value.toInt()));
            _currentSliderValue = null;
          },
        ),
      ),
    );
  }
}
