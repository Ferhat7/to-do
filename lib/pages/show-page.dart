import 'package:flutter/material.dart';


class ShowPage extends StatefulWidget {


  const ShowPage

  ({super.key, this.uuid,this.title});

  final title;
  final uuid;


  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {

TextEditingController _title=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: const Text("TODO"),


        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),


      body: Center(
        child: Form(

          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task Name',

                    ),

                  ),

                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(),

                      prefixIcon: Icon(Icons.calendar_month),
                      labelText: 'Date',

                    ),
                    onTap: () {

                      _selectDate(context);
                    },

                  ),
                ),


                Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(


                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        border: OutlineInputBorder(),
                          labelText:'Note',




                      ),
                      maxLines: 10,
                      minLines: 10,
                    ),
                  ),
                ),
                Container(

                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                      child: const Text('SAVE'),

                      onPressed: () {



                          }),
                  ),



              ],
            ),


          ),
        ),

      ),);
  }

  _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime(2022, 08, 08),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );

}

}