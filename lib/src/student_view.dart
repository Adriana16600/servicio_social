import 'package:flutter/material.dart';

import 'hours_history.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre del alumno'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(),
                  ));
            },
            icon: Icon(
              Icons.history_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.get_app_rounded,
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          HugeButton(
            color: Theme.of(context).colorScheme.primary,
            icon: Icons.play_circle_outline_rounded,
            text: 'Empezar',
          ),
          HugeButton(
            color: Theme.of(context).colorScheme.error,
            icon: Icons.do_disturb_rounded,
            text: 'Terminar',
          ),
        ],
      )),
    );
  }
}

class HugeButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const HugeButton({
    Key key,
    @required this.color,
    @required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(1000),
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(1000)),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 200,
            ),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
