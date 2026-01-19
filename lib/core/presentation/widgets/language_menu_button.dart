import 'package:coflow_users_v2/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pie_menu/pie_menu.dart';

class LanguageMenuButton extends StatelessWidget {
  const LanguageMenuButton({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget builder = BlocBuilder<LocalizationCubit, LocalizationState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        final currentLocale = state.locale ?? LocalizationManager.defaultLocale;
        final localeCode = currentLocale.languageCode.toUpperCase();

        final buttonShape = RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(context.spacing.s96),
        );

        final buttonDecoration = ShapeDecoration(
          color: context.colors.backgroundWhite,
          shape: buttonShape,
        );

        final hoveredDecoration = ShapeDecoration(
          color: context.colors.backgroundTwo,
          shape: buttonShape,
        );

        return PieMenu(
          theme: PieTheme(
            regularPressShowsMenu: true,
            longPressShowsMenu: false,
            pointerSize: 0,
            pointerColor: Colors.transparent,
            overlayColor: Colors.black.withValues(alpha: 0.4),
            tooltipTextStyle: context.typography.bold24.primary(context),
            buttonTheme: PieButtonTheme(
              backgroundColor: context.colors.backgroundWhite,
              iconColor: context.colors.textPrimary,
              decoration: buttonDecoration,
            ),
            buttonThemeHovered: PieButtonTheme(
              backgroundColor: context.colors.backgroundTwo,
              iconColor: context.colors.textPrimary,
              decoration: hoveredDecoration,
            ),
          ),
          actions: LocalizationManager.supportedLocales
              .map(
                (locale) => PieAction.builder(
                  tooltip: Text(locale.languageCode.toUpperCase()),
                  onSelect: () =>
                      context.read<LocalizationCubit>().setLocale(locale),
                  builder: (hovered) => _LanguageMenuOption(
                    locale: locale,
                    isSelected:
                        locale.languageCode == currentLocale.languageCode,
                    isHovered: hovered,
                  ),
                ),
              )
              .toList(),
          child: _LanguageMenuChip(code: localeCode),
        );
      },
    );

    if (padding != null) {
      builder = Padding(padding: padding!, child: builder);
    }

    return builder;
  }
}

class _LanguageMenuChip extends StatelessWidget {
  const _LanguageMenuChip({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(context.spacing.s16),
    );

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: context.colors.backgroundWhite,
        shape: shape,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s16,
          vertical: context.spacing.s8,
        ),
        child: UnconstrainedBox(
          child: MainAnimatedSwitcher.blurFadeRotate(
            duration: 100.ms,
            child: Row(
              key: ValueKey(context.watch<LocalizationCubit>().state.locale),
              mainAxisSize: MainAxisSize.min,
              spacing: context.spacing.s4,
              children: [
                Text(code, style: context.typography.medium14.primary(context)),
                Icon(
                  LucideIcons.chevronsUpDown,
                  size: context.spacing.s16,
                  color: context.colors.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageMenuOption extends StatelessWidget {
  const _LanguageMenuOption({
    required this.locale,
    required this.isSelected,
    required this.isHovered,
  });

  final Locale locale;
  final bool isSelected;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final textStyle = isSelected
        ? context.typography.book14.primary(context).withWeight(FontWeight.w600)
        : context.typography.book14.secondary(context);

    final shape = RoundedSuperellipseBorder(
      borderRadius: BorderRadius.circular(context.spacing.s16),
    );

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: isHovered
            ? context.colors.backgroundTwo
            : context.colors.backgroundWhite,
        shape: shape,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing.s12,
          vertical: context.spacing.s8,
        ),
        child: Text(locale.languageCode.toUpperCase(), style: textStyle),
      ),
    );
  }
}
