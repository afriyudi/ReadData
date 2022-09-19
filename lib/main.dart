import 'dart:async';
import 'dart:convert';

// import 'package:flutter/foundation.dart'; // alternatif 1
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Mhs>> fetchMhss(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://testflutterku.000webhostapp.com/readDatajsonMhs.php'));

  // Use the compute function to run parseMhss in a separate isolate.
 // return compute(parseMhss, response.body);  // alternatif 1
      var message = jsonDecode(response.body).cast<Map<String, dynamic>>(); // alternatif 2
    print(response.body);      // alternatif 2
     return message.map<Mhs>((json) => Mhs.fromJson(json)).toList();  // alternatif 2

}

// A function that converts a response body into a List<Mhs>.
List<Mhs> parseMhss(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Mhs>((json) => Mhs.fromJson(json)).toList();
}

class Mhs {
  final String nim;
  final String nama;
  final String kelas;
  final String kdmatkul;
  final String email;

  Mhs({required this.nim, required this.nama, required this.kelas, required this.kdmatkul, required this.email});

  factory Mhs.fromJson(Map<String, dynamic> json) {
    return Mhs(
      nim: json['nim'] as String,
      nama: json['nama'] as String,
      kelas: json['kelas'] as String,
      kdmatkul: json['kdmatkul'] as String,
      email: json['email'] as String,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = 'Data Mahasiswa ubd';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: 
      /* FutureBuilder<List<Mhs>>(
        future: fetchMhss(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
 if (snapshot.hasError) {
            print(snapshot.error);
          } 
          return snapshot.hasData
              ? MhssList(MhsData: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),   */
      
      
       FutureBuilder<List<Mhs>>(
        future: fetchMhss(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          
          if (snapshot.hasData) {
            print("ada datanya");
            return  MhssList(mhsData: snapshot.data); // tampilkan data  
          }
          else if(snapshot.hasError)  {   // jika ada error
              print(snapshot);
                  return Column(
                    children:<Widget> [
                      Center(
                          child: Text("error : ${snapshot.error.toString()}",
                    style:const TextStyle(
                        fontFamily: 'regular',
                        fontSize: 18,
                        color: Colors.black),
                  ))
                    ],
                  );
                }

          else {
       //    return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red, strokeWidth: 8,));  //alternatif 1 
             return const Center(child: LinearProgressIndicator( backgroundColor: Colors.cyanAccent,      // alternatif 2
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red), ));                               // alternatif 2
          }
        }
        
       // );
       
         )
      );
  }
}

class MhssList extends StatelessWidget {
  final List<Mhs>? mhsData;

  const MhssList({Key? key, required this.mhsData}) : super(key: key);



Widget viewData(var data,int index)
{
return SizedBox(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.green,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            //ClipRRect(
              //      borderRadius: BorderRadius.only(
                //      topLeft: Radius.circular(8.0),
                  //    topRight: Radius.circular(8.0),
                   // ),
                   // child: Image.network(
                    //    "https://elearning.binadarma.ac.id/pluginfile.php/1/theme_lambda/logo/1602057627/ubd_logo.png"
                    //    width: 100,
                     //   height: 50,
                        //fit:BoxFit.fill

                   // ),
                 // ),
            
          ListTile(
           //leading: Image.network(
             //   "https://elearning.binadarma.ac.id/pluginfile.php/1/theme_lambda/logo/1602057627/ubd_logo.png",
             // ),
            title: Text(data[index].nim, style:const TextStyle(color: Colors.white)),
            subtitle: Text(data[index].nama, style:const TextStyle(color: Colors.white)),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('Edit', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Delete', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: mhsData?.length,
      itemBuilder: (context, index) {
        return viewData(mhsData,index);
      },
    );
  }
}
