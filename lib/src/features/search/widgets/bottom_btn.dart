import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  const BottomBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blue)))),
        child: const Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
