import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stumper/features/projects/controllers/single_project_controller.dart';
import 'package:stumper/models/customer_model.dart';
import 'package:stumper/models/project_model.dart';

class AddProjectView extends ConsumerStatefulWidget {
  const AddProjectView({super.key});

  @override
  ConsumerState<AddProjectView> createState() => _AddProjectViewState();
}

class _AddProjectViewState extends ConsumerState<AddProjectView> {
  CustomerModel? customerModel;

  ProjectSource selectedProjectSource = ProjectSource.web;

  final _addressController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Project')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customerModel == null
                  ? TextButton.icon(
                      onPressed: () {
                        ref
                            .read(singleProjectControllerProvider.notifier)
                            .goToSearchCustomerScreen(context);
                      },
                      label: const Text('Add Customer'),
                      icon: const Icon(Icons.add),
                    )
                  : ListTile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Project Source'),
                  const Spacer(),
                  DropdownButton(
                    underline: Container(),
                    value: selectedProjectSource,
                    items: const [
                      DropdownMenuItem(
                        value: ProjectSource.web,
                        child: Text('Website'),
                      ),
                      DropdownMenuItem(
                        value: ProjectSource.call,
                        child: Text('Call'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedProjectSource = value!;
                      });
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Note'),
                  TextField(
                    controller: _noteController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Location'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Address'),
                      const Spacer(),
                      Expanded(
                        child: TextField(
                          controller: _addressController,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Center(
                      child: Text('Map'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextButton.icon(
                onPressed: () {
                  ref
                      .read(singleProjectControllerProvider.notifier)
                      .goToAddStumpScreen(context);
                },
                label: const Text('Add Stump'),
                icon: const Icon(Icons.add),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
