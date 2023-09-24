import 'package:flutter/material.dart';
import 'package:store_app/api/profile_api.dart';
import 'package:store_app/models/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profile;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    ProfileAPI.getProfile().then((profileFromServer) => {
          setState(() {
            profile = profileFromServer;
            isLoading = false;
          })
        });
  }

  Widget profileInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 150,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6XCPtY8YFoU2RiexHhYiyh18y8genGEEUhMcSHXoGjKyf1Up6dGreFftkh_e8M1k9Ucw&usqp=CAU"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${profile.name["firstname"]} ${profile.name["lastname"]}",
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Username : ${profile.username}",
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text(
                "Email",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                profile.email,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                profile.phone,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.place),
              title: const Text(
                "User Address",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                "Number : ${profile.address["number"]}\nCity : ${profile.address["city"]}\nStreet : ${profile.address["street"]}\nZipcode : ${profile.address["zipcode"]} ",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Latitude : ${profile.address["geolocation"]["lat"]}",
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          Text(
            "Longitude : ${profile.address["geolocation"]["long"]}",
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Profile'),
        ),
        body: Container(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : profileInfo()));
  }
}
