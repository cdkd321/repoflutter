import 'story.dart';

class StoryBrain {
  // List<Story> _storyData = [
  //   Story(
  //       storyTitle:
  //           'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
  //       choice1: 'I\'ll hop in. Thanks for the help!',
  //       choice2: 'Better ask him if he\'s a murderer first.'),
  //   Story(
  //       storyTitle: 'He nods slowly, unphased by the question.',
  //       choice1: 'At least he\'s honest. I\'ll climb in.',
  //       choice2: 'Wait, I know how to change a tire.'),
  //   Story(
  //       storyTitle:
  //           'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
  //       choice1: 'I love Elton John! Hand him the cassette tape.',
  //       choice2: 'It\'s him or me! You take the knife and stab him.'),
  //   Story(
  //       storyTitle:
  //           'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
  //       choice1: 'Restart',
  //       choice2: ''),
  //   Story(
  //       storyTitle:
  //           'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
  //       choice1: 'Restart',
  //       choice2: ''),
  //   Story(
  //       storyTitle:
  //           'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
  //       choice1: 'Restart',
  //       choice2: '')
  // ];

  List<Story> _storyData = [
    Story(
        storyTitle:
        '您的汽车在一条偏僻的蜿蜒道路上爆胎，而且没有手机信号。 你决定搭便车。 一辆生锈的皮卡车隆隆地停在你旁边。 一个戴着宽边帽、眼神无情的男人为你打开乘客车门，问道：“需要搭车吗，孩子？”',
        choice1: '我想上车。谢谢你的帮助',
        choice2: '最好先问问他是不是杀人犯。'),
    Story(
        storyTitle: '他缓缓地点点头，对这个问题不以为意。',
        choice1: '至少他是诚实的。上车！',
        choice2: '等等，我知道怎么换轮胎。'),
    Story(
        storyTitle:
        '当你开始开车时，陌生人开始谈论他和他母亲的关系。 他每分钟都变得越来越愤怒。 他要求你打开手套箱。 里面有一把血淋淋的刀、两根断指和一盘埃尔顿·约翰的磁带。 他伸手去拿手套箱。',
        choice1: '有品位，我也喜欢艾尔顿·约翰！ 把盒式磁带递给他。',
        choice2: '不是你死就是我亡！ 你拿起刀刺向他'),
    Story(
        storyTitle:
        '什么？ 这样的警察出来了！ 您是否知道交通事故是大多数成年人意外死亡的第二大原因？',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        '当你冲破护栏并冲向下面锯齿状的岩石时，你会反思在别人驾驶你的汽车时刺伤他们的做法是否明智。',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        '当你低吟着“今晚你能感受到爱吗”的歌词时，你与凶手建立了联系。 他会让你在下一个城镇下车。 在你走之前，他会问你是否知道有什么好地方可以倾倒尸体。 你回答：“试试码头”。',
        choice1: 'Restart',
        choice2: '')
  ];
  int _storyNumber = 0;

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    switch(_storyNumber) {
      case 0:
        if(choiceNumber == 1) {
          _storyNumber = 2;
        } else {
          _storyNumber = 1;
        }
        break;
      case 1:
        if(choiceNumber == 1) {
          _storyNumber = 2;
        } else {
          _storyNumber = 3;
        }
        break;
      case 2:
        if(choiceNumber == 1) {
          _storyNumber = 5;
        } else {
          _storyNumber = 4;
        }
        break;
      case 3:
      case 4:
      case 5:
      default:
        restart();
        break;
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return getChoice2() == '';
  }
}
