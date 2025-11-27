import 'package:coflow_users_v2/core/core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// A reusable file upload widget with drag-and-drop support.
///
/// This widget provides a consistent file upload UI with support for
/// file selection via click or drag-and-drop.
///
/// Example:
/// ```dart
/// EzFileUpload(
///   title: 'Upload Logo',
///   subtitle: 'Click to choose file or drag and drop',
///   supportedFormats: 'PNG, JPG, JPEG, WEBP, SVG',
///   onFileSelected: (path) => print('Selected: $path'),
/// )
/// ```
class EzFileUpload extends StatefulWidget {
  /// The main title displayed in the upload area
  final String title;

  /// The subtitle with instructions
  final String subtitle;

  /// Supported file formats text
  final String supportedFormats;

  /// Callback when a file is selected
  final ValueChanged<String>? onFileSelected;

  /// Optional initial file path to display
  final String? initialFilePath;

  /// Allowed file extensions (e.g., ['png', 'jpg', 'jpeg'])
  final List<String>? allowedExtensions;

  /// Icon to display in the upload area
  final IconData icon;

  /// Height of the upload area
  final double height;

  const EzFileUpload({
    super.key,
    required this.title,
    required this.subtitle,
    required this.supportedFormats,
    this.onFileSelected,
    this.initialFilePath,
    this.allowedExtensions,
    this.icon = LucideIcons.image,
    this.height = 200,
  });

  @override
  State<EzFileUpload> createState() => _EzFileUploadState();
}

class _EzFileUploadState extends State<EzFileUpload> {
  String? _selectedFilePath;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _selectedFilePath = widget.initialFilePath;
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: widget.allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: widget.allowedExtensions,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      setState(() {
        _selectedFilePath = file.path ?? file.name;
      });
      widget.onFileSelected?.call(file.path ?? file.name);
    }
  }

  void _clearFile() {
    setState(() {
      _selectedFilePath = null;
    });
    widget.onFileSelected?.call('');
  }

  String _getFileName() {
    if (_selectedFilePath == null) return '';
    return _selectedFilePath!.split('/').last;
  }

  @override
  Widget build(BuildContext context) {
    final hasFile = _selectedFilePath != null && _selectedFilePath!.isNotEmpty;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: hasFile ? null : _pickFile,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          child: CustomPaint(
            painter: _DashedBorderPainter(
              color: context.colors.strokeSecondary,
              strokeWidth: 1.5,
              dashLength: 8,
              gapLength: 4,
              borderRadius: 12,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide.none,
                ),
                color: hasFile
                    ? context.colors.backgroundTwo
                    : (_isHovering
                          ? context.colors.backgroundTwo
                          : context.colors.backgroundWhite),
              ),
              padding: EdgeInsets.all(context.spacing.s24),
              child: hasFile ? _buildFilePreview() : _buildUploadPrompt(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadPrompt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.spacing.s12,
      children: [
        Container(
          padding: EdgeInsets.all(context.spacing.s12),
          decoration: ShapeDecoration(
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: context.colors.backgroundTwo,
          ),
          child: Icon(
            widget.icon,
            size: 32,
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          widget.title,
          style: context.typography.medium18.secondary(context),
          textAlign: TextAlign.center,
        ),
        Text(
          widget.subtitle,
          style: context.typography.book12.tertiary(context),
          textAlign: TextAlign.center,
        ),
        Text(
          widget.supportedFormats,
          style: context.typography.book12.tertiary(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFilePreview() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.spacing.s12,
      children: [
        Container(
          padding: EdgeInsets.all(context.spacing.s12),
          decoration: ShapeDecoration(
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            color: context.colors.seaCaribbeanSecondary,
          ),
          child: Icon(
            LucideIcons.fileCheck,
            size: 32,
            color: context.colors.seaCaribbeanPrimary,
          ),
        ),
        Text(
          _getFileName(),
          style: context.typography.medium18.primary(context),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.spacing.s12,
          children: [
            _ActionButton(
              icon: LucideIcons.repeat,
              label: 'Change',
              onPressed: _pickFile,
            ),
            _ActionButton(
              icon: LucideIcons.trash2,
              label: 'Remove',
              onPressed: _clearFile,
              isDestructive: true,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isDestructive;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? context.colors.energyCherryPrimary
        : context.colors.textSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.s12,
            vertical: context.spacing.s8,
          ),
          child: Row(
            spacing: context.spacing.s8,
            children: [
              Icon(icon, size: 16, color: color),
              Text(label, style: context.typography.medium12.withColor(color)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter for dashed border
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final double borderRadius;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = _createDashedPath(path, dashLength, gapLength);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path source, double dashLength, double gapLength) {
    final path = Path();
    final metrics = source.computeMetrics();

    for (final metric in metrics) {
      double distance = 0.0;
      bool draw = true;

      while (distance < metric.length) {
        final length = draw ? dashLength : gapLength;
        final end = distance + length;

        if (draw) {
          path.addPath(
            metric.extractPath(distance, end.clamp(0, metric.length)),
            Offset.zero,
          );
        }

        distance = end;
        draw = !draw;
      }
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashLength != oldDelegate.dashLength ||
        gapLength != oldDelegate.gapLength ||
        borderRadius != oldDelegate.borderRadius;
  }
}
