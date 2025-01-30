import 'package:flutter/material.dart';

void main() {
  runApp(BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Booking System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookingHomePage(),
    );
  }
}

class BookingHomePage extends StatefulWidget {
  const BookingHomePage({super.key});

  @override
  _BookingHomePageState createState() => _BookingHomePageState();
}

class _BookingHomePageState extends State<BookingHomePage> {
  List<String> availableSlots = [
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "1:00 PM - 2:00 PM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
  ];

  List<String> bookedSlots = [];

  void bookSlot(String slot) {
    setState(() {
      availableSlots.remove(slot);
      bookedSlots.add(slot);
    });
  }

  void unbookSlot(String slot) {
    setState(() {
      bookedSlots.remove(slot);
      availableSlots.add(slot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Booking System'),
      ),
      body: Container(
        color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Slots',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: availableSlots.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(availableSlots[index], style: TextStyle(color: Colors.black)),
                        trailing: ElevatedButton(
                          onPressed: () => bookSlot(availableSlots[index]),
                          child: Text('Book'),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Booked Slots',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bookedSlots.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(bookedSlots[index], style: TextStyle(color: Colors.black)),
                        trailing: ElevatedButton(
                          onPressed: () => unbookSlot(bookedSlots[index]),
                          child: Text('Unbook'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
