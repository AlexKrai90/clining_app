import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:clining_app/notificationservice.dart';
import 'package:rxdart/subjects.dart';
import 'package:permission_handler/permission_handler.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var denied = await Permission.notification.isDenied;
  if (denied) {
    await Permission.notification.request();
  }
  tz.initializeTimeZones();
  runApp(const MaterialApp(
    home: StartWindow()));
}

class StartWindow extends StatelessWidget {
  const StartWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
        body: Column(
            children: [
              Image.asset("assets/images/circles.png", width: 390, height: 282),
              Transform.translate(
                  offset: const Offset(0, 75),
              child: Container(
                width: 260,
                height: 186,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: HexColor("#D9D9D9")
                ),
                child: Text("ЛОГО",
                  style: TextStyle(
                    color: HexColor("#FFFFFF"),
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
              )),
              Transform.translate(offset: const Offset(0,287),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 60),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginWindow()));},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(HexColor("#676767")),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
                ),
                  child: Text("Начать ⟩",
                    style: TextStyle(
                      color: HexColor("#FFFFFF"),
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  )
              )
              )
            ]
        ),
          ),
    );
  }
}

class LoginWindow extends StatelessWidget{
  const LoginWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: HexColor("#FFFFFF"),
          body: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(offset: const Offset(20,69),
                  child: Text("Вход",
                    style: TextStyle(
                      color: HexColor("#2C2B2B"),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    ),) ),
                Transform.translate(offset: const Offset(102,119),
                  child: Container(
                    width: 186,
                    height: 148,
                    color: HexColor("#D9D9D9"),
                    alignment: Alignment.bottomCenter,
                    child: Text("Изображение",
                        style: TextStyle(
                          color: HexColor("#FFFFFF"),
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Ubuntu",
                        )
                    ),
            )),
                Transform.translate(offset: const Offset(20,182),
                  child: Text("Логин",
                  style: TextStyle(
                    color: HexColor("#1E1E1E"),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Ubuntu",
                  ),)),
                Transform.translate(offset: const Offset(20,190),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                  child: TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: HexColor("#F3F3F3"),
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: HexColor("#00000080").withOpacity(0.5),
                          width: 0.5,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: HexColor("#1E1E1E"),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                    ),
                  ),)
                ),
                Transform.translate(offset: const Offset(20,273),
                    child: Text("Пароль",
                      style: TextStyle(
                        color: HexColor("#1E1E1E"),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Ubuntu",
                      ),)),
                Transform.translate(offset: const Offset(20,281),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                      child: TextField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.lock_outline),
                          fillColor: HexColor("#F3F3F3"),
                          contentPadding: const EdgeInsets.only(left: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: HexColor("#00000080").withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor("#1E1E1E"),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Ubuntu",
                        ),
                      ),)
                ),
                Transform.translate(offset: const Offset(148,290),
                    child: Text("Забыли пароль?",
                      style: TextStyle(
                        color: HexColor("#2C2B2B"),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Ubuntu",
                    ),),),
                Transform.translate(offset: const Offset(20,385),
                    child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                        child: ElevatedButton(
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow()));},
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(HexColor("#676767")),
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
                          ),
                          child: Text("Войти",
                            style: TextStyle(
                              color: HexColor("#FFFFFF"),
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        )
                    )
                )
              ])
      ),
    );
  }
}

class MainWindow extends StatelessWidget {
  const MainWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
          appBar: AppBar(
            toolbarHeight: 60,
          ),
          drawer: const MenuDrawer(),
          body: ListView(
            shrinkWrap: true,
            children: const [
              ClosestCleaningTrayWindow(),
              OpenCleaningWindow(),
            ],
          ),
    ),);
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
          backgroundColor: HexColor("#3C3C3C"),
          width: 282,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: ListView(
            children: [
              const Divider(
                height: 120,
                thickness: 0.1,
              ),
              ListTile(
                minVerticalPadding: 15,
                leading: const Icon(Icons.person_2_outlined, color: Colors.white,),
                title: const Text("Профиль",
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Ubuntu",
                    fontSize: 20,
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileWindow()));
                },
              ),
              const Divider(
                height: 15,
                thickness: 0.1,
              ),
              ListTile(
                minVerticalPadding: 15,
                  leading: const Icon(Icons.cleaning_services_outlined, color: Colors.white,),
                  title: const Text("Ближайшие уборки",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                      fontSize: 20,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ClosestCleaningTrayOnlyWindow()));
                  },
                ),
              const Divider(
                height: 15,
                thickness: 0.1,
              ),
              ListTile(
                minVerticalPadding: 15,
                  leading: const Icon(Icons.edit_calendar_outlined, color: Colors.white,),
                  title: const Text("Набор на уборки",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                      fontSize: 20,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OpenCleaningOnlyWindow()));
                  },
                ),
              const Divider(
                height: 15,
                thickness: 0.1,
              ),
                ListTile(
                  minVerticalPadding: 15,
                  leading: const Icon(Icons.notifications_none_outlined, color: Colors.white,),
                  title: const Text("Уведомления",
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Ubuntu",
                      fontSize: 20,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationWindow()));
                },
              ),
              const Divider(
                height: 450,
                thickness: 0.1,
              ),
              ListTile(
                minVerticalPadding: 15,
                leading: const Icon(Icons.exit_to_app_outlined, color: Colors.white,),
                title: const Text("Выйти",
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Ubuntu",
                    fontSize: 20,
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginWindow()));
                },
              ),
            ],
          ),
        );
  }
}

class ProfileWindow extends StatelessWidget {
  const ProfileWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
          appBar: AppBar(
            title: IconButton(
              icon: const Icon(Icons.keyboard_backspace_outlined, color: Colors.black,),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow()));},
            ),
          ),
          body: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                child: Container(
                  height: 78,
                  width: 78,
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/photoplaceholder.jpg"),
                  ),
                  ),
                Transform.translate(offset: const Offset(-20,30),
                child: const Icon(Icons.edit_calendar_outlined, color: Colors.black,),),
                ],
                ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ваше имя",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w400,
                            color: HexColor("#888888"),
                          ),
                        ),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#1E1E1E"),
                  )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ваша фамилия",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#888888"),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month_outlined),
                      border: InputBorder.none,
                      hintText: "Дата рождения",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#888888"),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#888888"),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Номер телефона",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#888888"),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    )
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_downward_outlined),
                      border: InputBorder.none,
                      hintText: "Пол",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#888888"),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    )
                ),
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(HexColor("#676767")),
                        shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
                    ),
                    child: Text("Сохранить изменения",
                      style: TextStyle(
                        color: HexColor("#FFFFFF"),
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ),
            ],
          ),
    ),
    );
  }
}

class NotificationWindow extends StatefulWidget {
  const NotificationWindow({super.key});

  @override
  State<NotificationWindow> createState() => _NotificationWindow();
}

class _NotificationWindow extends State<NotificationWindow> {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
        appBar: AppBar(
          title: IconButton(
            icon: const Icon(Icons.keyboard_backspace_outlined, color: Colors.black,),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow()));},
          ),
        ),
        body: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text("Уведомления",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: "Geologica",
                    fontSize: 17,
                    color: HexColor("#5C5C5C"),
                  ),),
              ),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.circle, color: HexColor("#1E1E1E")),
                  title: Text("Текст Текст Текст Текст Текст",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w400,
                  color: HexColor("#1E1E1E"),
                ),),
                  subtitle: Text("Текст Текст Текст Текст Текст",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1E1E1E"),
                    ),),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  contentPadding: const EdgeInsets.all(20),
                  onTap: () async {
              await service.showScheduledNotification(id: 1, title: 'Уведомление', body: 'Надеюсь сработает', seconds: 10, payload: 'Notification');}
              ),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
              const NotificationWidget(),
              Divider(
                color: HexColor("#FFFFFF"),
                thickness: 0.1,
                height: 10,
              ),
            ]
        ),
      ),
    );
  }

  void listenToNotification() => service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationWindow()));
    }
  }

}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.circle, color: HexColor("#1E1E1E")),
        title: Text("Текст Текст Текст Текст Текст",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w400,
            color: HexColor("#1E1E1E"),
          ),),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        contentPadding: const EdgeInsets.all(20),
        onTap: (){}
    );
  }
}

class ClosestCleaningTrayWindow extends StatelessWidget {
  const ClosestCleaningTrayWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
          children: [
            ListTile(
              title: Text("Ближайшие уборки",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Ubuntu",
                  fontSize: 17,
                  color: HexColor("#5C5C5C"),
                ),),
              trailing: ConstrainedBox(constraints: const BoxConstraints(maxHeight: 40,maxWidth: 96),
                child: Row(children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.table_rows),),
                    IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarWidget()));}, icon: const Icon(Icons.calendar_month_outlined),),
                ]
              ),
            ),
            ),
            Divider(
              color: HexColor("#BCBCBC"),
              thickness: 1,
              height: 10,
            ),
            ListTile(title: Text("Ул. Калинина, д. 10",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w400,
                      color: HexColor("#1B1B1B"),
                    ),),
                    subtitle: Text("Пятница, 30 ноября в 13:00",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.w400,
                        color: HexColor("#5C5C5C"),
                      ),),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: const EdgeInsets.all(20),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
    ),
            Divider(
              color: HexColor("#BCBCBC"),
              thickness: 1,
              height: 10,
            ),
            ListTile(title: Text("Ул. Калинина, д. 10",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                color: HexColor("#1B1B1B"),
              ),),
                subtitle: Text("Пятница, 30 ноября в 13:00",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#5C5C5C"),
                  ),),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: const EdgeInsets.all(20),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
            ),
            Divider(
              color: HexColor("#BCBCBC"),
              thickness: 1,
              height: 10,
            ),
            ListTile(title: Text("Ул. Калинина, д. 10",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w400,
                color: HexColor("#1B1B1B"),
              ),),
                subtitle: Text("Пятница, 30 ноября в 13:00",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w400,
                    color: HexColor("#5C5C5C"),
                  ),),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: const EdgeInsets.all(20),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
            ),
            Divider(
              color: HexColor("#BCBCBC"),
              thickness: 1,
              height: 10,
            ),
            Align(alignment: Alignment.center, child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 350, height: 45),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(HexColor("#FFFFFF")),
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
                  ),
                  child: Text("Показать ещё...",
                    style: TextStyle(
                      color: HexColor("#676767"),
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
            ),
            ),
            ]
    );
  }
}

class OpenCleaningWindow extends StatelessWidget {
  const OpenCleaningWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text("Открыт набор",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Ubuntu",
                fontSize: 17,
                color: HexColor("#5C5C5C"),
              ),
              ),
            ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          ListTile(title: Text("Ул. Калинина, д. 10",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w400,
              color: HexColor("#1B1B1B"),
            ),),
              subtitle: Text("Пятница, 30 ноября в 13:00",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w400,
                  color: HexColor("#5C5C5C"),
                ),),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: const EdgeInsets.all(20),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          ListTile(title: Text("Ул. Калинина, д. 10",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w400,
              color: HexColor("#1B1B1B"),
            ),),
              subtitle: Text("Пятница, 30 ноября в 13:00",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w400,
                  color: HexColor("#5C5C5C"),
                ),),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: const EdgeInsets.all(20),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          ListTile(title: Text("Ул. Калинина, д. 10",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w400,
              color: HexColor("#1B1B1B"),
            ),),
              subtitle: Text("Пятница, 30 ноября в 13:00",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w400,
                  color: HexColor("#5C5C5C"),
                ),),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: const EdgeInsets.all(20),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCleaningWindow()));}
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          Align(alignment: Alignment.center, child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 350, height: 45),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(HexColor("#FFFFFF")),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
              ),
              child: Text("Показать ещё...",
                style: TextStyle(
                  color: HexColor("#676767"),
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ),
        ]
    );
  }
}

class ClosestCleaningTrayOnlyWindow extends StatelessWidget {
  const ClosestCleaningTrayOnlyWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
        appBar: AppBar(
          toolbarHeight: 60,
        ),
        drawer: const MenuDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: const [
            ClosestCleaningTrayWindow(),
          ],
        ),
      ),);
  }
}

class OpenCleaningOnlyWindow extends StatelessWidget {
  const OpenCleaningOnlyWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
        appBar: AppBar(
          toolbarHeight: 60,
        ),
        drawer: const MenuDrawer(),
        body: ListView(
          shrinkWrap: true,
          children: const [
            OpenCleaningWindow(),
          ],
        ),
      ),);
  }
}

class DetailCleaningWindow extends StatelessWidget {
  const DetailCleaningWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
        ),
        drawer: const MenuDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Text("Адрес",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: "Geologica",
                fontSize: 17,
                color: HexColor("#5C5C5C"),
              ),
            ),
            subtitle: Text("Ул. Калинина, д.10",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Geologica",
                fontSize: 20,
                color: HexColor("#1B1B1B"),
              ),
            ),
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          ListTile(
            title: Text("Дата и время",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: "Geologica",
                fontSize: 17,
                color: HexColor("#5C5C5C"),
              ),
            ),
            subtitle: Text("Пятница, 30 ноября в 13:00",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Geologica",
                fontSize: 20,
                color: HexColor("#1B1B1B"),
              ),
            ),
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          ListTile(
            title: Text("Примечание",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: "Geologica",
                fontSize: 17,
                color: HexColor("#5C5C5C"),
              ),
            ),
            subtitle: Text("Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст Текст",
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: "Geologica",
                fontSize: 20,
                color: HexColor("#1B1B1B"),
              ),
            ),
          ),
          Divider(
            color: HexColor("#BCBCBC"),
            thickness: 1,
            height: 10,
          ),
          Align(alignment: Alignment.center, child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 350, height: 45),
            child: ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow()));},
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(HexColor("#FFFFFF")),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))
              ),
              child: Text("Записаться",
                style: TextStyle(
                  color: HexColor("#676767"),
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ),
        ]
    ),
    ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarState();
}
  class _CalendarState extends State<CalendarWidget>{
    DateTime today = DateTime.now();
    void _onDaySelected(DateTime day, DateTime focusedDay){
      setState(() {
        today = day;
      });
    }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      drawer: const MenuDrawer(),
        body: ListView(
    shrinkWrap: true,
    children: [
    ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Ближайшие уборки",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Ubuntu",
              fontSize: 17,
              color: HexColor("#5C5C5C"),
            ),),
          trailing: ConstrainedBox(constraints: const BoxConstraints(maxHeight: 40,maxWidth: 96),
          child: Row(children: [
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainWindow()));}, icon: const Icon(Icons.table_rows_outlined),),
            IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month),),
          ]
          ),
          ),
          ),
        Divider(
          color: HexColor("#BCBCBC"),
          thickness: 1,
          height: 10,
        ),
        TableCalendar(
          rowHeight: 80,
          headerStyle: const HeaderStyle(
           formatButtonVisible: false, titleCentered: false,
          ),
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: today,
          firstDay: DateTime.utc(2024, 4, 13),
          lastDay: DateTime.utc(2024, 5, 31),
          onDaySelected: _onDaySelected,
        )
      ]
    ),
        const OpenCleaningWindow(),
    ]
    ),
    ),
    );
  }
}