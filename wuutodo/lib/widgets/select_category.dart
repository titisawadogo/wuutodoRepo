import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wuutodo/providers/providers.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TodoCategory.values.toList();
    final selectCategory = ref.watch(categoryProvider);

    return SizedBox(
      height: 60,
      child: Row(children: [
        Text(
          'Category',
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  final category = categories[index];

                  return InkWell(
                    onTap: () {
                      ref.read(categoryProvider.notifier).state = category;
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: CircleContainer(
                      color: category.color.withOpacity(0.3),
                      child: Icon(
                        category.icon,
                        color: category == selectCategory
                            ? context.colorScheme.primary
                            : category.color,
                      ),
                    ),
                  );
                }),
                separatorBuilder: ((context, index) => const Gap(8)),
                itemCount: categories.length))
      ]),
    );
  }
}
