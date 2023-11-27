import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';

class DashboardSessionTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int noOfLessons;
  final String instructor;
  final String category;
  const DashboardSessionTile({
    super.key,
    required this.title,
    required this.noOfLessons,
    required this.instructor,
    required this.category,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: ShapeDecoration(
                color: kLightSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: kLightAccentColor,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            kLessonOne,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            color: kDarkSecondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$noOfLessons lessons',
                          style: GoogleFonts.roboto(
                            color: kDarkAccentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'By $instructor',
                                style: GoogleFonts.dmSans(
                                  color: kDarkAccentColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: ShapeDecoration(
                                color: kDarkAccentColor,
                                shape: const OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                category,
                                style: GoogleFonts.dmSans(
                                  color: kDarkAccentColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: ShapeDecoration(
                                color: kDarkAccentColor,
                                shape: const OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.star,
                              color: kAccentColor,
                              size: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '4.5',
                              style: GoogleFonts.dmSans(
                                color: kDarkAccentColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
