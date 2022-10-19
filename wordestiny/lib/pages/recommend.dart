import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wordestiny/generated/r.dart';
import 'package:wordestiny/global.dart';
import 'package:wordestiny/pages/about/about_page.dart';
import 'package:wordestiny/pages/collection_page.dart';
import 'package:wordestiny/pages/history_page.dart';
import '../pages/article_page.dart';
import 'package:wordestiny/pages/user.dart';
import 'package:wordestiny/pages/word_bank.dart';
import 'package:wordestiny/styles/custom_colors.dart';
import 'article_page.dart';
import 'package:dio/dio.dart';

String text = "";
Response? res;
var dio = Dio();
TextEditingController textController = new TextEditingController();
List<Map> recommendWords = Global.wordList; //单词本里的单词，根据这个刷新推荐
var leastWords = 0;
var maxWords = 0;

class RecommendPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RecommendPage());
  }

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  RangeValues _rangeValues = RangeValues(0, 1);

  _myButton(var levelName, var level) {
    //文章难度筛选按钮
    return MaterialButton(
      focusColor: CustomColors.vi,
      color: Color.fromRGBO(239, 240, 240, 1),
      textColor: CustomColors.vi,
      elevation: 0,
      child: Text(levelName),
      shape: StadiumBorder(),
      highlightColor: CustomColors.vi,
      onPressed: () {
        print(level);
        // _postFilter(level, 123, 456);
      },
    );
  }

  _myDialog() {
    //底部筛选栏
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '文章难度',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _myButton('初级', 1),
                      _myButton('中级', 2),
                      _myButton('高级', 3),
                      _myButton('进阶', 4)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '文章长度筛选',
                    style: TextStyle(fontSize: 16, color: CustomColors.normal),
                  ),
                  SizedBox(height: 30),
                  SliderTheme(
                    //文章长度滑动条
                    data: SliderTheme.of(context).copyWith(
                        valueIndicatorColor: Color.fromRGBO(0, 0, 0, 0),
                        valueIndicatorTextStyle:
                            TextStyle(color: CustomColors.vi),
                        showValueIndicator: ShowValueIndicator.always,
                        trackHeight: 6),
                    child: RangeSlider(
                      values: _rangeValues,
                      labels: RangeLabels(_rangeValues.start.toInt().toString(),
                          _rangeValues.end.toInt().toString()),
                      activeColor: CustomColors.vi,
                      inactiveColor: CustomColors.deepGrey,
                      min: 0,
                      max: 2000,
                      divisions: 100,
                      onChanged: (v) {
                        setState(() {
                          _rangeValues = v;
                        });
                      },
                      onChangeEnd: (v) {
                        print(_rangeValues.start.toInt());
                        leastWords = _rangeValues.start.toInt();
                        maxWords = _rangeValues.end.toInt();
                        print(_rangeValues.end.toInt());
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  _myDrawer() {
    return Builder(
        builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              iconSize: 24,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //去掉阴影
          leading: _myDrawer(),
          //顶部搜索栏
          title: Container(
            decoration: new BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(118, 118, 128, 0.12), width: 1.0),
                color: Color.fromRGBO(118, 118, 128, 0.12),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            alignment: Alignment.center,
            height: 38,
            // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Theme(
              data: new ThemeData(
                  primaryColor: Color.fromRGBO(118, 118, 128, 0.12)),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(118, 118, 128, 0.12))),
                    prefixIcon: IconButton(
                        onPressed: () => elasticSearch(),
                        icon: Icon(Icons.search)),
                    hintText: "搜索文章或单词",
                    focusColor: Color.fromRGBO(118, 118, 128, 0.12),
                    isDense: true),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset(R.iconSort),
              iconSize: 24,
              onPressed: _myDialog,
            )
          ],
          backgroundColor: Colors.white,
          bottom: TabBar(
              indicatorColor: CustomColors.vi,
              unselectedLabelColor: Color.fromRGBO(130, 130, 130, 1),
              labelColor: CustomColors.vi,
              indicatorSize: TabBarIndicatorSize.label,
              // isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: (Text(
                    '推荐',
                    style: TextStyle(),
                  )),
                ),
                Tab(
                  child: (Text(
                    '上次浏览',
                    softWrap: false,
                    //overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  )),
                ),
                Tab(
                  child: (Text(
                    '科技',
                    style: TextStyle(),
                  )),
                ),
                Tab(
                  child: (Text('军事')),
                ),
                // IconButton(icon: Icon(Icons.add), onPressed: (){}),
                // IconButton(icon: Icon(Icons.sort), onPressed: (){}),
              ]),
        ),
        drawer: Drawer(
            child:
                ListView(padding: const EdgeInsets.only(), children: <Widget>[
          UserAccountsDrawerHeader(
//      margin: EdgeInsets.zero,
            accountName: Text(
              "词遇之子",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white70,
              ),
            ),
            decoration: BoxDecoration(color: CustomColors.vi),
            currentAccountPicture: new ClipOval(
              child: Image.network(
                  "https://wx1.sinaimg.cn/large/006YUWj7ly8ft43m7xfr8j30v90v9di9.jpg"),
            ),
            accountEmail: null,
            //onDetailsPressed: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: new Text(
              '阅读记录',
              style: TextStyle(fontSize: 22, color: CustomColors.normal),
            ),
            onTap: () => {
              Navigator.push(context, CollectionPage.routeHistory()),
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: new Text(
              '我的收藏',
              style: TextStyle(fontSize: 22, color: CustomColors.normal),
            ),
            onTap: () => {
              Navigator.push(context, CollectionPage.route()),
            },
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: new Text(
              '生词本',
              style: TextStyle(fontSize: 22, color: CustomColors.normal),
            ),
            onTap: () => {
              Navigator.push(context, WordBankPage.route()),
            },
          ),
//          ListTile(
//            leading: Icon(Icons.settings),
//            title: new Text(
//              '设置',
//              style: TextStyle(fontSize: 22, color: CustomColors.normal),
//            ),
//            onTap: () => {
//              Navigator.push(context, SettingPage.route()),
//            },
//          ),
          ListTile(
            leading: Icon(Icons.info),
            title: new Text(
              '关于',
              style: TextStyle(fontSize: 22, color: CustomColors.normal),
            ),
            onTap: () => {
              Navigator.push(context, AboutPage.route()),
            },
          ),
        ])),
        body: TabBarView(children: <Widget>[
          //推荐页文章
          Article(),
          //上次浏览文章
          Article(),
          //科技文章
          Article(),
          //军事文章
          Article(),
        ]),
      ),
    );
  }

  Future elasticSearch() async {
    String keywords = textController.text;
    String url = 'http://ghttlab.com:8080/v1/articles?keywords=$keywords';
    res = await dio.get(url);
    List result = res!.data;
    listData = result;
    setState(() {});
  }
}

//顶部导航栏

//首页文章类
class Article extends StatefulWidget {
  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  initState() {
    super.initState();
    generateRecommend();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          generateRecommend();
          await Future.delayed(Duration(milliseconds: 4000));
        },
        child: ListView.builder(
            //padding: EdgeInsets.fromLTRB(12,16,12,16),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              //padding: EdgeInsets.fromLTRB(12,16,12,16);
              return InkWell(
                  onTap: () {
                    print("tiaozhuan");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ArticlePage(
                            each_data:
                                new Map<String, String>.from(listData[index])),
                      ),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                      // height: 116,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 69,
                                  width: 215,
                                  child: Text(
                                    listData[index]["title"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      height: 1.15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 18,
                                  width: 215,
                                  child: Text(
                                    'author$index',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(0, 0, 0, 0.4)),
                                  ),
                                ),
                              ],
                            ),
                            flex: 215,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Container(
                                height: 84,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listData[index]["thumbnail"])))),
                            flex: 112,
                          )
                        ],
                      )));
            }),
      ),
    );
  }

  //String level,int least,int max 待添加参数
  Future generateRecommend() async {
    print(recommendWords);
    var l = recommendWords.length;
    List keywords = [];
    for (var i = 0; i < l; i++) {
      var result = recommendWords[i].keys.toString();
      result = result.substring(1, result.length - 1);
      keywords.add(result); //key是单词，value是熟练度
    }//将Map数组转化成String数组,并且去除外层括号
    print(keywords);
    String url = 'http://ghttlab.com:8080/v1/articles';
    res = await dio.get(url, queryParameters: {'keywords': keywords});
    setState(() {
      listData = res!.data;
    });
  }
}

//暂时存在的示例
List listData = [
  {
    "title": 'Hard Truths That Make Life Easier Once You Accept Them',
    "author": 'Needham Carter',
    "content":
        '''We all want our lives to be successful. But "success" looks different for everyone.
Maybe for you, success means thriving in your career and having financial freedom. For me, it looks like solid friendships and taking care of my mental health. For others, it might be having a happy family life.
Whatever your definition of success may be, they all ride on a few fundamental truths that are hard to accept. These truths go against what we've been told and the lies fed to us about how life works.
But the moment you accept these truths about life, everything becomes a whole lot easier.
Not everyone will like you.
A friend of mine was recently broken up with by his girlfriend. Even though he was heartbroken, he said there were things about her he didn't like. "She changed her personality based on who she was around," he explained.
The catch is, my friend's ex saw that as a good trait. According to my friend, his ex explained that her chameleon-like personality made the people around her happier; they liked her more because of it.
She sacrificed being her authentic self in exchange for people's acceptance. And while it might feel great when people enjoy being around you, it's impossible to have everyone like you.
So is it worth acting like someone you're not just to gain a few friends who may not even like the real you?
There will always be someone who is "more," so focus on your lane.
When you're trying to achieve a goal in life, you'll never succeed if you're constantly looking at what everyone else is doing. You'll always find someone who's more successful/pretty/outgoing.
The point is: focus on what's happening to you. Don't compare yourself to other people because all that will do is make you feel inadequate. Besides, if you're doing things in a way that's true to you, other people aren't your competition.
Lean in to what makes you unique, and let that be what gives you the confidence to keep going.
Your pain isn't unique.
James Baldwin once wrote, "You think your pain and your heartbreak are unprecedented in the history of the world, but then you read." Every heartbreak, obstacle, or painful experience has been felt by someone before.
And this isn't to make you feel like you're not special or that you're overreacting; it's to help you realize that you're not alone.
In a world filled with billions of people, nothing is more lonely than struggling in silence. At the very least, reach out to a friend or research your experience. You'll realize there are people out there who can help you through anything.
Learning to be alone is one of the hardest but most rewarding things you can do.
Ask yourself this question: when you come home from running errands and sit down in an empty apartment, what do you do? How do you feel?
Many people feel anxious. They don't want to be alone, nor do they know how to spend that time. Left alone with their thoughts, they feel more and more horrible about themselves because, the fact is, they don't like themselves.
And while it might seem unimportant to change things so you can learn to enjoy being alone, it's actually the best gift to give yourself. The person you'll spend the most time with in life is yourself.
You might as well enjoy your own company.
You're more likely to become stuck than become unstuck.
There are a lot of ingredients that go into becoming stuck. Complacency, comfort, laziness, disinterest, confusion, and fear, just to name a few. That's a lot of paths to a single destination.
But there's only one path towards becoming unstuck, and that's hard work. Change only comes to those who take the necessary steps to create that change. You can't wait around for someone to do it for you.
That's why it's much easier to become stuck in life and the reason why a lot of people are unhappy. In this case, you can either be part of the majority or be one of the people who beat the odds.
''',
    "thumbnail":
        'https://media-image1.baydn.com/c3a27a89d92ce6026b284f825f8405e1250c2d40e812b2c527d584da536251a5.png?x-oss-process=image/quality,Q_80 ',
  },
  {
    "title": 'Social Anxiety Conditioning Model For Mice',
    "author": 'Harrod Clive',
    "content":
        '''HANGZHOU, Aug. 9 (Xinhua) -- Chinese researchers have successfully developed a social anxiety disorder (SAD) conditioning model for mice, which are expected to become practical research aids for future SAD studies.

Researchers from Zhejiang University developed a four-stage standardized protocol to induce specific social fear in mice.

During the first stage, the researchers separated individual subject mice from their cage mates for five days. In the second stage, the subject mice freely explored their surrounding environments for 10 minutes, allowing them to gain a sense of safety in isolation.

During the third stage of conditioning, an unfamiliar mouse was introduced to each subject mouse's container. A mild foot shock was automatically delivered to a subject mouse each time it attempted to get close to a new mouse.

In the final stage of behavioral testing, the researchers performed a social preference-avoidance test on the mice in an open field container and a social interaction test in a three-chamber container to assess their social fear. The mice exhibited dramatic decreases in time spent in the social zone or chamber, less exploration, and lower approaching speeds in the two tests. They also exhibited a significant increase in stretching their bodies during exploration, a typical fear response.

When researchers replaced unfamiliar mice with new objects, the subject mice did not exhibit fear responses. The subject mice also did not show fear in open field tests or forced swimming tests.

The researchers said an ideal animal social fear conditioning model should demonstrate subjects' reduced social investigation of and fear responses to their conspecifics. Behavioral changes should not manifest in non-social areas.

They said that their mice conditioning model could be used for SAD studies. The research has been published in the journal Neuroscience Bulletin. Enditem''',
    "thumbnail":
        'https://media-image1.baydn.com/847a5657b69f4e1e20f64a760db5787ff871d036c8d0e03c71eb95f6de5c4d6a.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title": 'White Cane Safety Day',
    "author": 'Foucs Campbell ',
    "content":
        '''October 15, 1970 was declared International White Cane Safety Day for the first time by the President of the International Federation of the Blind. This date was adopted at the first quinquennial convention of the IFB, held in Colombo on October 4, 1969. The object of the exercise is to stimulate the general public to a better understanding of blindness and visual handicap, and to make people more aware of the white cane as a mobility aid.

　　Peguilly d'Herbemont was born on 25th June 1888 into an old French noble family of the same name. In her youth she led the conventional and protected existence, devoid of great activity, of a girl from a "good family", an existence reminiscent of the life of the aristocracy before the French Revolution. She never visited a public school, but was educated by German and English governesses and convent sisters. Her movements were restricted and were mainly confined to the family positions in Paris and Belgium, but she spent most of her time at the castle of Charmois not far from Verdun.

　　In the process of helping individual blind people across the road, Mademoiselle d'Herbemont was made aware by narrow scrapes which almost led to accidents, of the precarious situation of the visually impaired brought about by the steadily increasing traffic on the roads. She first spoke about measures to protect the blind against street hazards to her mother in 1930, but she was of the opinion that it was unfit for a lady of good society to create a public outcry and advised her to stick to the transcription of books, a popular pastime of ladies of rank at the time.

　　But the idea did not leave her. The urgent wish to encourage the integration of the blind into society by providing them with a means of moving about more freely without endangering others, and at the same time attracting the attention of passers-by ready to offer assistance, caused her to take the, unusual step of writing to the editor of the Paris daily "Echo de Paris" in which she suggested issuing the blind of the Paris region with white sticks similar to those used by the traffic police.

　　The editor took up the idea, published it in November 1930 and saw to it that the relevant authorities acted with atypical speed. Thus it was that the white cane received official backing, and on 7th February 1931.''',
    "thumbnail":
        'https://media-image1.baydn.com/ccaf46a0be27bea835c310573f2152ebfe5d878e91bb90d05b1ab6e2f2ffa4ff.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title": 'Bidding Astronauts Bon Voyage From Gobi Desert',
    "author": 'Yerkes Adams',
    "content":
        '''JIUQUAN, Oct. 4 (Xinhua) -- In 2003, college graduate Deng Xiaojun joined the Jiuquan Satellite Launch Center in northwest China's Gobi Desert.

With his job coded 212, he felt the excitement of sending China's first astronaut Yang Liwei into space.

Eighteen years later, Deng is code zero, tasked with the high-profile job of leading the countdown to ignition for the launch of the Shenzhou-12 crewed mission.

"Code zero is not a number, but a team," said Deng, noting the team has been sharing the responsibility and excitement of China's space missions for years.

As a home port for China's space exploration, the Jiuquan Satellite Launch Center has completed major launch missions, including 12 Shenzhou series spaceships, building the most reliable and safe spaceport for Chinese astronauts.

Deep in the Badain Jaran Desert in northwestern China, lights blaze at the vehicle assembly building throughout the night. Engineers are working around the clock to prepare for China's next space mission.

Zheng Yonghuang, the launch center's chief engineer, said a crewed space mission goes through more than 10 phases, involving hundreds of thousands of parts and components from entering the launch site to blast-off.

According to Zheng, staff members enter into preparation three months before every launch, testing and checking equipment and facilities. Even for parts as small as a fuse, how long is its service life? How long has it been in use? When should it be replaced? "We need to have every answer in mind."

"When people start to cheer a successful launch, it's time for us to learn lessons for further improvements," said Zheng.

Shi Chuangfeng is in charge of hoisting the rockets with cranes. "When hoisting a rocket, we need to align and connect dozens of bolts in one go. There are no shortcuts to take. The only thing you can do is keep practicing."

Shi has his own way of training himself: hooking a welding rod onto the crane and driving the crane to insert the rod into a beer bottle. Today, Shi and his colleagues can control the crane arm to insert a chopstick and pour wine, just like using their hands.''',
    "thumbnail":
        'https://media-image1.baydn.com/fab993d4009ebb570821a5cbfd39c0bc708923fc50e79e2d48642e54880be1d4.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title": 'Posture Impacts How You Perceive Your Food',
    "author": 'Tate Charles',
    "content":
        '''A new study published in the Journal of Consumer Research finds posture impacts taste perception, with food tasting better when you’re sitting down. Lead author Dipayan Biswas, PhD, professor of marketing at the University of South Florida, is an expert in cross-modal effects and looked specifically at how the vestibular sense, which is responsible for balance, posture and spatial orientation, interacts with the gustatory sensory system, which impacts taste and flavor.

He found that holding a standing posture for even a few minutes prompts physical stress, muting taste buds. The force of gravity pushes blood to the lower parts of the body, causing the heart to work harder to pump blood back up to the top of the body, accelerating heart rate. This activates the hypothalamic-pituitary adrenal (HPA) axis and leads to increased concentrations of the stress hormone cortisol. This chain reaction reduces sensory sensitivity, which impacts food and beverage taste evaluation, food temperature perception and overall consumption volume.

When people experience discomfort, foods that normally taste good do not appear as pleasant to the palate. Biswas confirmed his hypothesis by having 350 participants rate the tastiness of a pita chip. Those who were standing gave it a less favorable rating than those who were sitting in a padded chair.

Researchers then provided participants classic bite-sized brownies baked at a local restaurant that were tested and widely considered pleasant tasting. Those who were sitting down rated them to be most delicious. However, when the baker altered the recipe and made the taste unpleasant by adding an extra ¼ cup of salt, the results were opposite. Participants standing up didn’t notice the brownies tasting saltier to that extent, and actually rated them to have a relatively more favorable taste perception than those who sampled them while sitting down.

“This finding suggests that parents might be able to make unpleasant-tasting, healthy foods seem more palatable to reluctant children by having them eat standing up (vs. sitting down). In a similar vein, it might be beneficial to maintain a standing posture when consuming pharmaceutical products that have unpleasant tastes.”''',
    "thumbnail":
        'https://media-image1.baydn.com/da0fcfe61b24325052d535590b2fcb674547ce913a79b23720cf30b9b1f01797.png?x-oss-process=image/quality,Q_80',
  },
  {
    "title": 'To Improve The Quality Of Your Writing? Type Slower',
    "author": 'Howell Oliver',
    "content":
        '''For thousands of years farmers have used a process of selection and cross breeding to continually improve the quality of crops. Traditional breeding methods are slow, requiring intensive labor: while trying to get a desirable trait in a bred species, undesirable traits will appear and farmers must continue the process over and over again until all the undesirables are bred out. In contrast, organisms acquire one specific gene or a few genes together through genetic modification, without other traits included and within a single generation. However, this technology too is inherently unpredictable and some scientists believe it can produce potentially dangerous results unless better testing methods are developed. Traditional breeding is based on sexual reproduction between like organisms. The transferred genes are similar to genes in the cell they join. They are conveyed in complete groups and in a fixed sequence that harmonizes with the sequence of genes in the partner cell. In contrast, bioengineers isolate a gene from one type of organism and collect it randomly into the DNA of a dissimilar species, disrupting its natural sequence. One of the main differences between conventional and genetically modified crops is that the former involves crosses either within species or between very closely related species. However, GM crops can have genes from closely related species or even from bacteria and viruses. Benefits: one side of the debate Economical? GM supporters tell farmers that they stand to reap enormous profits from growing GM crops. It takes a shorter time to produce the desired product. It is precise and there are no unwanted genes. ''',
    "thumbnail":
        'https://media-image1.baydn.com/4b31628ede0b0be09c5cdc29cb6bcce026c99d2c626f13e02ca1ac795b8434be.png?x-oss-process=image/quality,Q_80',
  },
];
