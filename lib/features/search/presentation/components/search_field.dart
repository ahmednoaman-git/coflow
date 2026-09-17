import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

/// The query input at the top of the search screen: gold-outlined pill with a
/// leading magnifier, and a clear button once there is something to clear.
class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onChanged,
    this.autofocus = true,
  });

  final ValueChanged<String> onChanged;
  final bool autofocus;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final hasText = value.isNotEmpty;
    if (hasText != _hasText) setState(() => _hasText = hasText);
    widget.onChanged(value);
  }

  void _clear() {
    _controller.clear();
    _onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final border = RoundedSuperellipseInputBorder(
      borderRadius: BorderRadius.circular(context.spacing.s12),
      borderSide: BorderSide(color: context.colors.earthSunnyGoldPrimary),
    );

    return TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      onChanged: _onChanged,
      textInputAction: TextInputAction.search,
      style: context.typography.medium14.primary(context),
      cursorColor: context.colors.earthSunnyGoldPrimary,
      decoration: InputDecoration(
        hintText: context.l10n.search_hint,
        hintStyle: context.typography.medium14.tertiary(context),
        filled: true,
        fillColor: context.colors.backgroundWhite,
        contentPadding: EdgeInsets.symmetric(vertical: context.spacing.s16),
        prefixIcon: Icon(
          SolarIconsOutline.magnifier,
          size: 22,
          color: context.colors.earthSunnyGoldPrimary,
        ),
        suffixIcon: _hasText
            ? IconButton(
                onPressed: _clear,
                icon: Icon(
                  SolarIconsOutline.closeCircle,
                  size: 20,
                  color: context.colors.textTertiary,
                ),
              )
            : null,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
