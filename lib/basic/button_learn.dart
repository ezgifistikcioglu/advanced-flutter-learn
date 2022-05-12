import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'TextButton',
              style: Theme.of(context).textTheme.headline5,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.pressed)
                        ? Colors.purple
                        : Colors.amber)),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit_sharp)),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.dark_mode),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton'),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.pink, shape: const StadiumBorder()
                //CircleBorder(), RoundedRectangleBorder()
                ),
          ),
          InkWell(
            onTap: () {},
            child: const Text('InkWell'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, right: 40, left: 40, top: 10),
              child: Text(
                'Place Bid',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
