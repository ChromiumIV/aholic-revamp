import 'package:aholic/domain/entities/checklist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checklist_repository.g.dart';

@riverpod
ChecklistRepository checklistRepository(Ref ref) {
  return ChecklistRepository();
}

class ChecklistRepository {
  // Mock data storage
  final Map<int, Checklist> _storage = {};

  Future<Checklist?> getChecklistById(int id) async {
    return _storage[id];
  }

  Future<void> saveChecklist(Checklist checklist) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    var x = _storage.keys.reduce((a, b) => a > b ? a : b);

    if (checklist.pinnable.pinnableId == null) {
      checklist = checklist.copyWith(
        pinnable: checklist.pinnable.copyWith(pinnableId: (++x)),
      );
    }

    _storage[checklist.pinnable.pinnableId!] = checklist;
  }

  Future<void> deleteChecklist(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _storage.remove(id);
  }
}
