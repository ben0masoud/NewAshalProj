class WHPTest {
  WHPTest({required this.date, required this.WHP});

   DateTime? date;
   double? WHP;

  WHPTest.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        WHP = json['WHP'].toDouble();
}