import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:governer_election_flutter/colors.dart';
import 'package:governer_election_flutter/fonts.dart';
import 'package:governer_election_flutter/governer_election_page.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/svg/slide1_onboarding.svg',
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Cast Your Vote Anytime, Anywhere with Governer Election App",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: semibold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 150,
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
            height: 24,
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Make Your Vote Heard in Every Election",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: semibold,
                      color: white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Text(
                    " Gocerner is the new standard in election technology, providing citizens with a safe, reliable, and easy-to-use platform for casting their ballots.",
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: regular, color: white),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
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
                      height: 43,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: bold,
                              color: primaryColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
