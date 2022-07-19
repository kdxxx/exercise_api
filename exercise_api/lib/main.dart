import 'package:exercise_api/services/api_service.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<UserModel>? _usermodel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _usermodel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rest API exercise"),
        ),
        body: _usermodel == null || _usermodel!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _usermodel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 24,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              child: Text(_usermodel![index].id.toString()),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.2,
                            ),
                            Text(_usermodel![index].username),
                            SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                            Expanded(child: Text(_usermodel![index].website))

                            /// List<UserModel>? is potentially is null
                            /// _usermodel![index].website will be non-nullable

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_usermodel![index].email),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
