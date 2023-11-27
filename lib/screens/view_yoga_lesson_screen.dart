import 'package:flutter/material.dart';

class ViewYogaLessonScreen extends StatefulWidget {
  const ViewYogaLessonScreen({Key? key}) : super(key: key);

  @override
  State<ViewYogaLessonScreen> createState() => _ViewYogaLessonScreenState();
}

class _ViewYogaLessonScreenState extends State<ViewYogaLessonScreen> {
  bool isPlayer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
        // child: Consumer<SessionService>(
        //   builder: (context, sessionService, child) {
        //     return Stack(
        //       children: [
        //         // Positioned.fill(
        //         //   child: SizedBox(
        //         //     height: SizeConfig.blockSizeVertical * 70,
        //         //     width: SizeConfig.screenWidth,
        //         //     child: Image.network(
        //         //       sessionService.selectedSession.imageUrl.toString(),
        //         //       scale: 1.0,
        //         //       fit: BoxFit.cover,
        //         //       errorBuilder: (context, error, stackTrace) {
        //         //         print(error);
        //         //         return Image.asset(
        //         //           kLessonOne,
        //         //           scale: 1.0,
        //         //           fit: BoxFit.cover,
        //         //         );
        //         //       },
        //         //     ),
        //         //   ),
        //         // ),
        //         // Positioned(
        //         //   top: SizeConfig.blockSizeVertical * 1,
        //         //   left: 0,
        //         //   right: 0,
        //         //   child: Padding(
        //         //     padding: EdgeInsets.symmetric(
        //         //       vertical: kVerticalPadding,
        //         //       horizontal: kHorizontalPadding,
        //         //     ),
        //         //     child: Row(
        //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         //       children: [
        //         //         GestureDetector(
        //         //           onTap: () {
        //         //             if (isPlayer) {
        //         //               setState(() {
        //         //                 isPlayer = false;
        //         //               });
        //         //             } else {
        //         //               Navigator.pop(context);
        //         //             }
        //         //           },
        //         //           child: Icon(
        //         //             Icons.arrow_back_ios,
        //         //             color: kLightSecondaryColor,
        //         //           ),
        //         //         ),
        //         //         Container(
        //         //           padding: const EdgeInsets.all(10),
        //         //           decoration: BoxDecoration(
        //         //             color: kLightSecondaryColor,
        //         //             borderRadius: BorderRadius.circular(100),
        //         //           ),
        //         //           child: Icon(
        //         //             Icons.close,
        //         //             color: kDarkSecondaryColor,
        //         //           ),
        //         //         ),
        //         //       ],
        //         //     ),
        //         //   ),
        //         // ),
        //         // isPlayer
        //         //     ? Positioned(
        //         //         bottom: 0,
        //         //         left: 0,
        //         //         right: 0,
        //         //         child: BottomSheet(
        //         //           backgroundColor: kLightSecondaryColor,
        //         //           onClosing: () {},
        //         //           builder: (context) => Container(
        //         //             decoration: BoxDecoration(
        //         //               color: kLightSecondaryColor,
        //         //               borderRadius: const BorderRadius.only(
        //         //                 topLeft: Radius.circular(30),
        //         //                 topRight: Radius.circular(30),
        //         //               ),
        //         //             ),
        //         //             child: Column(
        //         //               mainAxisSize: MainAxisSize.min,
        //         //               children: [
        //         //                 Row(
        //         //                   mainAxisAlignment: MainAxisAlignment.center,
        //         //                   children: [
        //         //                     Icon(
        //         //                       Icons.skip_previous,
        //         //                       color: kDarkSecondaryColor,
        //         //                       size: 30,
        //         //                     ),
        //         //                     const SizedBox(width: 10),
        //         //                     Icon(
        //         //                       Icons.play_circle,
        //         //                       color: kPrimaryColor,
        //         //                       size: 60,
        //         //                     ),
        //         //                     const SizedBox(width: 10),
        //         //                     Icon(
        //         //                       Icons.skip_next,
        //         //                       color: kDarkSecondaryColor,
        //         //                       size: 30,
        //         //                     ),
        //         //                   ],
        //         //                 ),
        //         //               ],
        //         //             ),
        //         //           ),
        //         //         ),
        //         //       )
        //         //     : Positioned(
        //         //         bottom: 0,
        //         //         left: 0,
        //         //         right: 0,
        //         //         child: BottomSheet(
        //         //           backgroundColor: kLightSecondaryColor,
        //         //           onClosing: () {},
        //         //           builder: (context) => Container(
        //         //             decoration: BoxDecoration(
        //         //               color: kLightSecondaryColor,
        //         //               borderRadius: const BorderRadius.only(
        //         //                 topLeft: Radius.circular(30),
        //         //                 topRight: Radius.circular(30),
        //         //               ),
        //         //             ),
        //         //             child: Column(
        //         //               mainAxisSize: MainAxisSize.min,
        //         //               children: [
        //         //                 Padding(
        //         //                   padding: EdgeInsets.symmetric(
        //         //                     vertical: kVerticalPadding,
        //         //                     horizontal: kHorizontalPadding,
        //         //                   ),
        //         //                   child: Row(
        //         //                     children: [
        //         //                       Expanded(
        //         //                         child: Text(
        //         //                           sessionService.selectedSession.title.toString(),
        //         //                           style: GoogleFonts.inter(
        //         //                             color: kDarkSecondaryColor,
        //         //                             fontSize: 24,
        //         //                             fontWeight: FontWeight.w700,
        //         //                           ),
        //         //                           overflow: TextOverflow.ellipsis,
        //         //                         ),
        //         //                       ),
        //         //                       Text(
        //         //                         '${sessionService.selectedSession.lessons!.length} Lessons',
        //         //                         style: GoogleFonts.inter(
        //         //                           color: kPrimaryColor,
        //         //                           fontSize: 12,
        //         //                           fontWeight: FontWeight.w400,
        //         //                         ),
        //         //                       ),
        //         //                     ],
        //         //                   ),
        //         //                 ),
        //         //                 sessionService.selectedSession.lessons!.isNotEmpty
        //         //                     ? ListView.builder(
        //         //                         shrinkWrap: true,
        //         //                         itemCount: sessionService.selectedSession.lessons!.length,
        //         //                         itemBuilder: (context, index) => GestureDetector(
        //         //                           onTap: () {
        //         //                             setState(() {
        //         //                               isPlayer = true;
        //         //                             });
        //         //                           },
        //         //                           child: ViewLessonTile(
        //         //                             title: sessionService.selectedSession.lessons![index].title.toString(),
        //         //                             description:
        //         //                                 sessionService.selectedSession.lessons![index].description.toString(),
        //         //                           ),
        //         //                         ),
        //         //                       )
        //         //                     : const Center(
        //         //                         child: Text(
        //         //                           'No lessons to display',
        //         //                         ),
        //         //                       ),
        //         //               ],
        //         //             ),
        //         //           ),
        //         //         ),
        //         //       ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
