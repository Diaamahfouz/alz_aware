import 'dart:math' as math;
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HalfPieChart extends StatelessWidget {
  final double percentage;
  final double displayPercentage;
  final double size;

  const HalfPieChart({
    super.key,
    required this.percentage,
    required this.displayPercentage,
    this.size = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size / 2 + 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomPaint(
              painter: _KpiGaugePainter(percentage: percentage),
              size: Size(size, size / 2),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${displayPercentage.toInt()}%',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiGaugePainter extends CustomPainter {
  final double percentage;

  _KpiGaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final outerRadius = size.width * 0.45;
    final innerRadius = size.width * 0.35;

    const startAngle = -math.pi; // Bottom left
    const sweepAngle = math.pi; // 180 degrees (half circle)

    // Draw background ring (gray)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      startAngle,
      sweepAngle,
      true,
      Paint()
        ..color = Colors.grey[200]!
        ..style = PaintingStyle.fill,
    );

    // Draw colored segments:
    // Green first (left, 0-33%)
    // Yellow second (middle, 34-66%)
    // Red third (right, 67-100%)
    const greenEnd = 0.33;
    const yellowEnd = 0.66;

    // Green segment (left side) - first
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      startAngle,
      sweepAngle * greenEnd,
      true,
      Paint()
        ..color = AppColors.green32
        ..style = PaintingStyle.fill,
    );

    // Yellow segment (middle) - second
    final yellowStart = startAngle + sweepAngle * greenEnd;
    final yellowSweep = sweepAngle * (yellowEnd - greenEnd);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      yellowStart,
      yellowSweep,
      true,
      Paint()
        ..color = AppColors.yellowFEC
        ..style = PaintingStyle.fill,
    );

    // Red segment (right side) - third
    final redStart = startAngle + sweepAngle * yellowEnd;
    final redSweep = sweepAngle * (1.0 - yellowEnd);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      redStart,
      redSweep,
      true,
      Paint()
        ..color = AppColors.redEF
        ..style = PaintingStyle.fill,
    );

    // Draw inner circle (hole in the middle) to create ring effect
    canvas.drawCircle(center, innerRadius, Paint()..color = Colors.white);

    // Draw needle/pointer
    final normalizedPercentage = (percentage / 100).clamp(0.0, 1.0);
    final needleAngle = startAngle + sweepAngle * normalizedPercentage;
    final needleLength = outerRadius;
    final needleEndX = center.dx + needleLength * math.cos(needleAngle);
    final needleEndY = center.dy + needleLength * math.sin(needleAngle);

    // Draw needle
    final needlePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawLine(center, Offset(needleEndX, needleEndY), needlePaint);

    // Draw center dot
    canvas.drawCircle(center, 5, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
