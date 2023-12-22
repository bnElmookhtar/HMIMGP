import 'package:flutter/material.dart';
import 'package:hmimgp/src/constants/colors.dart';
import '../constants/lengths/margines_paddings.dart';

class BestProjectCard extends StatelessWidget {
  const BestProjectCard({
    super.key, required this.projectName, required this.projectImgPath, this.onPressed,
  });
  final String projectName ;
  final String projectImgPath ;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
          width: gWidth(context, 0.2),
          height: gHeight(context, 0.4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child:Column(
            children: [
              Container(
                width: gWidth(context, 0.3),
                height: gHeight(context, 0.3),
                decoration: BoxDecoration(
                    borderRadius:const  BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(projectImgPath),fit: BoxFit.cover,
                    )
                ),
              ),
              Container(
                width: gWidth(context, 0.3),
                height: gHeight(context, 0.1),
                padding: EdgeInsetsDirectional.symmetric(vertical: paddingHeight(context, 0.001),horizontal: paddingWidth(context, 0.01)),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                  color: deepBlue,
                ),
                child: Center(child: Text(projectName,maxLines:2 ,textAlign: TextAlign.center,overflow:TextOverflow.ellipsis,style:Theme.of(context).textTheme.headlineSmall),),
              ),
            ],
          )
      ),
    );
  }
}