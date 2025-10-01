// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
//  import '../../../../../../../presentation/resourses/app_colors.dart';
//
// class YoutubeAlert extends StatefulWidget {
//   final String url;
//   final String? isDescription;
//   final String? title;
//
//   const YoutubeAlert({super.key, required this.url,  this.isDescription, this.title});
//
//   @override
//   _YoutubeAlertState createState() => _YoutubeAlertState();
// }
//
// class _YoutubeAlertState extends State<YoutubeAlert> {
//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: "url",
//   );
//
//   bool fuulscreen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.url,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//         hideThumbnail: true,
//         hideControls: false,
//         controlsVisibleAtStart: true,
//         disableDragSeek: false,
//         loop: false,
//         enableCaption: false,
//       ),
//     );
//     _controller.addListener(() {
//       if (_controller.value.isFullScreen) {
//         setState(() {
//           fuulscreen = _controller.value.isFullScreen;
//         });
//       }
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: !fuulscreen,
//       onPopInvoked: (_) {
//         if(fuulscreen){
//           _controller.toggleFullScreenMode();
//           setState(
//                 () {
//               fuulscreen = false;
//             },
//           );
//         }
//       },
//       child: Container(
//         color: Colors.black,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: fuulscreen ? MediaQuery.of(context).size.height * 0.999 : 245,
//                   child: YoutubePlayer(
//                     controller: _controller,
//                     showVideoProgressIndicator: false,
//                     progressIndicatorColor: Colors.blueAccent,
//                     onReady: () {
//                       _controller.addListener(() {});
//                     },
//                   ),
//                 ),
//                 if (fuulscreen)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30, left: 20),
//                     child: GestureDetector(
//                       behavior: HitTestBehavior.translucent,
//                       onTap: () {
//                         _controller.toggleFullScreenMode();
//                         setState(
//                               () {
//                             fuulscreen = false;
//                           },
//                         );
//                       },
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color: AppColors.appColor.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: Center(
//                           child: Icon(
//                             Icons.arrow_back_ios_new,
//                             color: AppColors.appColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//               child: Text(
//                 widget.title ?? "",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void deactivate() {
//     _controller.dispose();
//     super.deactivate();
//   }
//
//
// }