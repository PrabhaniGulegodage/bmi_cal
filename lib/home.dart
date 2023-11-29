import 'package:flutter/material.dart';
class BmiCal extends StatefulWidget {
  const BmiCal({Key? key}) : super(key: key);

  @override
  State<BmiCal> createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  int currentindex=0;
  String myAge ='';
  String result = '';
  String name = '';
  String address = '';
  TextEditingController inputController1 = new TextEditingController();
  TextEditingController inputController = new TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String myAge2='';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(
          'assetss/img2.jpg',),
            fit: BoxFit.cover
        ),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('BMI CALCULATOR',style: TextStyle(color: Colors.white),
          ),centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.purple,
          actions: [
            IconButton(onPressed: (){},
              icon: const Icon(Icons.settings,color: Colors.white,),
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.menu,color: Colors.white,),
            onPressed: () {  },
          ),

        ),
        body: SingleChildScrollView(

          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start ,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              TextFormField(
                controller: inputController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'name',
                  labelText: 'Name *',
                ),
                onSaved: (String? value) {

                },
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? '**invalid value**' : null;
                },
              ),
              TextFormField(
                controller: inputController1,
                decoration: const InputDecoration(
                  icon: Icon(Icons.add_location),
                  hintText: 'Address',
                  labelText: 'Address *',
                ),
                onSaved: (String? value) {

                },
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? '**invalid value**' : null;
                },
              ),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.height),
                  hintText: 'Height in cm',
                  labelText: 'Height *',
                ),

              ),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.monitor_weight_rounded),
                  hintText: 'Weight in kg',
                  labelText: 'Weight *',
                ),

              ),

              SizedBox(
                height: 25.0,
              ),



              Row(
                children: [

                  RadioButton('Male', Colors.purple, 0),
                  RadioButton('Female', Colors.purple, 1)
                ],
              ),
              SizedBox(
                height: 5.0,
              ),

              Column(


                children: [

                  ElevatedButton(onPressed: ()=> pickDob(),

                    style: ElevatedButton.styleFrom(primary: Colors.purple[900],shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    child: const Text('Pick your Date of Birth'),

                  ),

                  Center(child: const SizedBox(height: 5,)) ,

                ],
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: ()=> clearText(),

                    style: ElevatedButton.styleFrom(primary: Colors.purple[900],shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    child: const Text('Reset'),
                  ),

                  Center(child: const SizedBox(height: 5,)),
                ],),

              Container(

                width: double.infinity,
                height: 40.0,
                child: TextButton(
                  onPressed: (){
                    double height = double.parse(heightController.value.text);
                    double weight = double.parse(weightController.value.text);

                    calculateBmi(height, weight);
                    setState(() {
                      name=inputController.text;
                      address=inputController1.text;
                      myAge2=myAge;
                    });
                  },
                  style:TextButton.styleFrom(backgroundColor: Colors.purple[900],shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                  child: Text('Calculate',style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(7),
                color: Colors.grey[400],
                width: double.infinity,
                height: 35,
                child:Text('Your name is : $name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),

              ),
              Container(
                padding: EdgeInsets.all(7),
                color: Colors.grey[500],
                width: double.infinity,
                height: 35,
                child:Text('Your Address is : $address',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),

              ),
              Container(
                padding: EdgeInsets.all(7),
                color: Colors.grey[400],
                width: double.infinity,
                height: 35,
                child:Text('Your age is : $myAge2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),

              ),
              Container(
                padding: EdgeInsets.all(7),
                color: Colors.grey[500],
                width: double.infinity,
                height: 35,
                child:Text('Your BMI is : $result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),),

              ),


              SizedBox(
                height: 20.0,
              ),



            ],
          ),
        ),
      ),
    );

  }
  void calculateBmi(double height,double weight){
    double finalresult=weight/(height*height/10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result=bmi;

    });
  }

  void changeindex(int index){
    setState(() {
      currentindex=index;
    });
  }
  Widget RadioButton(String value,Color color,int index){
    return Expanded(child: Container(
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 12.0 ),
        child: TextButton(
          style: TextButton.styleFrom (backgroundColor: currentindex==index?color:Colors.white,
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              )),
          onPressed: (){
            changeindex(index);
          },
          child: Text(value,style: TextStyle(
            color: currentindex==index? Colors.white:color,
          ),),
        ),
      ),
    ),
    );
  }
  pickDob(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    ).then((pikedData){
      if(pikedData!=null){
        calculateAge(pikedData);
      }
    });

  }
  calculateAge(DateTime birth){
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years= age.inDays ~/ 365;
    int months=(age.inDays%365)~/ 30;
    int days = ((age.inDays%365)%30);
    setState(() {
      myAge='$years years,$months months and $days days';
    });
  }
  void clearText(){
    inputController1.clear();
    inputController.clear();
    heightController.clear();
    weightController.clear();
  }


}



