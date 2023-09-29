import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return const MaterialApp(
          title: 'Flutter Demo',
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isLandscape = orientation == Orientation.landscape;
          final crossAxisCount = 2 ;

          return isLandscape
              ? Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 1,
                          childAspectRatio: isLandscape ? 1.1 : .8,
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            child: GestureDetector(
                              child: Container(

                                width: double.infinity,
                                height: isLandscape ? 100 : 150,
                                child: Image.network(
                                  'https://via.placeholder.com/150'
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              : Column(
            children: [


              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          height: isLandscape ? 100 : 150,
                          child: Image.network(
                            'https://via.placeholder.com/150',
               
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}