import 'package:flutter/material.dart';
import '../../models/monitor.dart';

class MonitorSchedule extends StatelessWidget {
  final Monitor monitor;

  const MonitorSchedule({Key? key, required this.monitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monitor.nome),
        backgroundColor: Colors.blueAccent, 
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [

            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    monitor.avatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                monitor.nome,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Horários de Atendimento:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),

            for (var entry in monitor.horarios.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.blue[50],
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Icon(
                      Icons.access_time,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                    title: Text(
                      entry.key, 
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    subtitle: Text(
                      entry.value, 
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
