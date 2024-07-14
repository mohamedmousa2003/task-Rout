import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/SourceModel.dart';
import 'package:flutter_application_1/shared/custom_extension.dart';
import 'package:flutter_application_1/shared/newtwork_layer/api_manager.dart';

import '../../shared/core/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Products> product =[];
  @override
  void initState() {
  
    super.initState();
    var data=ApiManager.getAllProduct();
    product =data.then((value) => product=value.products ?? [],); 
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            Image.asset(
              "assets/images/title.png",
              fit: BoxFit.fill,
            ),
            19.height,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (e){},
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                      hintText: " what do you search for?",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: AppColors.primary, width: 1.5)),
                    ),
                  ),
                ),
                26.width,
                Image.asset("assets/images/icon_shopping cart_.png"),
              ],
            ),
            8.height,
           FutureBuilder<SourceModel>(
               future: ApiManager.getAllProduct(),
               builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.waiting) {
                   return  const Center(child: CircularProgressIndicator(
                     color: AppColors.primary,
                   ),
                   );
                 }
                 if(snapshot.hasError) {
                   return Center(child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(snapshot.hasError.toString(),style: theme.textTheme.bodyLarge,),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                               padding: EdgeInsets.all(8),
                               backgroundColor: AppColors.primary,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(8)
                               )
                           ),
                           onPressed: (){
                             print(ApiManager.getAllProduct());
                           },
                           child: Text("Try Again" ,style: theme.textTheme.bodySmall,)
                       ),
                     ],
                   ),);
                 }
                   if(snapshot.hasData) {
                     return Expanded(
                       child: GridView.builder(
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           mainAxisSpacing: 10,
                           crossAxisSpacing: 10,
                           childAspectRatio: 7/11,
                         ),
                         itemBuilder: (context, index) {
                           return Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: AppColors.primary,
                               ),

                           );
                         },),
                     );
                   }
                   return Container(
                     color: Colors.pink,
                     height: 50,
                     width: 50,
                   );
                 }
           )
          ],
        ),
      ),
    );
  }
}

/*

 Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 7/11,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.primary,
                      ),
                    );
                  },),
            )
 */