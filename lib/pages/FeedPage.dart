import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui/model/story_model.dart';
import 'package:instagram_ui/pages/post_model.dart';
class FeedPage extends StatefulWidget {
  static final String id = "FeedPage";
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jasmin"),
    Story("assets/images/user_2.jpeg", "Eldor"),
    Story("assets/images/user_3.jpeg", "Dina"),
    Story("assets/images/user_1.jpeg", "Leyla"),
    Story("assets/images/user_2.jpeg", "Farrux"),
    Story("assets/images/user_3.jpeg", "Ezoz"),
  ];

  List<Post> _posts = [
    Post(
      userName:"Jasmin",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/feed_3.jpeg",
      caption: "Consequator nihil aliquid omnis consequator",
    ),
    Post(
      userName:"Farrux",
      userImage: "assets/images/user_2.jpeg",
      postImage: "assets/images/feed_2.jpeg",
      caption: "Consequator nihil aliquid omnis consequator",
    ),
    Post(
      userName:"Dina",
      userImage: "assets/images/user_3.jpeg",
      postImage: "assets/images/feed_1.jpeg",
      caption: "Consequator nihil aliquid omnis consequator",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              //#Stories Watch all
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories",style: TextStyle(color: Colors.grey,fontSize: 14),),
                    Text("Watch All",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],
                ),
              ),
              //#Story List
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  clipBehavior: Clip.none,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true ,
                  children: _stories.map((story){
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),
              //#Post
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i ){
                    return _itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name),
      ],
    );
  }

    Widget _itemOfPost(Post post){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName),
                  ],
                ),
                IconButton(
                  icon: Icon(SimpleLineIcons.options),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.heart_o),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.comment_o),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.send_o),
                  ),


                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(FontAwesome.bookmark_o),
              ),
            ],
          ),
          //#Tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:"Liked By ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:" Sigmund ",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:" Yessenia",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:" Dayana",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),TextSpan(
                    text:" Edik",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:" and ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:"1268 others",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  )
                ]
              ),
            ),

          ),
          //#Caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                    TextSpan(
                      text: "${post.caption}",
                      style: TextStyle(color: Colors.black),
                    )
                ]
              ),
            ),
          ),
          //#post Date
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),

          ),
        ],
      ),
    );
    }

}
