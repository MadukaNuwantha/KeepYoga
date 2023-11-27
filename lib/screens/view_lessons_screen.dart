import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/dialogs/custom_loading_dialog.dart';
import 'package:keepyoga/models/lesson.dart';
import 'package:keepyoga/services/lesson_service.dart';
import 'package:keepyoga/services/session_service.dart';
import 'package:keepyoga/size_config.dart';
import 'package:keepyoga/widgets/snack_bars.dart';
import 'package:keepyoga/widgets/view_lesson_tile.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ViewLessonsScreen extends StatefulWidget {
  const ViewLessonsScreen({super.key});

  @override
  State<ViewLessonsScreen> createState() => _ViewLessonsScreenState();
}

class _ViewLessonsScreenState extends State<ViewLessonsScreen> {
  bool isPlayerActive = false;
  bool isExpanded = false;
  bool hasPreviousLesson = false;
  bool hasNextLesson = false;
  int selectedIndex = 0;
  late VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SessionService>(
          builder: (context, sessionService, child) => Stack(
            children: [
              isPlayerActive
                  ? Positioned.fill(
                      child: SizedBox(
                        height: SizeConfig.blockSizeVertical * 70,
                        width: SizeConfig.screenWidth,
                        child: _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : Container(),
                      ),
                    )
                  : Positioned.fill(
                      child: SizedBox(
                        height: SizeConfig.blockSizeVertical * 70,
                        width: SizeConfig.screenWidth,
                        child: Image.network(
                          sessionService.selectedSession.imageUrl.toString(),
                          scale: 1.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              kLessonOne,
                              scale: 1.0,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
              Positioned(
                top: SizeConfig.blockSizeVertical * 1,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kVerticalPadding,
                    horizontal: kHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isPlayerActive) {
                            setState(() {
                              isPlayerActive = false;
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kLightSecondaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isPlayerActive) {
                            setState(() {
                              isPlayerActive = false;
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kLightSecondaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.close,
                            color: kDarkSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isPlayerActive
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          isPlayerActive
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<LessonService>(context, listen: false)
                                            .selectedLesson
                                            .title
                                            .toString(),
                                        style: GoogleFonts.inter(
                                          color: kLightSecondaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        isExpanded
                                            ? Provider.of<LessonService>(context, listen: false)
                                                .selectedLesson
                                                .description
                                                .toString()
                                            : _getTrimmedDescription(Provider.of<LessonService>(context, listen: false)
                                                .selectedLesson
                                                .description
                                                .toString()),
                                        style: GoogleFonts.inter(
                                          color: kLightSecondaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      if (Provider.of<LessonService>(context, listen: false)
                                              .selectedLesson
                                              .description
                                              .toString()
                                              .length >
                                          100) // Change 100 to your desired character limit
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          child: Text(
                                            isExpanded ? 'See less' : 'See more',
                                            style: GoogleFonts.inter(
                                              color: kLightSecondaryColor, // Change to your desired color
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          BottomSheet(
                            backgroundColor: kLightSecondaryColor,
                            onClosing: () {},
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                color: kLightSecondaryColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 40),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: VideoProgressIndicator(
                                      colors: VideoProgressColors(
                                        playedColor: kPrimaryColor,
                                        backgroundColor: kLightAccentColor,
                                      ),
                                      _controller,
                                      allowScrubbing: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          formatDuration(_controller.value.position),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lora(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          formatDuration(_controller.value.duration),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lora(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (hasPreviousLesson) {
                                            selectVideo(sessionService.selectedSession.lessons![selectedIndex - 1]);
                                          }
                                        },
                                        child: Icon(
                                          Icons.skip_previous,
                                          color: hasPreviousLesson ? kDarkSecondaryColor : kLightAccentColor,
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                        },
                                        child: Icon(
                                          _controller.value.isPlaying ? Icons.pause_circle : Icons.play_circle,
                                          color: kPrimaryColor,
                                          size: 60,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          if (hasNextLesson) {
                                            selectVideo(sessionService.selectedSession.lessons![selectedIndex + 1]);
                                          }
                                        },
                                        child: Icon(
                                          Icons.skip_next,
                                          color: hasNextLesson ? kDarkSecondaryColor : kLightAccentColor,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomSheet(
                        backgroundColor: kLightSecondaryColor,
                        onClosing: () {},
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            color: kLightSecondaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: kVerticalPadding,
                                  horizontal: kHorizontalPadding,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        sessionService.selectedSession.title.toString(),
                                        style: GoogleFonts.inter(
                                          color: kDarkSecondaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      '${sessionService.selectedSession.lessons!.length} Lessons',
                                      style: GoogleFonts.inter(
                                        color: kPrimaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              sessionService.selectedSession.lessons!.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: sessionService.selectedSession.lessons!.length,
                                      itemBuilder: (context, index) => GestureDetector(
                                        onTap: () {
                                          selectVideo(sessionService.selectedSession.lessons![index]);
                                          // showDialog(
                                          //   context: context,
                                          //   builder: (context) => const CustomLoadingDialog(title: 'Loading Video!'),
                                          // );
                                          // Provider.of<LessonService>(context, listen: false).selectedLesson =
                                          //     sessionService.selectedSession.lessons![index];
                                          // selectedIndex = sessionService.selectedSession.lessons!.indexOf(
                                          //     Provider.of<LessonService>(context, listen: false).selectedLesson);
                                          // hasPreviousLesson = selectedIndex > 0;
                                          // hasNextLesson =
                                          //     selectedIndex < sessionService.selectedSession.lessons!.length - 1;
                                          // try {
                                          //   _controller = VideoPlayerController.networkUrl(
                                          //     Uri.parse(
                                          //         sessionService.selectedSession.lessons![index].videoUrl.toString()),
                                          //   )..initialize().then((_) {
                                          //       Navigator.pop(context);
                                          //       setState(() {
                                          //         isPlayerActive = true;
                                          //         _controller.play();
                                          //       });
                                          //     }).catchError((error) {
                                          //       Navigator.pop(context);
                                          //       ScaffoldMessenger.of(context).showSnackBar(
                                          //         errorSnackBar('Cannot play the selected video!'),
                                          //       );
                                          //     });
                                          // } catch (e) {
                                          //   Navigator.pop(context);
                                          //   ScaffoldMessenger.of(context).showSnackBar(
                                          //     errorSnackBar('Cannot play the selected video!'),
                                          //   );
                                          // }
                                        },
                                        child: ViewLessonTile(
                                          title: sessionService.selectedSession.lessons![index].title.toString(),
                                          description:
                                              sessionService.selectedSession.lessons![index].description.toString(),
                                        ),
                                      ),
                                    )
                                  : const Center(
                                      child: Text(
                                        'No lessons to display',
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String _getTrimmedDescription(String description) {
    return description.length > 100 ? '${description.substring(0, 100)}...' : description;
  }

  void selectVideo(Lesson lesson) {
    showDialog(
      context: context,
      builder: (context) => const CustomLoadingDialog(title: 'Loading Video!'),
    );
    Provider.of<LessonService>(context, listen: false).selectedLesson = lesson;
    selectedIndex = Provider.of<SessionService>(context, listen: false).selectedSession.lessons!.indexOf(lesson);
    hasPreviousLesson = selectedIndex > 0;
    hasNextLesson =
        selectedIndex < Provider.of<SessionService>(context, listen: false).selectedSession.lessons!.length - 1;
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(lesson.videoUrl.toString()),
      )..initialize().then((_) {
          Navigator.pop(context);
          setState(() {
            isPlayerActive = true;
            _controller.play();
          });
        }).catchError((error) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            errorSnackBar('Cannot play the selected video!'),
          );
        });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar('Cannot play the selected video!'),
      );
    }
  }
}
