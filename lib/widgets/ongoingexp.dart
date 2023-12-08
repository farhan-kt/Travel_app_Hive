import 'package:flutter/material.dart';
import 'package:travel_app/widgets/expcategory.dart';

class OngoingExp extends StatelessWidget {
  const OngoingExp({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox sizedbox = const SizedBox(height: 20);
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFF3CD53), width: 4),
        color: const Color(0xFF355952),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: const Color(0xFF355952),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedbox,
                          Center(
                              child: Title(
                                  color: Colors.white,
                                  child: const Text(
                                    'TOTAL EXPENCES',
                                    style: TextStyle(
                                        color: Color(0xFFF3CD53),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ))),
                          sizedbox,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expenses(
                                money: '200',
                                category: 'FOOD',
                                icons: Icons.food_bank,
                              ),
                              Expenses(
                                  money: '2000',
                                  category: 'TRAVEL',
                                  icons: Icons.airport_shuttle),
                            ],
                          ),
                          sizedbox,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expenses(
                                  money: '4000',
                                  category: 'HOTEL',
                                  icons: Icons.hotel),
                              Expenses(
                                  money: '5000',
                                  category: 'OTHERS',
                                  icons: Icons.menu_rounded),
                            ],
                          ),
                          sizedbox,
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFF3CD53), width: 4),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: const Center(
                                child: Text(
                                  'TOTAL EXPENCE : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFF355952)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    )),
              );
            },
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('TRIP EXPENCES',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '₹ 1000',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Color(0xFFF3CD53)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tap to View',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
