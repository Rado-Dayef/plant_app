import 'package:plants_app/constants/app_imports.dart';

class GapWidget extends StatelessWidget {
  final double gap;

  const GapWidget(this.gap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap.h,
      width: gap.w,
    );
  }
}
