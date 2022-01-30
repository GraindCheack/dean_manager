import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({required this.mainRepository}) : super();
  final IMainRepository mainRepository;

  @override
  void onInit() {
    subscribe();
    super.onInit();
  }

  void subscribe() {
    selected.listen((value) {
      updateAll();
    });
  }

  final RxList<GroupHive> groups = <GroupHive>[].obs;
  final RxList<StudentHive> students = <StudentHive>[].obs;
  final RxList<TeacherHive> teachers = <TeacherHive>[].obs;

  final Rx<dynamic> selected = Rx<dynamic>(null);

  void updateGroups() async => groups(await mainRepository.getGroups());
  void updateStudents() async => students(await mainRepository.getStudents());
  void updateTeachers() async => teachers(await mainRepository.getTeachers());
  void updateAll() async {
    updateGroups();
    updateStudents();
    updateTeachers();
  }
}
