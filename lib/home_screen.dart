import 'package:api_integration_flutter/constants.dart';
import 'package:api_integration_flutter/photo_model.dart';
import 'package:api_integration_flutter/surah_model.dart';
import 'package:flutter/material.dart';

import 'networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SurahModel> getSurah() async {
    NetworkHelper networkHelper = NetworkHelper(surahAPIUrl);
    var surahJsonData = await networkHelper.getData();
    print('Data: ${surahJsonData['data'][1]['name']}');
    SurahModel surahModel = SurahModel.fromJson(surahJsonData);
    print(surahModel);
    print(surahModel.code);
    print(surahModel.data![1].name);
    return surahModel;
  }

  Future<List<PhotoModel>> getPhotos() async {
    List<PhotoModel> photosList = [];
    NetworkHelper networkHelper = NetworkHelper(photoAPIUrl);
    var photoJsonData = await networkHelper.getData();
    print(photoJsonData);

    for (var item in photoJsonData) {
      PhotoModel photoModel = PhotoModel.fromJson(item);
      photosList.add(photoModel);
    }
    print(photosList);
    return photosList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //Surah List
          Expanded(
            child: FutureBuilder(
              future: getSurah(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final surahModel = snapshot.data;
                  return ListView.builder(
                    itemCount: surahModel!.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            surahModel!.data![index].englishName!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            surahModel!.data![index].revelationType!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          leading: Icon(Icons.mosque),
                          trailing: Text(
                            surahModel!.data![index].name!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        //
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error');
                }
                return Text('Loading...');
              },
            ),
          ),
          //Photo List
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot!.data![index].url!),
                            ),
                            title: Text(snapshot!.data![index].title!),
                            subtitle:
                                Text(snapshot!.data![index].id!.toString()),
                          ),
                        );
                      });
                }
                if (snapshot.hasError) {
                  return Text('Error');
                }
                return Text('Loading...');
              },
            ),
          ),
        ],
      ),
    );
  }
}
