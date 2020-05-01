import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Color(0xff656EE6),
      ),
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _controller = new PageController(
    initialPage: 0,
  );
  int _selectedIndex = 0;

  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 500,
                    child: PageView(
                        controller: _controller,
                        onPageChanged: (int index){
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        children: <Widget>[
                          Page(
                            imagePath: "assets/1.png",
                            heading: "Destination",
                            content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
                          ),
                          Page(
                            imagePath: "assets/2.png",
                            heading: "Ticket Booking",
                            content: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                          ),
                          Page(
                            imagePath: "assets/3.png",
                            heading: "Enjoy Your Holiday",
                            content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form",
                          ),

                        ],
                        
                      ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[0,1,2].map((index){
                      return Container(
                        margin: index == 3 ? EdgeInsets.all(0): EdgeInsets.only(right: 10),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: index == _selectedIndex ? Theme.of(context).primaryColor:Theme.of(context).primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    width: 180,
                    height: 65,
                    child: RaisedButton(
                      elevation: 2,
                      onPressed: (){
                        _controller.nextPage(duration: Duration(milliseconds:200), curve: Curves.easeIn);
                      },
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        _selectedIndex == 2 ? "Get Started": "Next",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),
            ),
            Container(
              
              padding: const EdgeInsets.only(bottom: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "SKIP",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor.withOpacity(0.4)
                        ),
                      ),
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String content;

  Page({
    this.imagePath,
    this.heading,
    this.content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image(
            image: AssetImage(this.imagePath),
            width: 170,
          ),
          SizedBox(height: 40.0),
          Text(
            this.heading,
            style: GoogleFonts.poppins(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25.0
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            constraints: BoxConstraints(
              maxWidth: 500
            ),
            child: Text(
              this.content,
              textAlign: TextAlign.center,
              
              style: GoogleFonts.poppins(
                color: Color(0x4d040078),
                fontSize: 20,
                letterSpacing: 0.1,
                height: 2
                
              ),
            ),
            
          ),
         
        ],
      ),
    );
  }
}