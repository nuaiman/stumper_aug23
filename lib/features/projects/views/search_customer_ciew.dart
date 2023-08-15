import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/single_project_controller.dart';

class SearchCustomerView extends ConsumerWidget {
  const SearchCustomerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Customer'),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(singleProjectControllerProvider.notifier)
                  .goToAddCustomerScreen(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
