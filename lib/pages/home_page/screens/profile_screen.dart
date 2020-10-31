import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(129, 129, 129, 1),
                radius: 86,
              ),
              Text('wdadwa'),
              Text('dwadwa'),
              Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('dwadwa'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('text'),
                              Transform.scale(
                                child: Switch(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                scale: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('Специальность',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/vector.svg',
                    height: 15,
                  ),
                ),
              ),
              ListTile(
                title: Text('Объект',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/vector.svg',
                    height: 15,
                  ),
                ),
              ),
              ListTile(
                title: Text('Сертификаты',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/vector.svg',
                    height: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
