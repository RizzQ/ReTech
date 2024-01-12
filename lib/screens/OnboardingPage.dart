import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/LoginPage.dart';
import 'package:retech/screens/RegisterPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreeen extends StatefulWidget {
  OnboardingScreeen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {
  final controller = PageController();
  bool isLastPage = false;
  int pageNum = 0;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: (){}, child: Text("Lewati",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(color: Colors.white, urlImage: 'assets/img/Onboard1.png', titleUp: 'Lewati', title: 'Selamat Datang!', subtitle: 'ReTech adalah sebuah platform yang menyediakan jasa servis untuk alat-alat elektronik rumah tangga.'),
            buildPage(color: Colors.white, urlImage: 'assets/img/Onboard2.png', titleUp: 'Lewati', title: 'Teknisi Terpercaya', subtitle: 'Platform kami hanya menyediakan teknisi yang andal dan tepercaya yang dengan senang hati akan memperbaiki peralatan Anda kapan pun Anda mau'),
            buildPage(color: Colors.white, urlImage: 'assets/img/Onboard3.png', titleUp: 'Lewati', title: 'Harga Terjangkau', subtitle: 'Platform kami menyediakan harga-harga yang terjangkau dan ramah di dompet, sekaligus memberikan jaminan kualitas yang terbaik dan servis yang dapat dipercaya'),
          ],
        ),
      ),
      bottomSheet: 
      Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text(
                '            ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
            ),),
              onPressed: () {}, 
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.white,
                  activeDotColor: Color.fromARGB(255, 194, 75, 57)
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index, 
                  duration: const Duration(milliseconds: 500), 
                  curve: Curves.easeIn),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text(
                  'Lanjut', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
              ),),
                onPressed: () async {
                  Navigator.of(context). pushReplacement(
                    MaterialPageRoute(builder: ((context) => LoginPage()))
                  );
                }, 
              ),
            ),
          ],
        ),
      )
      
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String titleUp,
    required String title,
    required String subtitle,
  }) => Container(
    color: color,
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 50.0,left: 50.0,right: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.right,
                titleUp,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Image.asset(
            urlImage,
            fit: BoxFit.contain,
            width: double.infinity,
            ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(),
            child: Text(
            textAlign: TextAlign.center,
              subtitle,
              style: const TextStyle(color: Colors.grey,fontSize: 18),
            ),
          )
        ]),
    ),
  );
}