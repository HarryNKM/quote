import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/screen/home/model/home_model.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel data = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.blueAccent),
            centerTitle: true,
            title: const Text(
              "Quotes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView.builder(
            itemCount: data.quotes!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',
                      arguments: [data.quotes![index], data.author![index]]);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blueAccent)),
                  child: Text(
                    "${data.quotes![index]}",
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, fontSize: 18),
                  ),
                ),
              );
            },
          )),
    );
  }
}
