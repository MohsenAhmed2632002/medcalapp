import 'package:flutter/material.dart';
import 'package:medcalapp/Model/Model.dart';

class Viewdata extends StatefulWidget {
  Viewdata({Key? key, required this.namemedicine, required this.nameperson})
      : super(key: key);
  final String namemedicine;
  final String nameperson;
  @override
  State<Viewdata> createState() => _ViewdataState();
}

class _ViewdataState extends State<Viewdata> {
  static List<medicine> medicinelist = [
    medicine(
        name: "EAFORMEAT",
        use: "خفض مستوى السكر في الدم-قد يوصف لحالات زيادة الوزن",
        properties: " Sensitizers -Biguanide",
        group: "Oral – solid"),
    medicine(
      name: "DAKLANORK",
      use: "مضاد للفيروسات-يمنع فيروس الكبد من التكاثر",
      properties: " Anti-Viral",
      group: "Oral – solid",
    ),
    medicine(
      name: "FAMOTIN",
      use: "التهاب المريئ المؤتكل-تخفيف اعراض الحرقة وعسر الهضم",
      properties: "Anti-Histamine-Pepticulcer",
      group: "Oral – solid",
    ),
    medicine(
      name: "HAEMOPOWER",
      group: "Oral – solid ",
      properties: "Amriya-Anemia-Ronsupplement",
      use: " مكمل غذائي لتعويض نقص الحديد في الجسم ",
    ),
    medicine(
      name: "IBUCALMIN",
      group: "Oral-Liquid",
      properties: "MasPermier-Nsaid",
      use: "تقليل الالتهاب-تسكين الم الاسنان-علاج التهاب المفاصل الروماتويدي",
    ),
    medicine(
      name: "JUVIEX SYRUP",
      group: "Oral-Liquid",
      properties: "Hachsterpharmaceutica-industries-Coughproducts",
      use: "يستخدم في تحسين الجهاز التنفسي وطارد للبلغم",
    ),
    medicine(
      name: "FAMOX",
      group: "SOLID-ORAL",
      properties: "SEDICO-TOPPHARM",
      use: "علاج جرثومة المعدة-التهابات الجهاز البولي التناسلي",
    ),
    medicine(
      name: "FARCOSEF",
      group: "Injection",
      properties: "pharcob",
      use: "التهاب الحلق والصدر والأذان",
    ),
    medicine(
      name: "HAEMOKION",
      group: "Solid-oral",
      properties: "amount-vitaminK",
      use: "علاج انخفاض فيتامين ك ",
    ),
    medicine(
      name: "IBRANCE",
      group: "Solid-oral",
      properties: "Pfizer",
      use: "لعلاج سرطان الثدي",
    ),
    medicine(
      name: "SABAXALONE",
      group: "Solid-Oral",
      properties: "Analgeslc",
      use:
          "من الادوية المضادة للتشنج يستخدم لعلاج اضطرابات الجهاز الهضمي الهيكلية التي تعمل كحاصرات لقنوات الكالسيوم. ",
    ),
  ];

  List<medicine> display = List.from(medicinelist);
  void up(String value) {
    setState(() {
      display = medicinelist
          .where(
            (element) => element.name!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    up(widget.namemedicine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(89, 177, 183, 1),
        child: display.length == 0 || display.contains(widget.namemedicine)
            ? Center(
                child: Text(
                  "no data like you writers ${widget.nameperson}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: display.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " The Result Number ${index + 1}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(89, 177, 183, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "name:\n${display[index].name}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(89, 177, 183, 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "properties:\n${display[index].properties}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: Color.fromRGBO(89, 177, 183, 1),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "use:\n${display[index].use}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            color: Color.fromRGBO(89, 177, 183, 1),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Class:\n${display[index].group}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
