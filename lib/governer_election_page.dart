import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:governer_election_flutter/colors.dart';
import 'package:governer_election_flutter/fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GovernerElectionPage extends StatefulWidget {
  const GovernerElectionPage({super.key});

  @override
  State<GovernerElectionPage> createState() => _GovernerElectionPageState();
}

class _GovernerElectionPageState extends State<GovernerElectionPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(
                () {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                },
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .38
                      : displayWidth * .26,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .36 : 0,
                    decoration: BoxDecoration(
                        color: index == currentIndex
                            ? primaryColor
                            : secondaryColor,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .36
                      : displayWidth * .20,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfString[index]}'
                                  : '',
                              style: GoogleFonts.inter(
                                color: white,
                                fontWeight: medium,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex ? white : primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back !",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: semibold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Muhammad Lazuardi Adinegara",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: regular,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset('assets/jpg/img_profile_picture.jpg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _mainElectionCard(context),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: grey,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _recentElectionReports(),
              const SizedBox(
                height: 16,
              ),
              _electionLocations(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _electionLocations() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Election Locations",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: semibold,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                "See all",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: regular,
                  color: grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 240,
                height: 102,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/jpg/goverment_logo1.jpg'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Bojonegoro City Goverment",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: white,
                          ),
                          child: Text(
                            "Offline",
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: regular,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Election of Kange Yune Bojonegoro 2024 - 2029",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: regular,
                        color: white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "16 June 2024",
                          style: GoogleFonts.inter(fontSize: 10, color: white),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: white,
                          ),
                          child: Text(
                            "Election Day",
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: regular,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 240,
                height: 102,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/jpg/goverment_logo1.jpg'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Bojonegoro City Goverment",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: white,
                          ),
                          child: Text(
                            "Offline",
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: regular,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Election of Kange Yune Bojonegoro 2024 - 2029",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: regular,
                        color: white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "16 June 2024",
                          style: GoogleFonts.inter(fontSize: 10, color: white),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: white,
                          ),
                          child: Text(
                            "Election Day",
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: regular,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _recentElectionReports() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "Recent Election Reports",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: semibold,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                "See all",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: regular,
                  color: grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 240,
                height: 102,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child:
                              Image.asset('assets/jpg/img_profile_picture.jpg'),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            "Muhammad Naufal Gusti Indrayanto",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: regular,
                              color: white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(100)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/jpg/goverment_logo1.jpg'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Elected as Regent of Tuban 2024 - 2029",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Announced on December 20, 2023",
                      style: GoogleFonts.inter(
                        fontSize: 8,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 240,
                height: 102,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child:
                              Image.asset('assets/jpg/img_profile_picture.jpg'),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            "Muhammad Naufal Gusti Indrayanto",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: regular,
                              color: white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(100)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/jpg/goverment_logo1.jpg'),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Elected as Regent of Tuban 2024 - 2029",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Announced on December 20, 2023",
                      style: GoogleFonts.inter(
                        fontSize: 8,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _mainElectionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      width: double.infinity,
      height: 408,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/jpg/goverment_logo1.jpg'),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Bojonegoro City Government",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: regular,
                  color: white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: Text(
                  "Online",
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: regular,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: Text(
                  "Offline",
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: regular,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Regional Representative Council Elections 2024",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: medium,
              color: white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "10 June 2024 - 16 June 2024",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: medium,
                  color: grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: white,
                ),
                child: Text(
                  "Election Day",
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: regular,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/jpg/img_candidate1.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "45%",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: semibold,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Bambang Soesatyo",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: medium,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    width: 240,
                    animation: true,
                    lineHeight: 12.0,
                    animationDuration: 1000,
                    percent: 0.45,
                    barRadius: const Radius.circular(20),
                    progressColor: white,
                    backgroundColor: secondaryColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/jpg/img_candidate2.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "30%",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: semibold,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Megawati Soekarnoputri",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: medium,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    width: 240,
                    animation: true,
                    lineHeight: 12.0,
                    animationDuration: 1000,
                    percent: 0.3,
                    barRadius: const Radius.circular(20),
                    progressColor: white,
                    backgroundColor: secondaryColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/jpg/img_candidate3.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "25%",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: semibold,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Eko Nugroho",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: medium,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    width: 240,
                    animation: true,
                    lineHeight: 12.0,
                    animationDuration: 1000,
                    percent: 0.25,
                    barRadius: const Radius.circular(20),
                    progressColor: white,
                    backgroundColor: secondaryColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/jpg/img_other_candidate.jpg'),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "10%",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: semibold,
                          color: white,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "3 Other Candidates",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: medium,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LinearPercentIndicator(
                    width: 240,
                    animation: true,
                    lineHeight: 12.0,
                    animationDuration: 1000,
                    percent: 0.1,
                    barRadius: const Radius.circular(20),
                    progressColor: white,
                    backgroundColor: secondaryColor,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GovernerElectionPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 39,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  "Tap to Details",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: medium, color: primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> listOfString = [
  // 'Goverment Election',
  // 'Discover Candidates',
  // 'Profile'
  'Election',
  'Candidate',
  'Profile',
];
List<IconData> listOfIcons = [
  // SvgPicture.asset('assets/svg/ic_menu_polling.svg'),
  // SvgPicture.asset('assets/svg/ic_menu_candidates.svg'),
  // SvgPicture.asset('assets/svg/ic_menu_.svg'),
  Icons.graphic_eq_rounded,
  Icons.group_outlined,
  Icons.person_2_rounded,
];
