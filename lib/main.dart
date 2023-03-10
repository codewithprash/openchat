import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap2Chat',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final TextEditingController _mobnum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 20,
        // backgroundColor: const Color(0xFF128C7F),
        title: Text(
          "Open WhatsApp",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Send WhatsApp messages without saving phone number',
                overflow: TextOverflow.visible,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _mobnum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // borderSide: const BorderSide(color: Color(0xFF128C7F)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Enter WhatsApp Number',
                    prefixText: "+91 ",
                    filled: true),
                keyboardType: TextInputType.number,
                maxLength: 10,
                textInputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () async {
                String num = _mobnum.text.trim();

                String url =
                    'https://web.whatsapp.com/send/?phone=91$num&text=Hi';

                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                }
              },
              style: ElevatedButton.styleFrom(
                // backgroundColor: const Color(0xFF128C7F),
                textStyle: const TextStyle(fontSize: 18),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                // shape: const StadiumBorder(),
              ),
              child: const Text("Continue to Chat"),
            ),
          ],
        ),
      ),
    );
  }
}
