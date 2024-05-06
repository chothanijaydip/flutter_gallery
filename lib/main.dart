import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/image.dart' as Images;
import 'screens/gallery_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Images.Image>('gallery');
  Hive.registerAdapter(Images.ImageAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: Link.split((request) {
        return request.operation.operationName == 'imageApi';
      }, HttpLink(
        'https://pixabay.com/api/graphql?key=43676987-5a46da93fc3ef4f05c0f407b5',
      ),),

      cache: GraphQLCache(),
    ),
  );
  // store: HiveStore()
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Gallery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  GalleryScreen(onItemTapped: (String ) {  }, onRouteTapped: (String ) {  },),
      ),
    );
  }
}
