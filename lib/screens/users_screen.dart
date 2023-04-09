import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

late Isar isar;

List<User> usersList = [];

addUser(String name, String motherName, String fatherName, int age,
        String birthPlace, String phone) async {  

        final  user = User()
        ..name = name
        ..fatherName = fatherName
        ..motherName = motherName
        ..age = age
        ..birthPlace = birthPlace
        ..phone = phone;

      await isar.writeTxn(() async => await isar.users.put(user));
    
    getUsers();
  }

editUser(int id, String name, String motherName, String farherName, int age,
          String birthPlace, String phone) async {

      final user = User()
      ..id = id
      ..name = name
      ..fatherName = farherName
      ..motherName = motherName
      ..age = age
      ..birthPlace = birthPlace
      ..phone = phone;

    await isar.writeTxn(() async => await isar.users.put(user));

  getUsers();
}

deleteUser(int id) async {
  await isar.writeTxn(()async {
    bool result = await isar.users.delete(id);
    if(result) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)

      .showSnackBar(const SnackBar(content: Text('Kullanıcı Kaldırıldı')));
      getUsers();
    }
    else {
      (result) {
      ScaffoldMessenger.of(context)

      .showSnackBar(const SnackBar(content: Text('Kullanıcı Kaldırılamadı')));
    };
    }
  });
}

usersToWidget(){
  return usersList
  .map((e) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(e.name!),
        const SizedBox(height: 5),
        Text(e.id.toString()),
        const SizedBox(height: 5),
        // ignore: prefer_interpolation_to_compose_strings
        Text('Yas: ' + e.age.toString()),
        ElevatedButton(onPressed: () => deleteUser(e.id), child: const Icon(Icons.delete)),
      ],
    ),
   ))
   .toList();
}

getUsers() async {
  final users = await isar.users.where().findAll();
  usersList = users;
  setState(() {});
}

getYoungUsers() async {
  final users = await isar.users.filter().ageLessThan(20).findAll();
  usersList = users;
  setState(() {});
}

getOldUsers() async {
  final users = await isar.users.filter().ageGreaterThan(20).findAll();
  usersList = users;
  setState(() {});
}

openConnection() async {
  isar = await Isar.open([UserSchema]);
  setState(() {});
}

closeConnection() async {
  await isar.close();
}

@override
void initState() {
  // ignore: avoid_print
  print('Ekran Çalıştı');
  openConnection();
  super.initState();
}

@override
// ignore: override_on_non_overriding_member
void disponse() {
  // ignore: avoid_print
  print('Ekran Kapandı');
  closeConnection();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(192, 192, 192, 3),
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('User Screen'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => addUser(
                'Berkay İşkodra', 'X', 'Y', 19, 'İstanbul', '0534 343 34 34'),
              child: const Text('Ekle')),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: getUsers, child: const Text('Kullanıcıları Listele')),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: getYoungUsers, child: const Text('20 Yaşından Küçükler')),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: getOldUsers, child: const Text('20 Yaşından Büyükler')),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                editUser(
                41, 'Alperen Keskin', 'X', 'Y', 752 , 'Ordu', '05377373434');
              },
              child: const Text("İd'si 41 Olan Kullanıcı Güncelle")),
            Expanded(
              child: ListView(
                children: usersToWidget(),
              ),
            ),
          ],
        ),
    );
  }
}