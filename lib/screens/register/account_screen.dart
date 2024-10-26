import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: Padding(
        padding: const EdgeInsets.only(right: 50, left: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            const Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Username"),
                  Text("Haresh"),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 50,),
            const Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  Text("example@gmail.com"),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 50,),
            const Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone"),
                  Text("030-12345678"),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 50,),
            const Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gender"),
                  Text("Male"),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 50,),
            const Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Adress"),
                  Text("Hyderabad"),
                ],
              ),
            ),
            const Divider(),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff00A9B8),),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Edit Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),),),
          ],
        ),
      )),
    );
  }
}
