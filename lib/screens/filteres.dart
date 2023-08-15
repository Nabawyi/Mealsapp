import 'package:flutter/material.dart';
// import 'package:mealsapp/screens/taps.dart';
// import 'package:mealsapp/widgets/main_drower.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/providers/filter_provider.dart';

class Filtersscreen extends ConsumerWidget {
  const Filtersscreen({super.key});

  // ignore: annotate_overrides
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter = ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilter[Filter.glutenfree]!,
            onChanged: (ischeked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filter.glutenfree, ischeked);
            },
            title: Text(
              'Gluten free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gluten free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.lactosefree]!,
            onChanged: (ischeked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filter.lactosefree, ischeked);
            },
            title: Text(
              'Lactose free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Lactose free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.vegetarian]!,
            onChanged: (ischeked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filter.vegetarian, ischeked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[Filter.vegan]!,
            onChanged: (ischeked) {
              ref
                  .read(filtersprovider.notifier)
                  .setFilter(Filter.vegan, ischeked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
