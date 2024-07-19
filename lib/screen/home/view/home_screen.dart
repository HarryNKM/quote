import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/screen/home/controller/home_controller.dart';
import 'package:quotes/utils/helper/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  controller.themeData.value == true ?Colors.grey.shade100:Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blueAccent),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Explore",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Theme Mode",
                      style: TextStyle(fontSize: 18),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.themeData.value,
                        onChanged: (value) {
                          SharedHelper.sHelper.setTheme(value);
                          controller.getTheme();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffeef6fa),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueAccent.shade200),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Your\nQuotes & Wishes!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Share with your friends and family ->",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.format_quote_outlined),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.favorite),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.work),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.heart_broken_sharp),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffd4f0fb),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.bedtime),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.quotesList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'quote',
                              arguments: controller.quotesList[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: const Color(0xffd4f0fb),
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "${controller.quotesList[index].category}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
