import 'package:example/pages/components_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterKeysPage extends StatefulWidget {
  const EnterKeysPage({
    Key? key,
  }) : super(key: key);

  @override
  _EnterKeysPageState createState() => _EnterKeysPageState();
}

class _EnterKeysPageState extends State<EnterKeysPage> {
  late TextEditingController _apiKeycontroller;
  late TextEditingController _fileKeycontroller;
  bool isLoading = true;

  @override
  void initState() {
    _apiKeycontroller = TextEditingController();
    _fileKeycontroller = TextEditingController();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _loadFromPreferences();
    });
    super.initState();
  }

  Future<void> _loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final api_key = prefs.getString('figma_api_key');
    if (api_key != null) {
      _apiKeycontroller.text = api_key;
    }
    final file_key = prefs.getString('figma_file_key');
    if (file_key != null) {
      _fileKeycontroller.text = file_key;
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _validate() async {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('figma_api_key', _apiKeycontroller.text);
    await prefs.setString('figma_file_key', _fileKeycontroller.text);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _apiKeycontroller.dispose();
    _fileKeycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Figma'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(
                  'Create a key from the Figma client home. Select your user to see options to create a key.',
                ),
                TextField(
                  controller: _apiKeycontroller,
                ),
                SizedBox(height: 20),
                Text(
                  'Copy the file key from the url of your file',
                ),
                TextField(
                  controller: _fileKeycontroller,
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ||
                _apiKeycontroller.text.trim().isEmpty ||
                _fileKeycontroller.text.trim().isEmpty
            ? null
            : () async {
                await _validate();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileComponentsPage(
                      apiKey: _apiKeycontroller.text,
                      fileKey: _fileKeycontroller.text,
                    ),
                  ),
                );
              },
        child: Icon(Icons.check),
      ),
    );
  }
}
