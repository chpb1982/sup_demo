import 'package:flutter/material.dart';
import 'package:sup_demo/models/get_sup.dart';
import 'package:sup_demo/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SuppliersGet>? sup;
  var isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    sup = await RemoteService().getSup();
    if (sup != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search for something',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt)),
            ),
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: sup?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sup![index].supId.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          sup![index].supNameEn,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          sup![index].supCode,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
