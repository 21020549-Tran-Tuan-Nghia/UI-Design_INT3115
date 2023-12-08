import 'package:flutter/material.dart';
import 'package:viet_chronicle/routes/routes.dart';
import 'package:viet_chronicle/utils/global_data.dart';
import 'package:viet_chronicle/utils/styles.dart';
import 'package:viet_chronicle/views/widgets/appbar/vc_appbar.dart';
import 'package:viet_chronicle/views/widgets/button/controller/vc_button_controller.dart';
import 'package:viet_chronicle/views/widgets/button/vc_button.dart';
import 'package:viet_chronicle/views/widgets/profile_icon/vc_profile_icon.dart';

class ProfileView extends StatelessWidget {
  final VCButtonController btLogoutController = VCButtonController();
  final currentEXP = 250;
  final maximumEXP = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: VCAppBar(
        titleColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        backButtonColor: "white",
        showActionIcon: true,
        actionWidget: Image.asset(
          'assets/images/edit_icon_white.png',
          width: 32 * viewportRatio,
          height: 32 * viewportRatio,
        ),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250 * viewportRatio,
              decoration: const BoxDecoration(color: Color(0xFF43B488)),
              child: Center(
                child:
                    // Profile Picture
                    Image.network(
                  'https://s3-alpha-sig.figma.com/img/a5f2/77fd/be1ab77b1d1279de3e300c8ab44cee36?Expires=1702857600&Signature=D8xK72kuKr-gM-O~vy1eEI-e-ydTYqaaTsDDGHjc6Gkgo0uF6vfmuX~ahYRiBVzEcKag5UOpDrJ38qD7vnkIMOzg~r2SQuzAyZUEzdxM7DUj332VKAgHSOCBySyDwCtqGD7iTD5IW2OX67pHXCZMQSdaPXJvq~fmmF2NP1xPljO~v8G3JpKodmXdi~navNiz5zmjO5~NwIpHAKwvSCJMNrITaBfbmFnni260id~1x2P0NXzvgE8P~TWLvpokuowne25QgkyDu7khS2u515X--L8IY0BSC-j6Ut-J4Kd8VK2ISPrmQHXKtYHOX4vFMBcUGhSesREmMWDlXbdFbpPnew__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                  width: 250 * viewportRatio, // Cover the entire width
                  height: 250 * viewportRatio, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
              width: MediaQuery.of(context).size.width,
              height: 122 * viewportRatio,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20 * viewportRatio,
                    ),
                    child: Text(
                      GlobalData.instance.user.username, //TODO: Full Name
                      style: HeadingStyle(newColor: ColorStyles.darkGray),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 52 * viewportRatio,
                    ),
                    child: Text(
                      "dangcapnhat", //TODO: Username
                      style: SubHeadingStyle(newColor: ColorStyles.darkGray),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 264 * viewportRatio,
                      top: 24 * viewportRatio,
                    ),
                    child: Container(
                      width: 48 * viewportRatio,
                      height: 48 * viewportRatio,
                      decoration: ShapeDecoration(
                        color: ColorStyles.lotusPink,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8 * viewportRatio),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${GlobalData.instance.getUserLevel()}",
                          style: HeadingStyle(newColor: ColorStyles.snowWhite),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 84 * viewportRatio),
                    child: SizedBox(
                      width: 312 * viewportRatio,
                      child: LinearProgressIndicator(
                        minHeight: 16 * viewportRatio,
                        value: GlobalData.instance.user.exp /
                            ((GlobalData.instance.getUserLevel() + 1) * 1000),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          ColorStyles.lotusPink,
                        ),
                        backgroundColor: ColorStyles.semiLightGray,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2 * viewportRatio,
              decoration: BoxDecoration(
                color: ColorStyles.semiDarkGray,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
              width: MediaQuery.of(context).size.width,
              height: 141 * viewportRatio,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 20 * viewportRatio,
                    ),
                    child: Text(
                      "Thống kê",
                      style: HeadingStyle(newColor: ColorStyles.darkGray),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 58.0 * viewportRatio),
                    child: Row(
                      children: [
                        Container(
                          width: 150 * viewportRatio,
                          height: 59 * viewportRatio,
                          decoration: BoxDecoration(
                            color: ColorStyles.snowWhite,
                            border: Border.all(
                              color: ColorStyles.gray,
                              width: 2 * viewportRatio,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                            borderRadius:
                                BorderRadius.circular(ShapeStyles.cornerRadius),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(10.0 * viewportRatio),
                                child: Image.asset(
                                  "assets/images/streak_on.png",
                                  height: 32.0 * viewportRatio,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0 * viewportRatio),
                                    child: Text(
                                        GlobalData.instance.user.streak
                                            .toString(),
                                        style: HeadingStyle(
                                                newColor:
                                                    ColorStyles.semiDarkGray)
                                            .copyWith(
                                                fontSize: 16.0 * viewportRatio),
                                        textAlign: TextAlign.left),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 6.0 * viewportRatio),
                                    child: Text(
                                      "Ngày streak",
                                      style: SubHeadingStyle(
                                          newColor: ColorStyles.mediumGray),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 11.0 * viewportRatio,
                        ),
                        Container(
                          width: 150 * viewportRatio,
                          height: 59 * viewportRatio,
                          decoration: BoxDecoration(
                            color: ColorStyles.snowWhite,
                            border: Border.all(
                              color: ColorStyles.gray,
                              width: 2 * viewportRatio,
                              strokeAlign: BorderSide.strokeAlignInside,
                            ),
                            borderRadius:
                                BorderRadius.circular(ShapeStyles.cornerRadius),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(10.0 * viewportRatio),
                                child: Image.asset(
                                  "assets/images/exp_icon.png",
                                  height: 32.0 * viewportRatio,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0 * viewportRatio),
                                    child: Text(
                                        GlobalData.instance.user.exp.toString(),
                                        style: HeadingStyle(
                                                newColor:
                                                    ColorStyles.semiDarkGray)
                                            .copyWith(
                                                fontSize: 16.0 * viewportRatio),
                                        textAlign: TextAlign.left),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 6.0 * viewportRatio),
                                    child: Text(
                                      "Tổng KN",
                                      style: SubHeadingStyle(
                                          newColor: ColorStyles.mediumGray),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Container(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 24 * viewportRatio),
            //   width: MediaQuery.of(context).size.width,
            //   height: 141 * viewportRatio,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.only(
            //           top: 20 * viewportRatio,
            //         ),
            //         child: Text(
            //           "Thành tựu",
            //           style: HeadingStyle(newColor: ColorStyles.darkGray),
            //           textAlign: TextAlign.left,
            //         ),
            //       ),
            //       Container(
            //         width: 312 * viewportRatio,
            //         height: 120 * viewportRatio,
            //         decoration: BoxDecoration(
            //           color: ColorStyles.snowWhite,
            //           border: Border.all(
            //             color: ColorStyles.gray,
            //             width: 2 * viewportRatio,
            //             strokeAlign: BorderSide.strokeAlignInside,
            //           ),
            //           borderRadius:
            //               BorderRadius.circular(ShapeStyles.cornerRadius),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 2 * viewportRatio,
            //   decoration: BoxDecoration(
            //     color: ColorStyles.semiDarkGray,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20 * viewportRatio),
              child: VCButton.primaryPink(
                "Đăng xuất",
                () {
                  GlobalData.instance.saveSession("token", "");
                  Navigator.pushNamed(context, AppRoutes.loginView);
                },
                btLogoutController,
                locked: false,
              ),
            ),
          ],
        ),
      ),
    );
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
