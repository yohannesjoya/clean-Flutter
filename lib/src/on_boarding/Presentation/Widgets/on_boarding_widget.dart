import 'package:flutter/material.dart';


class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.index,required this.title, required this.description, required this.imagePath});


  final String title,description,imagePath;
  final double index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: double.infinity, margin: const EdgeInsets.only(right: 20, top: 10),
            child: GestureDetector(onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const AuthScreen()));
              Navigator.of(context).pushNamedAndRemoveUntil("signin", (route) => false);

            }, child: const Text("skip", textAlign: TextAlign.right, style: TextStyle(color: Colors.white38),  ))),
        const Spacer(),
        Image.asset(imagePath, height: 250,),
        const SizedBox(height: 86,),
        // const Spacer(),
        Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.white),),
        const SizedBox(height: 16,),
        Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white38), ),
        // const SizedBox(height: 80,),
        // const Spacer(),
        // if (index==2) Text("start", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: Colors.white),),
        const Spacer(),
      ],
    );
  }
}