import 'package:aholic/data/repositories/checklist_repository.dart';
import 'package:aholic/domain/entities/checklist.dart';
import 'package:aholic/domain/entities/checklist_item.dart';
import 'package:aholic/domain/entities/pinnable.dart';
import 'package:aholic/presentation/theme/ahl_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_checklist_notifier.freezed.dart';
part 'edit_checklist_notifier.g.dart';

@freezed
abstract class EditChecklistState with _$EditChecklistState {
  const factory EditChecklistState({
    required Checklist checklist,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool hasUnsavedChanges,
    String? errorMessage,
  }) = _EditChecklistState;
}

@riverpod
class EditChecklistNotifier extends _$EditChecklistNotifier {
  @override
  EditChecklistState build(int? checklistId) {
    if (checklistId == null) {
      return EditChecklistState(checklist: _createEmptyChecklist());
    }

    final state = EditChecklistState(
      checklist: _createEmptyChecklist(),
      isLoading: true,
    );

    _init(checklistId);

    return state;
  }

  void updateTitle(String title) {
    state = state.copyWith(
      checklist: state.checklist.copyWith(
        pinnable: state.checklist.pinnable.copyWith(title: title),
      ),
      hasUnsavedChanges: true,
    );
  }

  void addItem({String? title}) {
    final now = DateTime.now();
    final newItem = ChecklistItem(
      title: title ?? '',
      order: state.checklist.items.length,
      createdAt: now,
      createdBy: '',
    );
    final updatedItems = [...state.checklist.items, newItem];

    state = state.copyWith(
      checklist: state.checklist.copyWith(items: updatedItems),
      hasUnsavedChanges: true,
    );
  }

  Future<void> updateItem(String itemId, String title) async {}

  Future<void> _init(int checklistId) async {
    state = state.copyWith(isLoading: true);

    final repository = ref.watch(checklistRepositoryProvider);
    final checklist = await repository.getChecklistById(checklistId);

    state = state.copyWith(isLoading: false);

    if (checklist != null) {
      state = state.copyWith(checklist: checklist);
    } else {
      // TODO
    }
  }

  Checklist _createEmptyChecklist() {
    final now = DateTime.now();

    return Checklist(
      pinnable: Pinnable(
        title: '',
        note: '',
        createdAt: now,
        createdBy: '',
        updatedAt: now,
        updatedBy: '',
      ),
      color: AhlColors.azure.toARGB32(),
      items: [],
    );
  }
}
