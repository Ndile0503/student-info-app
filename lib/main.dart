import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/student_viewmodel.dart';
import 'views/student_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
     home: ChangeNotifierProvider(create: (context)=>StudentViewModel(),child: const StudentView(),),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String studentName ='Phindile';
  String favouriteSubject ='TPG316';
  List<String> subjects =[
    'TPG316C',
    'SOD316C',
    'CMN316C',
    'ITS316C',

  ];
  int subjectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Student Card'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: (){
              print('Settings pressed');
            },
          ),
        ],
      ),
      body: Center(
        
        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StudentInfoCard(studentName: studentName, favouriteSubject: favouriteSubject),
               
                
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(width: 30,
        child: FloatingActionButton(onPressed: (){
         setState(() {
           subjectIndex = (subjectIndex + 1) % subjects.length;
           favouriteSubject = subjects[subjectIndex];
         });
         
        },
        
        child: Center(child: const Text('Change Subject')),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: 'Profile',
        )
      ]),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favouriteSubject,
  });

  final String studentName;
  final String favouriteSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue,
        width: 2,
        )
      ),
      child: Column(
        children: [
    
      Text('Student Name:$studentName',style: const TextStyle(fontSize: 24),),
    const SizedBox(height: 10,),
    Text('Favourite Subject:$favouriteSubject',style: const TextStyle(fontSize:20, color: Colors.grey),),
        ]
    
      ),
    );
  }
}
