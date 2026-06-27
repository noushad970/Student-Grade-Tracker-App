import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subject_provider.dart';

class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final markController = TextEditingController();

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject name';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Mark (0 - 100)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final mark = double.tryParse(value ?? '');

                if (mark == null) {
                  return 'Please enter a valid number';
                }

                if (mark < 0 || mark > 100) {
                  return 'Mark must be between 0 and 100';
                }

                return null;
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SubjectProvider>().addSubject(
                      nameController.text.trim(),
                      double.parse(markController.text),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Subject added successfully'),
                      ),
                    );

                    nameController.clear();
                    markController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: const Text('Add Subject'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
