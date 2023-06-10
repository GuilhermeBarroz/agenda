import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<dynamic>> _events = {
    DateTime(2023, 5, 19): ['Evento 1'],
    DateTime(2023, 5, 22): ['Evento 2', 'Evento 3'],
    DateTime(2023, 5, 25): ['Evento 4'],
  };

  String _userName =
      'Nome do Usuário'; // Nome do usuário (pode ser substituído pela lógica de login)

  File? _selectedProfileImage; // Imagem de perfil selecionada

  void _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedProfileImage = File(pickedImage.path);
      });
    }
  }

  void _updateUserName(String name) {
    setState(() {
      _userName = name;
    });
  }

  void _confirmAppointment() {
    Fluttertoast.showToast(
      msg: "Agendamento realizado com sucesso!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _changeProfilePicture,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        child: _selectedProfileImage != null
                            ? ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: _selectedProfileImage!.path,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 100,
                              ),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Olá, $_userName',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              onDateChange: (date) {},
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Agendar Laboratório',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text('Horário de Início'),
                                value: '08:00',
                                onChanged: (String? newValue) {},
                                items: <String>[
                                  '08:00',
                                  '09:00',
                                  '10:00',
                                  '11:00',
                                  '12:00',
                                  '13:00',
                                  '14:00',
                                  '15:00',
                                  '16:00',
                                  '17:00',
                                  '18:00',
                                  '19:00',
                                  '20:00',
                                  '21:00',
                                  '22:00'
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text('Horário de Término'),
                                value: '08:00',
                                onChanged: (String? newValue) {},
                                items: <String>[
                                  '08:00',
                                  '09:00',
                                  '10:00',
                                  '11:00',
                                  '12:00',
                                  '13:00',
                                  '14:00',
                                  '15:00',
                                  '16:00',
                                  '17:00',
                                  '18:00',
                                  '19:00',
                                  '20:00',
                                  '21:00',
                                  '22:00'
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _confirmAppointment,
                              child: Text('Confirmar Agendamento'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Editar Nome'),
                        content: TextField(
                          onChanged: _updateUserName,
                          decoration: InputDecoration(
                            hintText: 'Digite seu nome',
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Salvar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Editar Nome'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
