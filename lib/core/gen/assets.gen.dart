// dart format width=100

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/amenities.svg
  SvgGenImage get amenities => const SvgGenImage('assets/svgs/amenities.svg');

  /// File path: assets/svgs/branch.svg
  SvgGenImage get branch => const SvgGenImage('assets/svgs/branch.svg');

  /// File path: assets/svgs/cash.svg
  SvgGenImage get cash => const SvgGenImage('assets/svgs/cash.svg');

  /// File path: assets/svgs/earth.svg
  SvgGenImage get earth => const SvgGenImage('assets/svgs/earth.svg');

  /// File path: assets/svgs/energy.svg
  SvgGenImage get energy => const SvgGenImage('assets/svgs/energy.svg');

  /// File path: assets/svgs/faqs.svg
  SvgGenImage get faqs => const SvgGenImage('assets/svgs/faqs.svg');

  /// File path: assets/svgs/hours.svg
  SvgGenImage get hours => const SvgGenImage('assets/svgs/hours.svg');

  /// File path: assets/svgs/language.svg
  SvgGenImage get language => const SvgGenImage('assets/svgs/language.svg');

  /// File path: assets/svgs/location.svg
  SvgGenImage get location => const SvgGenImage('assets/svgs/location.svg');

  /// File path: assets/svgs/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svgs/logo.svg');

  /// File path: assets/svgs/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/svgs/mail.svg');

  /// File path: assets/svgs/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/svgs/phone.svg');

  /// File path: assets/svgs/sea.svg
  SvgGenImage get sea => const SvgGenImage('assets/svgs/sea.svg');

  /// File path: assets/svgs/sky.svg
  SvgGenImage get sky => const SvgGenImage('assets/svgs/sky.svg');

  /// File path: assets/svgs/team.svg
  SvgGenImage get team => const SvgGenImage('assets/svgs/team.svg');

  /// File path: assets/svgs/ticket.svg
  SvgGenImage get ticket => const SvgGenImage('assets/svgs/ticket.svg');

  /// File path: assets/svgs/track_updates.svg
  SvgGenImage get trackUpdates => const SvgGenImage('assets/svgs/track_updates.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    amenities,
    branch,
    cash,
    earth,
    energy,
    faqs,
    hours,
    language,
    location,
    logo,
    mail,
    phone,
    sea,
    sky,
    team,
    ticket,
    trackUpdates,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
