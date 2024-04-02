import 'package:cat_breeds_app/presentation/providers/catbreeds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(catBreedsProvider).isEmpty;
  if (step1) return true;
  return false;
});
