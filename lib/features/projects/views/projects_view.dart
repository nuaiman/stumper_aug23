import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stumper/features/projects/controllers/single_project_controller.dart';
import 'package:stumper/features/projects/widgets/project_tile.dart';

class ProjectsView extends ConsumerWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('P R O J E C T S'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref
                  .read(singleProjectControllerProvider.notifier)
                  .goToAddProjectScreen(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ProjectTile(),
      ),
    );
  }
}
