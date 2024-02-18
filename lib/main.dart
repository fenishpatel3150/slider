
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider/utils/Product.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF085EA1),
  ));
  runApp(const Slider_list());
}

class Slider_list extends StatefulWidget {
  const Slider_list({super.key});

  @override
  State<Slider_list> createState() => _Slider_listState();
}

double amount = 0;

class _Slider_listState extends State<Slider_list> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Product List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          elevation: 10,
          shadowColor: Colors.black,
          centerTitle: true,
          actions: const [
            Icon(
              Icons.apps,
              color: Colors.white,
              size: 28,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Slider(
                 min: 0,
            max: 10000,
                 value: amount,
                 divisions: 100,
                 activeColor: Colors.blueAccent,
                 onChanged: (value) {
                   amount = value;
                   setState(() {});
                 },
               ),
               Text(
                 'All Product < Rs. ${amount.toStringAsFixed(0)}',
                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
               ),
               const SizedBox(
                 height: 20,
               ),
               Expanded(
                   child: ListView(
                       children: List.generate(data.length, (index) => (data[index]['price'] < amount)
                               ? Our_Product(index)
                               : Container()))),
              ],
          ),
        ),
      ),
    );
  }

  Widget Our_Product(int index) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      height: 90,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 5),
                blurRadius: 3)
          ]),
      child: ListTile(
        leading: Text(
          '${data[index]['id']}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        title: Text(
          data[index]['name'],
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          data[index]['title'],
          style: const TextStyle(
              fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          'Rs.${data[index]['price']}',
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}