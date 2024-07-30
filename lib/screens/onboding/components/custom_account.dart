import 'package:flutter/material.dart';

import 'package:rive_animation/screens/onboding/components/account_form.dart';

final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

Future<Object?> customAccountDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Connected Accounts",
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
            position: tween.animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child);
      },
      pageBuilder: (context, _, __) => Center(



          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF3AADAA),
              title: const Text('Linked Accounts', style: TextStyle(color: Colors.white)),
            ),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    // Handle item tap
                    print('Tapped item ${items[index]}');
                  },
                );
              },
            ),
          )





            // child: Container(
            //   // height: 520,
            //   margin: const EdgeInsets.symmetric(horizontal: 16),
            //   padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            //   decoration: BoxDecoration(
            //       color: Colors.white.withOpacity(0.95),
            //       borderRadius: const BorderRadius.all(Radius.circular(40))),
            //   child: const Scaffold(
            //     backgroundColor: Colors.transparent,
            //     resizeToAvoidBottomInset:
            //         false, // avoid overflow error when keyboard shows up
            //     body: Stack(
            //       clipBehavior: Clip.none,
            //       children: [
            //         Column(children: [
            //           Text(
            //             "Accounts",
            //             style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
            //           ),
            //           AccountsForm(),
            //         ]),
            //       ],
            //     ),
            //   ),
            // ),
          )).then(onClosed);
}
