import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

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
          iconEnabledColor: YellowColor.yellow,
          dropdownColor: Color.fromARGB(255, 102, 155, 144),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          decoration: InputDecoration(
            hintText: 'Category',
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
                    Text('FOOD', style: TextStyle(color: YellowColor.yellow))),
            DropdownMenuItem<String>(
                value: "TRAVEL",
                child: Text('TRAVEL',
                    style: TextStyle(color: YellowColor.yellow))),
            DropdownMenuItem<String>(
                value: "HOTEL",
                child:
                    Text('HOTEL', style: TextStyle(color: YellowColor.yellow))),
            DropdownMenuItem<String>(
                value: "OTHERS",
                child: Text('OTHERS',
                    style: TextStyle(color: YellowColor.yellow))),
          ],
        ),
      ),
    );
  }
}
