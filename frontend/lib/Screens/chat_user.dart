import 'package:flutter/material.dart';

class ChatUserHome extends StatefulWidget {
  const ChatUserHome({super.key});

  @override
  State<ChatUserHome> createState() => ChatHomeScreen();
}

class ChatHomeScreen extends State<ChatUserHome> {
  bool isDark = true; // ✅ Moved outside build()

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png',
                ),
                onBackgroundImageError: (_, __) {
                  print("Image load failed");
                },
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "mihirprajapati715",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "mihirprajapati715@gmail.com",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {}, // Log out action
                child: const Text("Log out"),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Available Users",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, '/chat'),
                  child: ListView(
                    children: const [
                      UserTile(
                        name: "John Doe",
                        email: "john@example.com",
                        status: "Online",
                      ),

                      UserTile(
                        name: "Tirth",
                        email: "tirth@example.com",
                        status: "Online",
                      ),
                      UserTile(
                        name: "Sarah",
                        email: "sarah@example.com",
                        status: "15 mins ago",
                      ),
                      UserTile(
                        name: "Alex",
                        email: "alex@example.com",
                        status: "Online",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String name;
  final String email;
  final String status;

  const UserTile({
    required this.name,
    required this.email,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/user.png'),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(email),
      trailing: Text(status, style: TextStyle(color: Colors.blueGrey.shade300)),
    );
  }
}
