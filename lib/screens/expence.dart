import 'package:flutter/material.dart';
import 'package:travel_app/widgets/expcategory.dart';
import 'package:travel_app/widgets/totalexp.dart';

class ScreenExp extends StatefulWidget {
  const ScreenExp({super.key});

  @override
  State<ScreenExp> createState() => _ScreenExpState();
}

class _ScreenExpState extends State<ScreenExp> {
  @override
  Widget build(BuildContext context) {
    const sizedbox = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF355952),
          centerTitle: true,
          title: const Text('ONGOING EXPENSES',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF3CD53))),
          automaticallyImplyLeading: false),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/expBG.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFF3CD53), width: 4),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text('TOTAL EXPENSES',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Color(0xFF355952))),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedbox,
                const Center(
                  child: TotalExp(),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expenses(
                        money: '5000',
                        category: 'FOOD',
                        icons: Icons.food_bank),
                    Expenses(
                        money: '6000',
                        category: 'TRAVEL',
                        icons: Icons.airport_shuttle),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expenses(
                        money: '10000', category: 'HOTEL', icons: Icons.hotel),
                    Expenses(
                        money: '20000',
                        category: 'OTHERS',
                        icons: Icons.menu_rounded),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
