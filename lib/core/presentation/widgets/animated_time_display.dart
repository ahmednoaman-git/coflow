import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';

enum AnimatedTimeDisplayLayout {
  hoursMinutes,
  hoursMinutesSeconds,
  secondsOnly,
}

/// A digital clock-style widget that animates digit transitions whenever the
/// provided [time] changes. The widget itself does not manage time; instead,
/// the parent must provide updated [DateTime] values.
///
/// Supports localized numerals (e.g., Arabic ١٢٣٤٥) when [useLocalizedNumerals]
/// is true and the current locale uses a different numeral system.
class AnimatedTimeDisplay extends StatefulWidget {
  const AnimatedTimeDisplay({
    super.key,
    required this.time,
    this.layout = AnimatedTimeDisplayLayout.hoursMinutes,
    this.use24HourFormat = false,
    this.useLocalizedNumerals = true,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInOut,
    this.textStyle,
  });

  /// The time of day to display. Only the time portion is considered.
  final DateTime? time;

  /// Determines the segments rendered by the widget.
  final AnimatedTimeDisplayLayout layout;

  /// When `true`, renders hours in 24h format; otherwise 12h format is used.
  final bool use24HourFormat;

  /// When `true`, uses localized numerals based on the current locale
  /// (e.g., Arabic numerals ٠١٢٣٤٥٦٧٨٩ for Arabic locale).
  final bool useLocalizedNumerals;

  /// Duration of the digit transition animation.
  final Duration duration;

  /// Curve applied to the digit transition animation.
  final Curve curve;

  /// Optional text style override. Defaults to the displayLarge style with
  /// tabular figures applied for stable widths.
  final TextStyle? textStyle;

  @override
  State<AnimatedTimeDisplay> createState() => _AnimatedTimeDisplayState();
}

class _AnimatedTimeDisplayState extends State<AnimatedTimeDisplay> {
  _AnimationDirection? _direction;

  // Arabic-Indic numerals (used in Arabic locales)
  static const _arabicNumerals = [
    '٠',
    '١',
    '٢',
    '٣',
    '٤',
    '٥',
    '٦',
    '٧',
    '٨',
    '٩',
  ];

  @override
  void didUpdateWidget(covariant AnimatedTimeDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldValue = _timePortionInSeconds(oldWidget.time);
    final newValue = _timePortionInSeconds(widget.time);

    if (oldValue == null || newValue == null) {
      if (newValue == null) {
        _direction = null;
      } else if (oldValue == null) {
        _direction = _AnimationDirection.forward;
      }
      return;
    }

    if (oldValue == newValue) {
      return;
    }

    _direction = newValue > oldValue
        ? _AnimationDirection.forward
        : _AnimationDirection.backward;
  }

  int? _timePortionInSeconds(DateTime? time) {
    if (time == null) return null;
    return time.hour * 3600 + time.minute * 60 + time.second;
  }

  String _localizeNumerals(String input, BuildContext context) {
    if (!widget.useLocalizedNumerals) return input;

    final isArabic = context.isArabic;
    if (!isArabic) return input;

    final buffer = StringBuffer();
    for (final char in input.characters) {
      final digit = int.tryParse(char);
      if (digit != null) {
        buffer.write(_arabicNumerals[digit]);
      } else {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }

  String _formatTime(DateTime? time, BuildContext context) {
    final placeholder = switch (widget.layout) {
      AnimatedTimeDisplayLayout.hoursMinutes => '--:--',
      AnimatedTimeDisplayLayout.hoursMinutesSeconds => '--:--:--',
      AnimatedTimeDisplayLayout.secondsOnly => '--',
    };
    if (time == null) return _localizeNumerals(placeholder, context);

    final hourValue = widget.use24HourFormat ? time.hour : _to12Hour(time.hour);
    final hours = hourValue.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final seconds = time.second.toString().padLeft(2, '0');

    final formatted = switch (widget.layout) {
      AnimatedTimeDisplayLayout.hoursMinutes => '$hours:$minutes',
      AnimatedTimeDisplayLayout.hoursMinutesSeconds =>
        '$hours:$minutes:$seconds',
      AnimatedTimeDisplayLayout.secondsOnly => seconds,
    };

    return _localizeNumerals(formatted, context);
  }

  int _to12Hour(int hour) {
    final mod = hour % 12;
    return mod == 0 ? 12 : mod;
  }

  @override
  Widget build(BuildContext context) {
    final style =
        widget.textStyle ??
        context.typography.bold24.copyWith(
          fontFamily: 'Roboto Mono',
          fontFeatures: const [FontFeature.tabularFigures()],
        );

    final formatted = _formatTime(widget.time, context);
    final characters = formatted.characters.toList();

    // Force LTR direction for numbers even in RTL locales
    // Numbers should always be displayed left-to-right
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var index = 0; index < characters.length; index++)
            _AnimatedDigit(
              key: ValueKey('digit-$index'),
              value: characters[index],
              style: style,
              duration: widget.duration,
              curve: widget.curve,
              direction: _direction,
              animate: _isAnimatableDigit(characters[index]),
            ),
        ],
      ),
    );
  }

  /// Checks if a character is a digit (either Western or Arabic-Indic).
  bool _isAnimatableDigit(String char) {
    if (int.tryParse(char) != null) return true;
    // Check if it's an Arabic-Indic numeral
    return _arabicNumerals.contains(char);
  }
}

enum _AnimationDirection { forward, backward }

class _AnimatedDigit extends StatefulWidget {
  const _AnimatedDigit({
    super.key,
    required this.value,
    required this.style,
    required this.duration,
    required this.curve,
    required this.direction,
    required this.animate,
  });

  final String value;
  final TextStyle style;
  final Duration duration;
  final Curve curve;
  final _AnimationDirection? direction;
  final bool animate;

  @override
  State<_AnimatedDigit> createState() => _AnimatedDigitState();
}

class _AnimatedDigitState extends State<_AnimatedDigit>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Animation<Offset>? _incomingSlide;
  Animation<Offset>? _outgoingSlide;
  Animation<double>? _incomingOpacity;
  Animation<double>? _outgoingOpacity;

  String _currentValue = '';
  String? _previousValue;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener(_handleStatus);
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant _AnimatedDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }

    if (widget.value != _currentValue) {
      _startAnimation(widget.value);
    }
  }

  void _handleStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        _isAnimating = false;
        _previousValue = null;
        _controller.value = 0;
      });
    }
  }

  void _startAnimation(String newValue) {
    if (!widget.animate || widget.direction == null) {
      setState(() {
        _previousValue = null;
        _currentValue = newValue;
        _isAnimating = false;
      });
      return;
    }

    _previousValue = _currentValue;
    _currentValue = newValue;

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);
    final sign = widget.direction == _AnimationDirection.forward ? 1.0 : -1.0;

    _incomingSlide = Tween<Offset>(
      begin: Offset(0, -sign),
      end: Offset.zero,
    ).animate(curved);

    _outgoingSlide = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, sign),
    ).animate(curved);

    _incomingOpacity = Tween<double>(begin: 0, end: 1).animate(curved);
    _outgoingOpacity = Tween<double>(begin: 1, end: 0).animate(curved);

    setState(() {
      _isAnimating = true;
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style.copyWith(
      fontFamily: 'Roboto Mono',
      fontFeatures: const [FontFeature.tabularFigures()],
    );

    if (!_isAnimating || _previousValue == null) {
      return Text(_currentValue, style: style);
    }

    return ClipRect(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_previousValue != null)
            FadeTransition(
              opacity: _outgoingOpacity!,
              child: SlideTransition(
                position: _outgoingSlide!,
                child: Text(_previousValue!, style: style),
              ),
            ),
          FadeTransition(
            opacity: _incomingOpacity!,
            child: SlideTransition(
              position: _incomingSlide!,
              child: Text(_currentValue, style: style),
            ),
          ),
        ],
      ),
    );
  }
}
