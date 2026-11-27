import 'package:flutter_riverpod/flutter_riverpod.dart';

/// بيانات شاشة تُحمَّل مرة واحدة (أو عند الإبطال) — بديل `_loading`/`_error`
/// و`setState` داخل الشاشة.
///
/// تُنشئه الشاشة لنفسها (`late final _data = screenDataProvider(() => ...)`)
/// لأن [load] يقرأ حالتها (الفلاتر وما مُرّر للويدجت) عند كل تحميل.
/// القراءة `ref.watch(_data)`، وإعادة التحميل `ref.invalidate(_data)`.
AutoDisposeFutureProvider<T> screenDataProvider<T>(Future<T> Function() load) =>
    FutureProvider.autoDispose<T>((ref) => load());

/// يعيد تحميل [provider] وينتظر انتهاءه دون رمي الخطأ (الخطأ يبقى في حالته).
Future<void> reloadScreenData<T>(
  WidgetRef ref,
  AutoDisposeFutureProvider<T> provider,
) async {
  ref.invalidate(provider);
  try {
    await ref.read(provider.future);
  } catch (_) {}
}
