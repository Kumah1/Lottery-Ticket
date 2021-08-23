import 'package:flutter/material.dart';
import 'package:lottery/Config/pallete.dart';
import 'package:lottery/const.dart';
import 'package:lottery/screens/choose_number.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({Key? key, required this.countries}) : super(key: key);
  final List<Map> countries;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView.separated(
          itemCount: countries.length,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: const Divider(
                thickness: 1.5,
              )),
          itemBuilder: (context, index) {
            return Container(
              width: width,
              height: 70.0,
              child: ListTile(
                contentPadding: EdgeInsets.only(right: 8, left: 8),
                leading: Container(
                  width: 130.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(countries[index][BETLOGO]),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            countries[index][NAME],
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          Text(
                            JACKPOTS_TXT,
                            style: TextStyle(color: greyColor),
                          ),
                          Text(
                            countries[index][JACKPOTS],
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      countries[index][COUNTRYLOGO],
                      package: COUNTRYLOGO_PATH,
                      width: 50.0,
                      height: 30.0,
                    ),
                    Text(
                      NEXTDRAW_TXT,
                      style: TextStyle(color: greyColor),
                    ),
                    Text(
                      countries[index][NEXTDRAW],
                      style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ChooseNumber(),
                    ),
                  ),
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: primaryColor),
                    child: Center(
                      child: Text(
                        PLAY_NOW,
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
