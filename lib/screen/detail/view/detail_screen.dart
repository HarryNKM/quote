import 'package:flutter/material.dart';
import 'package:quotes/screen/home/model/home_model.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.blueAccent),
          title: const Text(
            "Edit Your Quote",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {
            Share.share("${data[0]}");
            }, icon:  const Icon(Icons.share),),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height / 2,
                width: MediaQuery.sizeOf(context).width,
                padding:
                    const EdgeInsets.only(top: 25, bottom: 12, left: 12, right: 12),
                decoration: BoxDecoration(
                    color: const Color(0xffd4f0fb),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${data[0]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${data[1]}",
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
