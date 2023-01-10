import "package:flutter/material.dart";

Container fieldBtn(
  BuildContext context,
  String title,
  Function onTap,
  IconData icon,
) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.black.withOpacity(0.5)))),
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black.withOpacity(0.1);
          }
          return Colors.white.withOpacity(0.2);
        }),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                TextStyle(color: Colors.black.withOpacity(0.9), fontSize: 16),
          ),
          Icon(
            icon,
            color: Colors.black,
          )
        ],
      ),
    ),
  );
}
