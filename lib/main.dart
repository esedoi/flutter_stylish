import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: LayoutBuilder(builder: (context, Constraints) {
          if (Constraints.maxWidth >= 601) {
            return HorizontalView();
          } else {
            return VerticalView();
          }
        }),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<CardItem> items = [
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
    CardItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2'),
  ];

  List<ProductItem> productList = [
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$999"),
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$980"),
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$970"),
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$991"),
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$999"),
    ProductItem(
        urlImg:
            'https://mixkit.imgix.net/art/preview/mixkit-desert-landscape-under-a-bright-sun-86-original-large.png?q=80&auto=format%2Ccompress&h=700&q=50&dpr=2',
        title: "UNIQLO 特級輕羽絨外套",
        subtitle: "NT\$999"),
  ];
}

class CardItem {
  final String urlImg;
  const CardItem({required this.urlImg});
}

Widget buildCard({
  required CardItem item,
}) =>
    Container(
        width: 200,
        child: Expanded(
            child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.urlImg,
              fit: BoxFit.cover,
            ),
          ),
        )));

class ProductItem {
  final String urlImg;
  final String title;
  final String subtitle;

  const ProductItem({
    required this.urlImg,
    required this.title,
    required this.subtitle,
  });
}

Widget buildProduct({
  required ProductItem item,
}) =>
    Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.network(
                  item.urlImg,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title),
                    SizedBox(
                      height: 8,
                    ),
                    Text(item.subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

class HorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        // title: Image.asset('images/stylish_logo.png',fit: BoxFit.cover),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/stylish_logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            // Container(
            //     padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 160,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                width: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) =>
                  buildCard(item: appState.items[index]),
            ),
          ),
          Expanded(
            child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text('男裝'),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, _) => SizedBox(
                      height: 12,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        buildProduct(item: appState.productList[index]),
                  ),
                ),
              ],
            )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
            children: [
              Text("女裝"),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, _) => SizedBox(
                    height: 12,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      buildProduct(item: appState.productList[index]),
                ),
              )
            ],
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  Text("配件"),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, _) => SizedBox(
                    height: 12,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      buildProduct(item: appState.productList[index]),
                    ),
                  )
                ],
              ),
            ),
          ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        // title: Image.asset('images/stylish_logo.png',fit: BoxFit.cover),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/stylish_logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            // Container(
            //     padding: const EdgeInsets.all(8.0), child: Text('YourAppTitle'))
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 160,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                width: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) =>
                  buildCard(item: appState.items[index]),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              scrollDirection: Axis.vertical,
              children: [
                ExpansionTile(title: Text('男裝'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, _) => SizedBox(
                            height: 12,
                          ),
                    itemCount: appState.productList.length,
                    itemBuilder: (context, index) {
                      return buildProduct(item: appState.productList[index]);
                    },
                  ),
                ]),
                SizedBox(
                  height: 12,
                ),
                ExpansionTile(title: Text('女裝'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, _) => SizedBox(
                            height: 12,
                          ),
                    itemCount: appState.productList.length,
                    itemBuilder: (context, index) {
                      return buildProduct(item: appState.productList[index]);
                    },
                  ),
                ]),
                SizedBox(
                  height: 12,
                ),
                ExpansionTile(title: Text('配件'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: appState.productList.length,
                    separatorBuilder: (context, _) => SizedBox(
                            height: 12,
                          ),
                    itemBuilder: (context, index) {
                      return buildProduct(item: appState.productList[index]);
                    },
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
