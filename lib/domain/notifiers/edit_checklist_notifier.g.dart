// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_checklist_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditChecklistNotifier)
const editChecklistProvider = EditChecklistNotifierFamily._();

final class EditChecklistNotifierProvider
    extends $NotifierProvider<EditChecklistNotifier, EditChecklistState> {
  const EditChecklistNotifierProvider._({
    required EditChecklistNotifierFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'editChecklistProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editChecklistNotifierHash();

  @override
  String toString() {
    return r'editChecklistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EditChecklistNotifier create() => EditChecklistNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditChecklistState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditChecklistState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditChecklistNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editChecklistNotifierHash() =>
    r'7b9a5e39fe49ce9e79e7f3ac0d919ecb2ab06e5c';

final class EditChecklistNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EditChecklistNotifier,
          EditChecklistState,
          EditChecklistState,
          EditChecklistState,
          int?
        > {
  const EditChecklistNotifierFamily._()
    : super(
        retry: null,
        name: r'editChecklistProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EditChecklistNotifierProvider call(int? checklistId) =>
      EditChecklistNotifierProvider._(argument: checklistId, from: this);

  @override
  String toString() => r'editChecklistProvider';
}

abstract class _$EditChecklistNotifier extends $Notifier<EditChecklistState> {
  late final _$args = ref.$arg as int?;
  int? get checklistId => _$args;

  EditChecklistState build(int? checklistId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<EditChecklistState, EditChecklistState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditChecklistState, EditChecklistState>,
              EditChecklistState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
