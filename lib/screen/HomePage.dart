import 'package:carousel_slider/carousel_slider.dart';
import 'package:echessapp/Widgets/repeated_widgets.dart';
import 'package:echessapp/screen/Coures%20Screen/CourseList.dart';
import 'package:echessapp/screen/ProfileScreens/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../root.dart';
import 'champions Screen/Champion_detail.dart';
import 'champions Screen/Champion_list_screen.dart';
import '../Utils/constrant.dart';
import 'Puzzles Screens/Level_screen.dart';


class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  //final  cu = FirebaseAuth.instance.currentUser!;
  var currentIndex=0;
  var titleOfScreen='titleofhome';
  
  @override
  void setState(VoidCallback fn) {
    //implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    //implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(titleOfScreen.tr),
      centerTitle: true,
      //backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        iconSize: 30,
        splashRadius: 20,splashColor: PrimaryColor.withOpacity(.2),
        onPressed: () async{
           SharedPreferences pref = await SharedPreferences.getInstance();
             if (tm.thememod == ThemeMode.light) {
                tm.toggleTheme(true);
                pref.setBool("isdarkmode", true);
                isdarkmode=true;
              }else {
                tm.toggleTheme(false);
                pref.setBool("isdarkmode", false);
                isdarkmode=false;
              }
               setState(() {
                
               });
        },
        icon: Icon(
          tm.thememod == ThemeMode.light? LineAwesomeIcons.sun:LineAwesomeIcons.moon,
          color: PrimaryColor,
          )
      ),
      actions: [
        IconButton(
          iconSize: 40,
          splashColor: PrimaryColor.withOpacity(.5),
          splashRadius: 25,
          onPressed: () => Get..to(()=> ProfilePage()),
          //onPressed: ()  => Get..to(()=> const ProfileScreen()),
          
          icon:  CircleAvatar(
            radius: 30,
            backgroundImage: 
            AssetImage("assets/images/pro.jpeg")
             //NetworkImage(usersinfo['pictureurl']!)
               //),
             ),
          ),
    
        
        SizedBox(width: 10,)
        //)
      ],
    ),
      body:currentIndex == 0 ?  Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              //TODO:CARUOSEL SLIDER SECTION 
              //START
              Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: PrimaryColor,
                      blurRadius: 6,
                      offset: Offset(0,3)
                      ),],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/chess01.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: PrimaryColor,
                      blurRadius: 6,
                      offset: Offset(0,3)
                      ),],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image:AssetImage("assets/images/chess02.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: PrimaryColor,
                      blurRadius: 6,
                      offset: Offset(0,3)
                      ),],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/chess03.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],    
            ),
              ),
              //eEND OF THE CARUOSAL WIDGETS
              Space(spaceH: 15,),
              //THE BODY OF HOME PAGE SCREEN
              //CHAMPION LIST
              Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text("titleofchamp".tr,style: const TextStyle(fontSize: 22,),),
                  GestureDetector(
                    onTap: () {
                     setState(() {
                       currentIndex = 2;
                     });
                    },
                    child: Text(
                      "seeMore".tr,
                      style:const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                         ),
                        ),
                      ),
                    ],
                  ),
                 ),
                 Divider(thickness: 1.2,indent: 13,endIndent: 100,height: 0,color: isdarkmode ? Colors.white.withOpacity(.6) : Colors.black.withOpacity(.6)),
                 Space(spaceH: 15,),
                 Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                           height: gHeight/6,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              cacheExtent: 500,
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                             itemCount: 9,
                             itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(()=> DetailChampion(
                                    title: WorldChampionList[index].nameChampion,
                                    image: WorldChampionList[index].images![1],
                                    wct: WorldChampionList[index].wct,
                                    description: WorldChampionList[index].decription,
                                    text1: WorldChampionList[index].text1,
                                    text2: WorldChampionList[index].text2,
                                    link: WorldChampionList[index].link,
                                    ));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15,right: 15,bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Center(
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundColor: PrimaryColor.withOpacity(.7),
                                              child: CircleAvatar(
                                                radius: 35,
                                               backgroundImage:AssetImage(WorldChampionList[index].images![0],),
                                                ),
                                            ),
                                          ),
                                          Space(spaceW: 5,),
                                        ],
                                      ),
                                      Space(spaceH: 5,),
                                      Text(WorldChampionList[index].nameChampion.tr,style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                ),
                              );
                             },
                             ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  //END OF CHAMPION SECTION
                  Space(spaceH: 10,),
                  //START OF COURSE SECTION
                  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("titleofcourse".tr,style: TextStyle(fontSize: 22,),),
                    ],
                  ),
                 ),
                 Divider(thickness: 1.2,indent: 13,endIndent: 100,height: 0,color: isdarkmode ? Colors.white.withOpacity(.6) : Colors.black.withOpacity(.6)),
                 Space(spaceH: 15,),
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  //color: Colors.grey,
                  width: gWidth,
                  height: gHeight/8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() { currentIndex=1;});
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: PrimaryColor,width: 1.4)),
                      child: Column(
                         children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage("assets/images/chess/chess.jpg",),
                                fit: BoxFit.cover,
                                height: gHeight/8.75,
                                width: 125,
                                ),
                                Space(spaceW: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("BeginLearning".tr,style: TextStyle(fontSize: 20),),
                                    Space(spaceH: 5,),
                                    Text("StartLear".tr,style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                                  ],
                                ),
                                Space(spaceW: 40,),
                                IconButton(
                                  onPressed: () {
                                    setState(() {currentIndex=1;});
                                  }, 
                                  icon:Icon(
                                    iskurdish == true ? LineAwesomeIcons.arrow_left :LineAwesomeIcons.arrow_right,
                                    size: 28,
                                    )
                                  )
                            ],
                          ),
                         ],
                      ),
                    ),
                  ),
                 ),
                 
                 ],
            ),
        ),
      ) : 
      currentIndex == 1 ? CourseList() :
      currentIndex == 2 ? const ChampionScreen():
      currentIndex == 3 ? LevelScreen():
               Container(
                  child: Text("Hello"),
                ),


      //TODO: CUSTOM NAVIGATION BAR FOR SCROLLING PAGES 
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
        height: gWidth*.155,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0,10),
            )
          ],
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.symmetric(horizontal: gWidth*.024),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            //index = [0,1,2,3]
            onTap: () {
              //UPDATING THE VARIABLES
              setState(() {
                currentIndex = index;
                titleOfScreen=ListOfTitleScreen[index];
                HapticFeedback.lightImpact();
              });
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Stack(
              children: [
                //FOR ADDING COLOR FOR THE SELECTED ICON IN NAVIGATION BAR
                //START
                SizedBox(
                  width: gWidth*.2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? gWidth*0.12 : 0,
                      width: index == currentIndex ? gWidth*0.2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex ? PrimaryColor.withOpacity(.2) : Colors.transparent, 
                        borderRadius: BorderRadius.circular(20),
                      ),
                      ),
                  ),
                ),
                //END
                
                Container(
                  width: gWidth*.2125,
                  alignment: Alignment.center,
                  child: Icon(
                    ListOfIcon[index],
                    size: gWidth*.076,
                    color: index == currentIndex ? PrimaryColor : null,
                  ),
                )
              ],
            ),
          ),
          ),
      ),
    );
  }
}

//LIST OF ICONS FOR NAVIGATION BAR
List<IconData> ListOfIcon =[
  LineAwesomeIcons.home,
  LineAwesomeIcons.book,
  LineAwesomeIcons.trophy,
  LineAwesomeIcons.puzzle_piece,
];

//LIST OF TITLE PAGE FOR SCREENS
List ListOfTitleScreen=[
  "titleofhome",
  "titleofcourse",//coursePage
  "titleofchamp",//champ
  "titleofpuzzle",//puzzle
];




//
class Place {
  Place([this.title = '', this.description = '', this.image='',     this.value=0.0]);
  String title;
  String description;
  String image;
  double value;
}

