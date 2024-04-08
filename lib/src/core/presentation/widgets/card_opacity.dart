import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:otoscopia/src/config/config.dart';

class CardOpacity extends ConsumerWidget {
  const CardOpacity({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 0, 16),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppColors();
    return Card(
      borderColor: color.systemAccent.darkest.withOpacity(.1),
      padding: padding,
      backgroundColor: FluentTheme.of(context).cardColor.withOpacity(.05),
      borderRadius: BorderRadius.circular(10),
      child: child,
    );
  }
}
