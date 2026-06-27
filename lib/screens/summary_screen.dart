import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SubjectProvider>();
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.subject, color: colorScheme.primary),
              title: const Text('Total Subjects'),
              trailing: Text(
                provider.totalSubjects.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: Icon(Icons.bar_chart, color: colorScheme.primary),
              title: const Text('Average Mark'),
              trailing: Text(
                provider.averageMark.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: Icon(Icons.grade, color: colorScheme.primary),
              title: const Text('Overall Grade'),
              trailing: Text(
                provider.overallGrade,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Passing Subjects (50+)',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 12),

                  if (provider.passedSubjects.isEmpty)
                    const Text('No passing subjects')
                  else
                    ...provider.passedSubjects.map(
                      (subject) => ListTile(
                        title: Text(subject.name),
                        trailing: Text(subject.grade),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
