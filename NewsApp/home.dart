import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerwidget/provider/counter_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
CounterProvider ob=CounterProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("ProviderWidget",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange),)),
      backgroundColor: Colors.yellow,),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counting Result is : ${context.watch<CounterProvider>().count} "),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(onPressed: (){
                context.read<CounterProvider>().incrementCount();
              },
                child: Icon(Icons.add,color: Colors.red),backgroundColor: Colors.greenAccent,),

              FloatingActionButton(onPressed: (){
                context.read<CounterProvider>().decrementCount();
              },
                child: Icon(Icons.exposure_minus_1,color: Colors.black),backgroundColor: Colors.greenAccent,)
            ],



          )

        ],
      ),
    );
  }
}
