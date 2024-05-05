// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paws_pulse/src/views/index.dart';
import 'package:paws_pulse/src/common/index.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignInPage(),
        //'/': (context) => NavPage(),
        //'/': (context) => ProfileModifyPage(),
        '/sign_in': (context) => const SignInPage(),
        '/sign_up': (context) => SignUpPage(),
        '/nav': (context) => NavPage(),
        // 互助
        '/add_help': ((context) => AddHelpPage()),
        '/help_detail': ((context) => HelpDetailPage()), 
        '/my_help': ((context) => MyHelpPage()), 
        // 社区
        '/add_community': ((context) => AddCommunityPage()),
        '/community_detail': ((context) => CommunityDetailPage()),
        '/my_community': ((context) => MyCommunityPage()), 
        // 个人中心
        '/profile_modify': ((context) => ProfileModifyPage()),
        '/image_recognition': ((context) => ImageRecognitionPage()),
        '/pet_encyclopedia': ((context) => PetEncyclopediaPage()),
        '/pet_friend_application': ((context) => PetFriendApplicationPage()),
        '/pet_knowledge_test': ((context) => PetKnowledgeTestPage()),
        '/add_pet': ((context) => AddPetPage()),
      },
      title: 'PawsPulse',
      // 设置亮色主题
      theme: ThemeData(
        // 使用 Material3 样式
        useMaterial3: true,
        // 设置主题色
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(235, 180, 0, 1),
          //seedColor: Color.fromRGBO(17, 114, 162, 1),
          //seedColor: Color.fromRGBO(140, 58, 255, 1),
        ),
        // 设置全局默认字体
        fontFamily: 'notoSansSC',
      ),
      darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', ''), // Chinese
      ],
      locale: const Locale('zh', ''), // Set locale to Chinese
    );
  }
}
