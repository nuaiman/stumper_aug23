import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stumper/features/projects/views/add_customer_view.dart';
import 'package:stumper/features/projects/views/add_project_view.dart';
import 'package:stumper/features/projects/views/add_stump_view.dart';
import 'package:stumper/features/projects/views/search_customer_ciew.dart';
import 'package:stumper/models/project_model.dart';

class SingleProjectController extends StateNotifier<ProjectModel> {
  SingleProjectController()
      : super(
          ProjectModel(
            coverPath: '',
            customerId: '',
            stumpIds: [],
            stumpCount: 0,
            status: ProjectStatus.active,
            source: ProjectSource.call,
            note: '',
            firstCall: DateTime.now(),
            nextCall: DateTime.now(),
            lat: 0,
            lon: 0,
            address: '',
          ),
        );

  void goToAddProjectScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddProjectView(),
    ));
  }

  void goToSearchCustomerScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SearchCustomerView(),
    ));
  }

  void goToAddCustomerScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddCustomerView(),
    ));
  }

  void goToAddStumpScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddStumpView(),
    ));
  }
}
// -----------------------------------------------------------------------------

final singleProjectControllerProvider =
    StateNotifierProvider<SingleProjectController, ProjectModel>((ref) {
  return SingleProjectController();
});
