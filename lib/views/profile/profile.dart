import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Trang cá nhân'),
              backgroundColor: Color.fromARGB(255, 86, 205, 2),
            ),
            body: Center(
              // padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    // Profile Picture
                    Image.network(
                      'https://s3-alpha-sig.figma.com/img/a5f2/77fd/be1ab77b1d1279de3e300c8ab44cee36?Expires=1702857600&Signature=D8xK72kuKr-gM-O~vy1eEI-e-ydTYqaaTsDDGHjc6Gkgo0uF6vfmuX~ahYRiBVzEcKag5UOpDrJ38qD7vnkIMOzg~r2SQuzAyZUEzdxM7DUj332VKAgHSOCBySyDwCtqGD7iTD5IW2OX67pHXCZMQSdaPXJvq~fmmF2NP1xPljO~v8G3JpKodmXdi~navNiz5zmjO5~NwIpHAKwvSCJMNrITaBfbmFnni260id~1x2P0NXzvgE8P~TWLvpokuowne25QgkyDu7khS2u515X--L8IY0BSC-j6Ut-J4Kd8VK2ISPrmQHXKtYHOX4vFMBcUGhSesREmMWDlXbdFbpPnew__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                      width: double.infinity, // Cover the entire width
                      height: 250, // Adjust the height as needed
                      fit: BoxFit.cover,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.mapView);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, size: 40, color: Colors.white),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ]),
                  SizedBox(height: 16),

                  // Full Name
                  Text(
                    'Lương Sơn Bá',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Username
                  Text(
                    'anhsuplo87',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Horizontal Line
                  Divider(),

                  SizedBox(height: 16),

                  // Text "Thống kê"
                  Text(
                    'Thống kê',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )));
  }
}

// class UserProfile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Existing GestureDetector for the arrow
//           GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, AppRoutes.mapView);
//             },
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.arrow_back,
//                   size: 20,
//                   color: Color.fromARGB(255, 86, 205, 2),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),

//           // Profile Picture
//           CircleAvatar(
//             radius: 50,
//             backgroundImage:
//                 NetworkImage('https://example.com/profile_image.jpg'),
//           ),
//           SizedBox(height: 16),

//           // Full Name
//           Text(
//             'Lương Sơn Bá',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),

//           // Username
//           Text(
//             'anhsuplo87',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(height: 16),

//           // Horizontal Line
//           Divider(),

//           SizedBox(height: 16),

//           // Text "Thống kê"
//           Text(
//             'Thống kê',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MapViewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map View'),
//       ),
//       body: Center(
//         child: Text('Your Map View Content Goes Here'),
//       ),
//     );
//   }
// }

// class VideoViewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video View'),
//       ),
//       body: Center(
//         child: Text('Your Video View Content Goes Here'),
//       ),
//     );
//   }
// }
