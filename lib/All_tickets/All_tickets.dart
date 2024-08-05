// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:parchi_app/Widgets/searchbar.dart';
import 'package:parchi_app/constants/color_theme.dart';
import 'package:parchi_app/constants/sized_box.dart';
import 'package:parchi_app/constants/text_theme.dart';

class AllEventScreen extends StatefulWidget {
  const AllEventScreen({super.key});

  @override
  State<AllEventScreen> createState() => _AllEventScreenState();
}

class _AllEventScreenState extends State<AllEventScreen> {
  int _currentIndex = 1;
  final bool _isLoggedIn = true;
  int _selectedTabIndex = 0;

  @override

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return const BottomSheetContent();
  //     },
  //   );
  // }

  // void _navigateToDashboard() {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final String userId = userProvider.user?.userDetails.id ?? '';
  //   if (userId == "") {
  //     _showLoginDialog();
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return const HomeScreen();
  //         },
  //       ),
  //     );
  //   }
  // }

  // void _navigateToAllMajalis() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return const AllMajlisScreen();
  //       },
  //     ),
  //   );
  // }

  // void _navigateToSettings() {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   final String userId = userProvider.user?.userDetails.id ?? '';
  //   if (userId == "") {
  //     _showLoginDialog();
  //   } else {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return const SettingScreen();
  //         },
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const Tab(text: 'Active'),
    ];
    List<Widget> tabViews = [
      _buildAllMajalisTabView(context),
    ];

    tabs.add(const Tab(text: 'Non Active'));
    tabViews.add(_buildMyMajalisTabView(context));

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: parchiColorTheme().tracesofember1,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Events',
                      style: parchiTextTheme().heading3.copyWith(
                            fontWeight: FontWeight.w600,
                            color: parchiColorTheme().darkgreen,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        // if (userId == "") {
                        //   _showLoginDialog();
                        // } else {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) {
                        //         return const CreatMajlisScreen();
                        //       },
                        //     ),
                        //   );
                        // }
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: parchiColorTheme().richegreen,
                        size: 35,
                      ),
                    )
                  ],
                ),
                SizedBoxes.vertical15Px,
                Text(
                  'These are Events from across the United States.',
                  style: parchiTextTheme().heading7.copyWith(
                        fontWeight: FontWeight.w500,
                        color: parchiColorTheme().darkgreen,
                      ),
                ),
                SizedBoxes.vertical15Px,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSearchBar(
                      onChanged: (value) {
                        // if (_selectedTabIndex == 0) {
                        //   Provider.of<EventProvider>(context, listen: false)
                        //       .filterEvents(value);
                        // } else {
                        //   Provider.of<EventProvider>(context, listen: false)
                        //       .filterMyEvents(value);
                        // }
                      },
                    ),
                    // SizedBoxes.horizontalTiny,
                    // InkWell(
                    //   // onTap: () => _showBottomSheet(context),
                    //   child: Stack(
                    //     children: [
                    //       Container(
                    //         width: MediaQuery.of(context).size.width * 0.22,
                    //         height: 45,
                    //         decoration: BoxDecoration(
                    //           color: parchiColorTheme().richegreen,
                    //           shape: BoxShape.rectangle,
                    //           border: Border.all(
                    //               color: parchiColorTheme().richegreen,
                    //               width: 2),
                    //           borderRadius:
                    //               const BorderRadius.all(Radius.circular(8)),
                    //         ),
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 20, top: 8),
                    //           child: Text(
                    //             'Filters',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.w500,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       const Positioned(
                    //         top: 10,
                    //         left: 2,
                    //         child: Icon(
                    //           Icons.filter_list_alt,
                    //           size: 20,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
                SizedBoxes.vertical15Px,
                Container(
                  decoration: BoxDecoration(
                    color: parchiColorTheme().white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: parchiColorTheme().darkgreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    dividerColor: Colors.transparent,
                    labelColor: parchiColorTheme().white,
                    unselectedLabelColor: parchiColorTheme().darkgreen,
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (index) {
                      // setState(() {
                      //   _selectedTabIndex = index;
                      // });

                      // if (index == 1 && userId == "") {
                      //   _showLoginDialog();
                      // }
                    },
                    tabs: tabs,
                  ),
                ),
                SizedBoxes.vertical22Px,
                // Text(
                //  formattedDate,
                //   style: MajlisTextTheme().heading1.copyWith(fontWeight: FontWeight.w900, fontSize: 16, color: MajlisColorTheme().darkred, fontFamily: 'Satoshi'),
                // ),
                Expanded(
                  child: TabBarView(
                    children: tabViews,
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: _isLoggedIn
          //     ? BottomNavigationBarWidget(
          //         currentIndex: _currentIndex,
          //         onTap: (index) {
          //           setState(() {
          //             _currentIndex = index;
          //           });

          //           switch (index) {
          //             case 0:
          //               _navigateToDashboard();
          //               break;
          //             case 1:
          //               _navigateToAllMajalis();
          //               break;
          //             case 2:
          //               _navigateToSettings();
          //               break;
          //           }
          //         },
          //         navigateToDashboard: _navigateToDashboard,
          //         navigateToAllMajalis: _navigateToAllMajalis,
          //         navigateToSettings: _navigateToSettings,
        )
        // : null,
        );
  }

  Widget _buildAllMajalisTabView(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 10),
        // child: Consumer<EventProvider>(
        // builder: (context, eventProvider, child) {
        //   final events = eventProvider.events;
        //   if (events == null) {
        //     return const Center(child: CircularProgressIndicator());
        //   }
        child: const SingleChildScrollView(
            child: Column(children: [
          // children: events.map((event) {
          // return EventCard(
          //   name: event.majlisName,
          //   date: event.date,
          //   title: event.address,
          //   time: event.time,
          //   speaker: event.maulanaName,
          //   language: event.language,
          //   gender: event.gender,
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return MajlisViewScreen(
          //             flyerLink: event.flyerLink ?? '',
          //             eventid: event.id ?? '',
          //             date: event.date,
          //             time: event.time,
          //             language: event.language,
          //             gender: event.gender,
          //             maulanaName: event.maulanaName,
          //             address: event.address,
          //           );
          //         },
          //       ),
          //     );
          //   },
          // );
        ])));
  }

  Widget _buildMyMajalisTabView(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 10),
        // child: Consumer<EventProvider>(
        //   builder: (context, eventProvider, child) {
        //     final myEvents = eventProvider.filteredMyEvents;
        //     if (myEvents == null) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        child: SingleChildScrollView(
            child: Column(children: [
          // children: myEvents.map((event) {
          // return MyMajlisEventCard(
          //   status: event.status,
          //   name: event.majlisName,
          //   date: event.date,
          //   title: event.address,
          //   time: event.time,
          //   speaker: event.maulanaName,
          //   language: event.language,
          //   gender: event.gender,
          //   onPressed: () {
          // if (event.status == 'Rejected') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ResubmitMajlis(
          //       rejectionReason: event.rejectionReason ?? '',
          //       status: event.status,
          //       flyerLink: event.flyerLink ?? '',
          //       majlisName: event.majlisName,
          //       eventid: event.id ?? '',
          //       date: event.date,
          //       time: event.time,
          //       language: event.language,
          //       gender: event.gender,
          //       maulanaName: event.maulanaName,
          //       address: event.address,
          //     ),
          //   ),
          // );
          // } else {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => EditMajlis(
          //       flyerLink: event.flyerLink ?? '',
          //       majlisName: event.majlisName,
          //       eventid: event.id ?? '',
          //       date: event.date,
          //       time: event.time,
          //       language: event.language,
          //       gender: event.gender,
          //       maulanaName: event.maulanaName,
          //       address: event.address,
          //     ),
          //   ),
          // );
        ])));
  }
}
   
    

// class BottomSheetContent extends StatelessWidget {
//   const BottomSheetContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const FilterBottomSheet();
//   }
// }
