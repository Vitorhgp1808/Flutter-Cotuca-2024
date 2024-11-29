import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // CarouselSlider
import '../../models/monitor.dart';
import '../../services/monitor_service.dart';
import 'monitor_schedule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Monitor> monitors = [];

  @override
  void initState() {
    super.initState();
    loadMonitors();
  }

  void loadMonitors() async {
    monitors = await MonitorService.getMonitors();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return monitors.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(

            appBar: PreferredSize(
              preferredSize: Size.fromHeight(180),
              child: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                elevation: 0,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bem-vindo!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Escolha um monitor para ver o horário',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [

                  CarouselSlider.builder(
                    itemCount: monitors.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MonitorSchedule(monitor: monitors[index]),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  monitors[index].avatar,
                                  width: 180, 
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                monitors[index].nome,
                                style: const TextStyle(
                                  fontSize: 22, 
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 450, 
                      viewportFraction: 0.75, 
                      enlargeCenterPage: true,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      scrollPhysics: BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
