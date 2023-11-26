import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepyoga/constants.dart';

class DashboardSessionTile extends StatelessWidget {
  const DashboardSessionTile({super.key});

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
                      child: Image.asset(
                        kUpperBodyImage,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yoga Pilates',
                          style: GoogleFonts.inter(
                            color: kDarkSecondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '5 lessons',
                          style: GoogleFonts.roboto(
                            color: kDarkAccentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'By Sarah William',
                              style: GoogleFonts.dmSans(
                                color: kDarkAccentColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
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
                            Text(
                              'All Level',
                              style: GoogleFonts.dmSans(
                                color: kDarkAccentColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
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
