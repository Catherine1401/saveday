import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saveday/core/theme/app_colors.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTextStyles {
  static final textTheme = ShadTextTheme(
    h2: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      letterSpacing: -.2,
      color: AppColors.black600,
    ),
    h3: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: -.2,
      color: AppColors.black600,
    ),
    h4: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      letterSpacing: .1,
    ),
  );
}
