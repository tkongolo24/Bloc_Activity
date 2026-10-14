
import 'package:bloc_state/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Press the button to change the counter value",
            ),
            BlocBuilder(
              bloc: counterBloc,
              builder: (context, counter) {
                return Text("$counter",
                style: TextStyle(fontSize: 50),);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Icon(
                Icons.skip_next,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        counterBloc.add(IncrementCounter());
      },
      child: Icon(Icons.add),),
    );
  }
}
