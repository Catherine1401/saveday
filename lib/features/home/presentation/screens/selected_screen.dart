import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saveday/features/home/presentation/providers/select_data_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SelectedScreen extends ConsumerWidget {
  SelectedScreen({super.key});

  final _dataSources = ['local', 'remote', 'firestore'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadSonner(
      child: Builder(
        builder: (contextSooner) {
          return Center(
            child: ShadSelect<int>(
              placeholder: Text('select a datasource'),
              options: _dataSources
                  .map(
                    (e) => ShadOption(
                      value: _dataSources.indexOf(e),
                      child: Text(e),
                    ),
                  )
                  .toList(),
              selectedOptionBuilder: (_, value) {
                return Text(_dataSources.elementAt(value));
              },
              onChanged: (value) {
                ref
                    .read(selectDataSourceProvider.notifier)
                    .changeDataSource(value!);

                // show toach
                final sonner = ShadSonner.of(contextSooner);
                final id = Random().nextInt(100);
                sonner.show(
                  ShadToast(
                    id: id,
                    title: Text('datasource: ${_dataSources.elementAt(value)}'),
                    action: ShadButton.outline(
                      child: Text('hide'),
                      onPressed: () => sonner.hide(id),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
