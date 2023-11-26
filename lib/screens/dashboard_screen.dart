import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/screens/view_yoga_lesson_screen.dart';
import 'package:keepyoga/services/authentication_service.dart';
import 'package:keepyoga/size_config.dart';
import 'package:keepyoga/widgets/dashboard_body_type_tile.dart';
import 'package:keepyoga/widgets/dashboard_session_tile.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, String>> bodyTypes = [
    {
      'title': 'Full Body',
      'image': kFullBodyImage,
    },
    {
      'title': 'Upper Body',
      'image': kUpperBodyImage,
    },
    {
      'title': 'Lower Body',
      'image': kLowerBodyImage,
    },
    {
      'title': 'Hip',
      'image': kHipImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: kVerticalPadding,
              horizontal: kHorizontalPadding,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Good Morning',
                        style: GoogleFonts.inter(
                          color: kDarkSecondaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        kProfilePlaceholder,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Provider.of<AuthenticationService>(context, listen: false).logout(context);
                      },
                      child: Icon(
                        Icons.power_settings_new_outlined,
                        color: kDarkSecondaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bodyTypes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => DashboardBodyTypeTile(
                      title: bodyTypes[index]['title'].toString(),
                      imagePath: bodyTypes[index]['image'].toString(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.71),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Basic Yoga',
                              style: GoogleFonts.inter(
                                color: kLightSecondaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              style: GoogleFonts.inter(
                                color: kLightSecondaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 6,
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: kLightSecondaryColor,
                            size: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Top Sessions',
                      style: GoogleFonts.inter(
                        color: kDarkSecondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewYogaLessonScreen(),
                          ),
                        );
                      },
                      child: const DashboardSessionTile()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
