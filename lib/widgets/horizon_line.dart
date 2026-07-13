import 'package:flutter/material.dart';
import '../theme/tokens.dart';

/// The app's one signature motif: a hairline rule that fades at both ends,
/// used under quotes, section headers, and card edges.
class HorizonLine extends StatelessWidget {
  final Color color;
  final double thickness;

  const HorizonLine({super.key, required this.color, this.thickness = Horizon.thickness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: thickness,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0),
            color.withValues(alpha: Horizon.opacity),
            color.withValues(alpha: 0),
          ],
        ),
      ),
    );
  }
}
