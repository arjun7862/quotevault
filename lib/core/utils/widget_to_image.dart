import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'dart:typed_data';



Future<Uint8List> captureWidgetAsImage(GlobalKey repaintKey) async {
  final context = repaintKey.currentContext;
  if (context == null) {
    throw Exception('RepaintBoundary context is null');
  }

  final boundary =
  context.findRenderObject() as RenderRepaintBoundary;

  final ui.Image image = await boundary.toImage(pixelRatio: 3);

  final ByteData? byteData =
  await image.toByteData(format: ui.ImageByteFormat.png);

  if (byteData == null) {
    throw Exception('Failed to convert image to bytes');
  }

  return byteData.buffer.asUint8List();
}
