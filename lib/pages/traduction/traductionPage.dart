import 'package:flutter/material.dart';
import 'package:login_signup/pages/home/widgets/customBottomNavigationBar.dart'; 

class TranslationPage extends StatefulWidget {
  const TranslationPage({Key? key}) : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String _selectedInputMode = 'Text'; // Default to text input mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row to display source language and target language dropdowns
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dropdown for selecting source language
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Source Language'),
                    items: <String>['Français', 'English', '中文', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle language change
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                // Dropdown for selecting target language
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Target Language'),
                    items: <String>['Fon', 'Yoruba', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle language change
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Toggle buttons for selecting input mode
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  children: [
                    Text('Text'),
                    Text('Voice'),
                  ],
                  isSelected: _selectedInputMode == 'Text'
                      ? [true, false]
                      : [false, true],
                  onPressed: (int index) {
                    setState(() {
                      _selectedInputMode = index == 0 ? 'Text' : 'Voice';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Display text field or voice recording button based on input mode
            _selectedInputMode == 'Text'
                ? TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter text to translate',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Handle voice recording
                    },
                    child: const Text('Record Voice'),
                  ),
            const SizedBox(height: 16.0),
            // Button for submitting translation
            ElevatedButton(
              onPressed: () {
                // Handle translation submission
              },
              child: const Text('Translate'),
            ),
            const SizedBox(height: 16.0),
            // Space to display translation results
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Display translated text here
                    Text(
                      'Translated Text',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    // Display translated audio here
                    Text(
                      'Translated Audio',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 3,),
    );
  }
}
