import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/providers/providers.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            sufficIcon: IconButton(
                onPressed: () => _selectDate(context, ref),
                icon: const Icon(Icons.calendar_month_rounded)),
            labelText: DateFormat.yMMMd().format(date),
          ),
        ),
        const Gap(15),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            sufficIcon: IconButton(
                onPressed: () => _selectTime(context, ref),
                icon: const Icon(Icons.watch_later_rounded)),
            labelText: Helpers.timeToString(time),
          ),
        )
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);

    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2090));

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
