import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SubjectProvider>();
    final subjects = provider.subjects;

    if (subjects.isEmpty) {
      return const Center(child: Text('No subjects added yet'));
    }

    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];

        return Dismissible(
          key: Key('${subject.name}-$index'),
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: Theme.of(context).colorScheme.error,
            child: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),
          onDismissed: (_) {
            provider.removeSubject(index);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('${subject.name} deleted')));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text(subject.grade)),
              title: Text(subject.name),
              subtitle: Text('Mark: ${subject.mark.toStringAsFixed(1)}'),
              trailing: Text(
                subject.grade,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}
