import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A custom text field widget with iOS-like rounded corners using superellipse shape.
///
/// This widget provides a consistent text field design across the application
/// with support for labels, hints, error states, and customization options.
///
/// Example:
/// ```dart
/// MainTextField(
///   labelText: 'Email Address',
///   hintText: 'Enter your email',
///   controller: emailController,
/// )
/// ```
class MainTextField extends StatefulWidget {
  /// The label text displayed above the text field
  final String? labelText;

  /// The hint text displayed inside the text field
  final String? hintText;

  /// The controller for the text field
  final TextEditingController? controller;

  /// The initial value of the text field
  final String? initialValue;

  /// Callback when the text changes
  final ValueChanged<String>? onChanged;

  /// Callback when the text field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Whether the text field is enabled
  final bool enabled;

  /// Whether the text field is read-only
  final bool readOnly;

  /// The keyboard type
  final TextInputType? keyboardType;

  /// Input formatters to restrict input
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of text
  final int? maxLength;

  /// Error text to display below the field
  final String? errorText;

  /// Helper text to display below the field
  final String? helperText;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Validator function
  final String? Function(String?)? validator;

  /// Auto validate mode
  final AutovalidateMode? autovalidateMode;

  final bool passwordField;

  const MainTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.validator,
    this.autovalidateMode,
    this.passwordField = false,
  });

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool _obscureText = false;

  Widget _buildPasswordToggle() {
    return SizedBox.square(
      dimension: 36,
      child: Material(
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: AnimatedSwitcher(
            duration: 200.ms,
            child: Icon(
              key: ValueKey<bool>(_obscureText),
              _obscureText ? LucideIcons.eyeOff : LucideIcons.eye,
              color: context.colors.textSecondary,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: context.spacing.s8,
      children: [
        // Label
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: context.typography.medium12.primary(context),
          ),

        // Text Field
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: widget.passwordField ? !_obscureText : false,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          style: context.typography.medium12.primary(context),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: context.typography.medium12.tertiary(context),
            prefixIcon: widget.prefixIcon != null
                ? (widget.maxLines != null && widget.maxLines! > 1
                      ? Padding(
                          padding: EdgeInsets.only(top: context.spacing.s12),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              widget.prefixIcon,
                              color: context.colors.textSecondary,
                              size: 20,
                            ),
                          ),
                        )
                      : Icon(
                          widget.prefixIcon,
                          color: context.colors.textSecondary,
                          size: 20,
                        ))
                : null,
            prefixIconConstraints:
                widget.maxLines != null && widget.maxLines! > 1
                ? const BoxConstraints(minWidth: 40, minHeight: 0)
                : null,
            suffixIconConstraints: BoxConstraints(
              minWidth: widget.passwordField ? 40 : 20,
            ),
            suffixIcon: widget.suffixIcon == null
                ? widget.passwordField
                      ? _buildPasswordToggle()
                      : null
                : Icon(
                    widget.suffixIcon,
                    color: context.colors.textSecondary,
                    size: 20,
                  ),
            filled: true,
            fillColor: widget.enabled
                ? context.colors.backgroundTwo
                : context.colors.backgroundGreyTwo,
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.spacing.s8,
              vertical: context.spacing.s12,
            ),
            // Remove default counter text if maxLength is set
            counterText: '',
            errorText: widget.errorText,
            helperText: widget.helperText,
            errorStyle: context.typography.book12.error(context),
            helperStyle: context.typography.book12.tertiary(context),
            border: _buildBorder(context),
            enabledBorder: _buildBorder(context),
            focusedBorder: _buildBorder(context, isFocused: true),
            errorBorder: _buildBorder(context, hasError: true),
            focusedErrorBorder: _buildBorder(
              context,
              hasError: true,
              isFocused: true,
            ),
            disabledBorder: _buildBorder(context, isDisabled: true),
          ),
        ),
      ],
    );
  }

  /// Builds the border decoration for the text field
  InputBorder _buildBorder(
    BuildContext context, {
    bool hasError = false,
    bool isFocused = false,
    bool isDisabled = false,
  }) {
    Color borderColor;

    if (isDisabled) {
      borderColor = context.colors.strokePrimary;
    } else if (hasError) {
      borderColor = context.colors.energyCherryPrimary;
    } else if (isFocused) {
      borderColor = context.colors.strokeSecondary;
    } else {
      borderColor = context.colors.strokePrimary;
    }
    return RoundedSuperellipseInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: borderColor, width: 1.0),
    );
  }
}

/// An [InputBorder] implementation that draws a rounded superellipse outline.
///
/// This border can be used anywhere an [InputBorder] is expected, allowing
/// text fields to adopt the same superellipse shape that is typically used
/// with [ShapeDecoration]. The implementation intentionally ignores the gap
/// parameters that [OutlineInputBorder] uses for floating labels because the
/// EzBus Admin text fields show the label outside of the input decorator.
@immutable
class RoundedSuperellipseInputBorder extends InputBorder {
  /// Creates a rounded superellipse input border.
  const RoundedSuperellipseInputBorder({
    super.borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  /// The radii for each corner of the superellipse.
  final BorderRadius borderRadius;

  RoundedSuperellipseBorder _shapeWithSide(BorderSide side) {
    return RoundedSuperellipseBorder(side: side, borderRadius: borderRadius);
  }

  @override
  bool get isOutline => true;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderSide.width);

  @override
  RoundedSuperellipseInputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) {
    return RoundedSuperellipseInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  RoundedSuperellipseInputBorder scale(double t) {
    return RoundedSuperellipseInputBorder(
      borderSide: borderSide.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is RoundedSuperellipseInputBorder) {
      return RoundedSuperellipseInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    if (a is OutlineInputBorder) {
      return RoundedSuperellipseInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is RoundedSuperellipseInputBorder) {
      return RoundedSuperellipseInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    if (b is OutlineInputBorder) {
      return RoundedSuperellipseInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _shapeWithSide(
      borderSide,
    ).getInnerPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _shapeWithSide(
      borderSide,
    ).getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) {
    _shapeWithSide(
      borderSide,
    ).paintInterior(canvas, rect, paint, textDirection: textDirection);
  }

  @override
  bool get preferPaintInterior => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    if (borderSide.style == BorderStyle.none) {
      return;
    }

    _shapeWithSide(
      borderSide,
    ).paint(canvas, rect, textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is RoundedSuperellipseInputBorder &&
        other.borderSide == borderSide &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(borderSide, borderRadius);

  @override
  String toString() {
    return 'RoundedSuperellipseInputBorder(borderSide: $borderSide, borderRadius: $borderRadius)';
  }
}
