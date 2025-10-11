import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OverlayEffect extends StatefulWidget {
  final Widget targetWidget;
  final Widget previewImage; // The image or custom widget to follow the cursor
  final double imageWidth;
  final double horizontalOffset; // Offset from the cursor

  const OverlayEffect({
    super.key,
    required this.targetWidget,
    required this.previewImage,
    this.imageWidth = 200.0,
    this.horizontalOffset = 12.0,
  });

  @override
  State<OverlayEffect> createState() => _OverlayEffectState();
}

class _OverlayEffectState extends State<OverlayEffect> {
  OverlayEntry? _overlayEntry;
  Offset _cursorPosition = Offset.zero;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  // --- Overlay Management Methods ---

  // 1. Creates the OverlayEntry (the floating widget)
  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      // The builder is constantly rebuilt when we call _updateOverlay
      builder: (context) {
        // Calculate the position relative to the cursor, adjusting for the image size
        // We subtract half the height to center it vertically near the cursor,
        // and add a horizontal offset to keep it slightly right of the cursor.
        final double left = _cursorPosition.dx + widget.horizontalOffset;
        final double top = _cursorPosition.dy - widget.horizontalOffset;
        final theme = Theme.of(context);
        final isEnglish = context.locale == Locale('en');
        final size = MediaQuery.sizeOf(context);
        return Positioned(
          right: isEnglish
              ? null
              : size.width - left + widget.horizontalOffset * 2,
          left: isEnglish ? left : null,
          bottom: size.height - top,

          // Use a Material or Container with elevation for the visual "pop"
          child: Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(8.0),
            clipBehavior: Clip.antiAlias,
            child: Container(
              padding: EdgeInsets.all(12),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.onPrimary.withAlpha(
                    (255 * 0.25).floor(),
                  ),
                ),
              ),
              constraints: BoxConstraints(
                minWidth: widget.imageWidth,
                maxWidth: 500,
              ),

              child: widget.previewImage,
            ),
          ),
        );
      },
    );
  }

  // 2. Shows the overlay
  void _showOverlay(Offset position) {
    // Only show if it's not already visible
    if (_overlayEntry != null) return;

    // Initial position update before insertion
    _cursorPosition = position;
    _overlayEntry = _createOverlayEntry();

    // Insert the entry into the nearest Overlay
    Overlay.of(context).insert(_overlayEntry!);
  }

  // 3. Updates the position of the existing overlay
  void _updateOverlay(Offset position) {
    if (_overlayEntry == null) return;

    // Update the position state
    _cursorPosition = position;

    // Rebuild the overlay entry with the new position
    _overlayEntry!.markNeedsBuild();
  }

  // 4. Removes the overlay
  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  // --- Build Method ---

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // When the mouse enters, show the overlay at the current position
      onEnter: (event) => _showOverlay(event.position),

      // When the mouse moves, continuously update the overlay position
      onHover: (event) => _updateOverlay(event.position),

      // When the mouse exits, remove the overlay
      onExit: (_) => _removeOverlay(),

      child: widget.targetWidget,
    );
  }
}
