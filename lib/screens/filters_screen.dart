import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FilterScreen(this.saveFilters, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget switchTileBuilder(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: (_) => updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final Map<String, bool> selectedFilters = <String, bool> {
            'gluten': _glutenFree,
            'vegetarian': _vegetarian,
            'vegan': _vegan,
            'lactose': _lactoseFree,
          };
          widget.saveFilters(selectedFilters);
          Navigator.of(context).popAndPushNamed('/');
        },
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your displayed meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                switchTileBuilder('Gluten free',
                    'Only display gluten-free meals', _glutenFree, (dynamic newValue) {
                  setState(() {
                    _glutenFree = newValue as bool;
                  });
                }),
                switchTileBuilder(
                    'Vegetarian', 'Only display vegetarian meals', _vegetarian, (dynamic newValue) {
                  setState(() {
                    _vegetarian = newValue as bool;
                  });
                }),
                switchTileBuilder('Vegan', 'Only display vegan meals', _vegan,
                    (dynamic newValue) {
                  setState(() {
                    _vegan = newValue as bool;
                  });
                }),
                switchTileBuilder(
                    'Lactose free',
                    'Only display lactose-free meals',
                    _lactoseFree, 
                    (dynamic newValue) {
                  setState(() {
                    _lactoseFree = newValue as bool;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
