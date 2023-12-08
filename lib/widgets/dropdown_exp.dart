import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = "FOOD";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 50,
        child: DropdownButtonFormField(
          iconEnabledColor: Color(0xFFF3CD53),
          dropdownColor: Color.fromARGB(255, 102, 155, 144),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          items: const [
            DropdownMenuItem<String>(
                value: "FOOD",
                child:
                    Text('FOOD', style: TextStyle(color: Color(0xFFF3CD53)))),
            DropdownMenuItem<String>(
                value: "TRAVEL",
                child:
                    Text('TRAVEL', style: TextStyle(color: Color(0xFFF3CD53)))),
            DropdownMenuItem<String>(
                value: "HOTEL",
                child:
                    Text('HOTEL', style: TextStyle(color: Color(0xFFF3CD53)))),
            DropdownMenuItem<String>(
                value: "OTHERS",
                child:
                    Text('OTHERS', style: TextStyle(color: Color(0xFFF3CD53)))),
          ],
        ),
      ),
    );
  }
}
