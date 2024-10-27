// import 'package:flutter/material.dart';

// class CustomAnimatedSwitcher extends StatelessWidget {
//   const CustomAnimatedSwitcher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: Durations.medium1,
//       switchInCurve: Curves.easeInOut,
//       switchOutCurve: Curves.easeInOut,
//       transitionBuilder: (child, animation) {
//         final forward = child.key == Key(UserType.customer.name);

//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: Offset(forward ? -0.2 : 0.2, 0),
//             end: Offset(0, 0),
//           ).animate(animation),
//           child: FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );
//       },
//       child: showClient
//           ? Padding(
//               key: Key(UserType.customer.name),
//               padding: EdgeInsets.symmetric(horizontal: 25.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _Info(UserType.customer),
//                   _buttons(UserType.customer),
//                 ],
//               ),
//             )
//           : Padding(
//               key: Key(UserType.business.name),
//               padding: EdgeInsets.symmetric(horizontal: 25.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _Info(UserType.business),
//                   _buttons(UserType.business),
//                 ],
//               ),
//             ),
//     );
//   }
// }
