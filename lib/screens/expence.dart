import 'package:flutter/material.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/functions/exp_functions.dart';
import 'package:travel_app/db/model/expense_model.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/widgets/bottombar.dart';
import 'package:travel_app/widgets/expcategory.dart';
import 'package:travel_app/widgets/totalexp.dart';

class ScreenExp extends StatefulWidget {
  const ScreenExp({super.key});

  @override
  State<ScreenExp> createState() => _ScreenExpState();
}

class _ScreenExpState extends State<ScreenExp> {
  late String ongoingBudget;

  @override
  void initState() {
    super.initState();
    if (ongoingTripsListNotifier.value.isNotEmpty) {
      ongoingBudget = ongoingTripsListNotifier.value.first.budget;
    } else {
      ongoingBudget = '₹ 0';
    }
  }

  @override
  Widget build(BuildContext context) {
    getAllExp();
    const sizedbox = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GreenColor.green,
          centerTitle: true,
          title: const Text('ONGOING EXPENSES',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: YellowColor.yellow)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenBtm()),
                  (route) => false);
            },
          ),
          automaticallyImplyLeading: false),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/expBG.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 5),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: YellowColor.yellow, width: 4),
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
                                color: GreenColor.green)),
                      ),
                    ],
                  ),
                ),
              ),
              sizedbox,
              Center(
                child: TotalExp(ongoingBudget: ongoingBudget),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: ExpenseListNotifier,
                  builder: (BuildContext context, List<ExpenseModel> expe,
                      Widget? child) {
                    if (expe.isEmpty) {
                      return const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expenses(
                                  money: '₹ 0',
                                  category: 'FOOD',
                                  icons: Icons.food_bank),
                              Expenses(
                                  money: '₹ 0',
                                  category: 'TRAVEL',
                                  icons: Icons.airport_shuttle),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expenses(
                                  money: '₹ 0',
                                  category: 'HOTEL',
                                  icons: Icons.hotel),
                              Expenses(
                                  money: '₹ 0',
                                  category: 'OTHERS',
                                  icons: Icons.menu_rounded),
                            ],
                          )
                        ],
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                          // itemCount: expe.isNotEmpty ? 1 : 0,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            final revesedindex = expe.length - 1 - index;
                            final data = expe[revesedindex];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expenses(
                                        money: data.food,
                                        category: 'FOOD',
                                        icons: Icons.food_bank),
                                    Expenses(
                                        money: data.travel,
                                        category: 'TRAVEL',
                                        icons: Icons.airport_shuttle),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expenses(
                                        money: data.hotel,
                                        category: 'HOTEL',
                                        icons: Icons.hotel),
                                    Expenses(
                                        money: data.others,
                                        category: 'OTHERS',
                                        icons: Icons.menu_rounded),
                                  ],
                                )
                              ],
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
