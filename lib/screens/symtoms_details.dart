import 'package:flutter/material.dart';
import 'package:flutter_health_app/models/symptoms_model.dart';

class SymptomsDetails extends StatefulWidget {
  const SymptomsDetails({
    super.key,
  });

  @override
  State<SymptomsDetails> createState() => _SymptomsDetailsState();
}

class _SymptomsDetailsState extends State<SymptomsDetails> {
  List<SymptomsGuide> symptomsGuide = [
    SymptomsGuide(
      heading: 'How to reduce body Temprature?',
      details:
          'Body temperature rises when the external temperature increases but also when the internal temperature increases. The human body is always regulating its temperature, and it can lower it in four diffrent four ways\n\nTips to reduce body temperature\n1-Drink cool\n2-Get in cool water\n3-Talk to a doctor about thyroid health\n',
      name: 'Temprature:',
    ),
    SymptomsGuide(
      heading: 'How to protect against fever?',
      details:
          'To protect against fever, practice good hygiene, maintain a healthy lifestyle, and promptly address any signs of illness or infection to reduce the risk of developing a fever.\n',
      name: 'Fever      ',
    ),
    SymptomsGuide(
      heading: 'How to protect against Cough?',
      details:
          'Protect against coughing by maintaining good respiratory hygiene, avoiding exposure to irritants, staying hydrated, and seeking medical attention for persistent or severe coughs.\n',
      name: 'Cough',
    ),
    SymptomsGuide(
      heading: 'How to protect against Cold?',
      details:
          'Protect against the common cold by practicing good hand hygiene, avoiding close contact with sick individuals, maintaining a strong immune system through a balanced diet and regular exercise, and considering vaccinations where appropriate.\n',
      name: 'Cold',
    ),
    SymptomsGuide(
      heading: 'How to plan Diet Plan',
      details:
          'Protect your health with a well-rounded diet plan by consulting a nutritionist or dietitian to tailor a plan that meets your specific needs, ensuring adequate intake of essential nutrients for overall well-being.\n',
      name: 'Diet Plan',
    ),
    SymptomsGuide(
      heading: 'Skin Specialist Treatment',
      details:
          'Protect your skin health by consulting a skin specialist regularly, following a suitable skincare routine, using sunscreen to prevent sun damage, and promptly addressing any skin concerns or conditions through professional guidance and treatments.\n',
      name: 'Skin Specialist',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Symptoms details'),
        // ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [Text('something '), Text('something ')],
        // ),
        body: ListView.builder(
          itemCount: symptomsGuide.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(symptomsGuide[index].heading,style: TextStyle(fontSize: 28),),
              subtitle: Text(symptomsGuide[index].details,style: TextStyle(fontSize: 24),),
              // leading: Text(
              //   symptomsGuide[index].name,
              // ),
            );
            // Column(
            //   children: [
            //     //          "Temperature",
            //     // "Snuffle",
            //     // "Fever",
            //     // "Cough",
            //     // "Cold",
            //     // "Diet Plan",
            //     // "Skin Specialist",
            //     Text(symptomsGuide[index].name),
            //     Text(symptomsGuide[index].heading),
            //     Text(symptomsGuide[index].details),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
