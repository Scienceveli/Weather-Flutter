import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController firstNumber = TextEditingController();
  TextEditingController secondNumber = TextEditingController();
  String answer = '';
  List<String> history = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADDING 2 VALUES',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: firstNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Value 1',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'OR',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: secondNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Value 2',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Your Answer is :-  $answer',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(16),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    calculateAndStoreValues();
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(16),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    clearNumbersOnTextField();
                  },
                  child: const Text(
                    'Clear',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      history[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_sweep_outlined),
                      onPressed: () {
                        deleteEntryFromList(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateAndStoreValues() {
    if (firstNumber.text.isNotEmpty && secondNumber.text.isNotEmpty) {
      double result =
          double.parse(firstNumber.text) + double.parse(secondNumber.text);
      String operation = '${firstNumber.text} + ${secondNumber.text} = $result';
      setState(() {
        answer = result.toString();
        history.add(operation);
      });
    }
  }

  void clearNumbersOnTextField() {
    setState(() {
      firstNumber.clear();
      secondNumber.clear();
      answer = '';
    });
  }

  void deleteEntryFromList(int index) {
    setState(() {
      history.removeAt(index);
    });
  }
}
