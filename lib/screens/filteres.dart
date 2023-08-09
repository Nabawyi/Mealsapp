import 'package:flutter/material.dart';
// import 'package:mealsapp/screens/taps.dart';
// import 'package:mealsapp/widgets/main_drower.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,
}

class Filtersscreen extends StatefulWidget {
  const Filtersscreen({super.key, required this.currentfilter});
  final Map<Filter, bool> currentfilter;

  @override
  State<Filtersscreen> createState() => _FiltersscreenState();
}

class _FiltersscreenState extends State<Filtersscreen> {
  var _gultenfree = false;
  var _lactozfree = false;
  var _vegfilter = false;
  var _veganfilter = false;
  @override
  void initState() {
    super.initState();
    _gultenfree = widget.currentfilter[Filter.glutenfree]!;
    _lactozfree = widget.currentfilter[Filter.lactosefree]!;
    _vegfilter = widget.currentfilter[Filter.vegan]!;
    _veganfilter=widget.currentfilter[Filter.vegetarian]!;

  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: Maindrawer(
      //   onselectedscreen: (identefire) {
      //     Navigator.of(context).pop();
      //     if (identefire == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const Tapsscreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _gultenfree,
            Filter.lactosefree: _lactozfree,
            Filter.vegetarian: _vegfilter,
            Filter.vegan: _veganfilter,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultenfree,
              onChanged: (ischeked) {
                setState(() {
                  _gultenfree = ischeked;
                });
              },
              title: Text(
                'Gluten free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactozfree,
              onChanged: (ischeked) {
                setState(() {
                  _lactozfree = ischeked;
                });
              },
              title: Text(
                'Lactose free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactose free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegfilter,
              onChanged: (ischeked) {
                setState(() {
                  _vegfilter = ischeked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganfilter,
              onChanged: (ischeked) {
                setState(() {
                  _veganfilter = ischeked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
