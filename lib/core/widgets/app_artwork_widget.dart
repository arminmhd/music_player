import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_player/core/cache/artwork_cache.dart';
import 'package:my_player/core/design_system/icons/app_icons.dart';
import 'package:my_player/core/design_system/radius/app_radius.dart';
import 'package:my_player/core/extension/context/theme_extension.dart';

class AppArtworkWidget extends StatefulWidget {
  final int albumId;
  final double size;
  final BorderRadius? borderRadius;
  final Widget? placeHolder;

  const AppArtworkWidget({
    super.key,
    required this.albumId,
    this.size = 56,
    this.borderRadius,
    this.placeHolder,
  });

  @override
  State<AppArtworkWidget> createState() => _AppArtworkWidgetState();
}

class _AppArtworkWidgetState extends State<AppArtworkWidget> {
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadArtwork();
  }

  @override
  void didUpdateWidget(covariant AppArtworkWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.albumId != widget.albumId) {
      _image = null;
      _loadArtwork();
    }
  }

  Future<void> _loadArtwork() async {
    final result = await ArtworkCache.get(widget.albumId);

    if (mounted) {
      setState(() {
        _image = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.w,
      height: widget.size.h,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: widget.borderRadius ?? AppRadius.radiusMd,
        image: _image != null
            ? DecorationImage(image: MemoryImage(_image!), fit: BoxFit.cover)
            : null,
      ),
      child: _image == null
          ? Center(child: widget.placeHolder ?? AppIcons.musicNote)
          : null,
    );
  }
}
