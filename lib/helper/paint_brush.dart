import 'package:flutter/cupertino.dart';

class PainterBrush extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: [
        Color(0xff2f315c).withOpacity(1),
        Color(0xff393c69).withOpacity(1),
        Color(0xff060615).withOpacity(1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.arcToPoint(Offset(size.width * 0.85, size.height * 0.8),
        radius: Radius.circular(70), clockwise: false);
    path.lineTo(size.width * 0.15, size.height * 0.8);
    path.arcToPoint(Offset(0, size.height * 0.6),
        radius: Radius.circular(70), clockwise: true);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
