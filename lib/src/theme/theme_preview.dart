import 'package:flutter/material.dart';

class ThemePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Preview'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              ColorContainer(
                name: 'Primary',
                color: Theme.of(context).colorScheme.primary,
                onColor: Theme.of(context).colorScheme.onPrimary,
              ),
              ColorContainer(
                name: 'PrimaryVariant',
                color: Theme.of(context).colorScheme.primaryVariant,
                onColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
          Row(
            children: [
              ColorContainer(
                name: 'Secondary',
                color: Theme.of(context).colorScheme.secondary,
                onColor: Theme.of(context).colorScheme.onSecondary,
              ),
              ColorContainer(
                name: 'SecondaryVariant',
                color: Theme.of(context).colorScheme.secondaryVariant,
                onColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
          Row(
            children: [
              ColorContainer(
                name: 'Error',
                color: Theme.of(context).colorScheme.error,
                onColor: Theme.of(context).colorScheme.onError,
              ),
              ColorContainer(
                name: 'Background',
                color: Theme.of(context).colorScheme.background,
                onColor: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
          Row(
            children: [
              ColorContainer(
                name: 'Surface',
                color: Theme.of(context).colorScheme.surface,
                onColor: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
          TextThemeDisplay(
            title: 'headline1',
            ts: Theme.of(context).textTheme.headline1,
          ),
          TextThemeDisplay(
            title: 'headline2',
            ts: Theme.of(context).textTheme.headline2,
          ),
          TextThemeDisplay(
            title: 'headline3',
            ts: Theme.of(context).textTheme.headline3,
          ),
          TextThemeDisplay(
            title: 'headline4',
            ts: Theme.of(context).textTheme.headline4,
          ),
          TextThemeDisplay(
            title: 'headline5',
            ts: Theme.of(context).textTheme.headline5,
          ),
          TextThemeDisplay(
            title: 'headline6',
            ts: Theme.of(context).textTheme.headline6,
          ),
          TextThemeDisplay(
            title: 'subtitle1',
            ts: Theme.of(context).textTheme.subtitle1,
          ),
          TextThemeDisplay(
            title: 'subtitle2',
            ts: Theme.of(context).textTheme.subtitle2,
          ),
          TextThemeDisplay(
            title: 'bodyText1',
            ts: Theme.of(context).textTheme.bodyText1,
          ),
          TextThemeDisplay(
            title: 'bodyText2',
            ts: Theme.of(context).textTheme.bodyText2,
          ),
          TextThemeDisplay(
            title: 'caption',
            ts: Theme.of(context).textTheme.caption,
          ),
          TextThemeDisplay(
            title: 'button',
            ts: Theme.of(context).textTheme.button,
          ),
          TextThemeDisplay(
            title: 'overline',
            ts: Theme.of(context).textTheme.overline,
          ),
          Text('Buttons'),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {}, child: Text('ElevatedButton')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: null, child: Text('ElevatedButton')),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {}, child: Text('OutlinedButton')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: null, child: Text('OutlinedButton')),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    TextButton(onPressed: () {}, child: Text('TextButton')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(onPressed: null, child: Text('TextButton')),
              ),
            ],
          ),
          Divider(),
          SwitchListTile(
            value: true,
            onChanged: (value) {},
            title: Text('Switch (Active)'),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Switch (Inactive)'),
          ),
          Divider(),
         RadioListTile(
           value: 1,
           onChanged: (value) {},
           title: Text('Radio (Active)'),
           groupValue: 1,
         ),
         RadioListTile(
           value: false,
           onChanged: (value) {},
           title: Text('Radio (Inactive)'),
           groupValue: 2,
         ),
          Divider(),
          CheckboxListTile(
            value: true,
            onChanged: (value) {},
            title: Text('Radio (Active)'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Radio (Inactive)'),
          ),
          CheckboxListTile(
            value: null,
            onChanged: (value) {},
            tristate: true,
            title: Text('Radio (Inactive)'),
          ),
        ],
      ),
    );
  }
}

class ColorContainer extends StatelessWidget {
  final String name;
  final Color color;
  final Color onColor;

  const ColorContainer({

    @required this.color,
    @required this.onColor,
    @required this.name,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: color,
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '$name\n${color}',
            style: TextStyle(color: onColor),
          ),
          Container(
            color: onColor,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('On$name\n${onColor}',
                      style: TextStyle(color: color)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextThemeDisplay extends StatelessWidget {
  final TextStyle ts;
  final String title;

  TextThemeDisplay({@required this.ts, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Text(
              '$title',
              style: ts,
            ),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Text(
              '$title',
              style: ts,
            ),
          ),
          Text('Size: ${ts.fontSize}'),
          Text('Famliy: ${ts.fontFamily}'),
          Text('Weight: ${ts.fontWeight}'),
          Text('Color: ${ts.color}'),
          Text('letterSpacing: ${ts.letterSpacing}'),
          Divider(),
        ],
      ),
    );
  }
}
