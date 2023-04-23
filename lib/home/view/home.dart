import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_obj.dart';
import '../../product_detail/view/detail_page.dart';
import '../bloc/home_bloc.dart';

Widget buildCard({
  required Product product,
}) =>
    Container(
        width: 200,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.mainImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ));

Widget buildProduct({
  required BuildContext context,
  required Product product,
}) =>
    Material(
      child: Ink(
        decoration: BoxDecoration(
            // ...
            ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product: product),
              ),
            );
          },
          child: Container(
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
                        product.mainImage ?? '',
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
                          Text(product.title ?? ''),
                          SizedBox(
                            height: 8,
                          ),
                          Text(product.price.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

class HorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/stylish_logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      
            if (state is DataLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is DataLoadedState) {
              return SizedBox(
                height: 160,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemCount: state.hotProducts.length,
                  itemBuilder: (context, index) =>
                      buildCard(product: state.hotProducts[index]),
                ),
              );
            }
            return Text("Something went wrong,sta =  ${state}!");
          }),
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
                      child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                    
                        if (state is DataLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is DataLoadedState) {
                          return ListView.separated(
                            padding: EdgeInsets.all(16),
                            scrollDirection: Axis.vertical,
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, _) => SizedBox(
                              height: 12,
                            ),
                            itemCount: state.menProducts.length,
                            itemBuilder: (context, index) {
                              return buildProduct(
                                  context: context,
                                  product: state.menProducts[index]);
                            },
                          );
                        }
                        return const Text('Something went wrong!');
                      }),
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
                        child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                    
                          if (state is DataLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          if (state is DataLoadedState) {
                            
                            return ListView.separated(
                              padding: EdgeInsets.all(16),
                          scrollDirection: Axis.vertical,
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, _) => SizedBox(
                                height: 12,
                              ),
                              itemCount: state.womenProducts.length,
                              itemBuilder: (context, index) {
                                return buildProduct(
                                    context: context,
                                    product: state.womenProducts[index]);
                              },
                            );
                          }
                          return const Text('Something went wrong!');
                        }),
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
                        child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                    
                          if (state is DataLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          if (state is DataLoadedState) {
                            return ListView.separated(
                              padding: EdgeInsets.all(16),
                          scrollDirection: Axis.vertical,
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, _) => SizedBox(
                                height: 12,
                              ),
                              itemCount: state.accessoriesProducts.length,
                              itemBuilder: (context, index) {
                                return buildProduct(
                                    context: context,
                                    product: state.accessoriesProducts[index]);
                              },
                            );
                          }
                          return const Text('Something went wrong!');
                        }),
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/stylish_logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            
            if (state is DataLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is DataLoadedState) {
              return SizedBox(
                height: 160,
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemCount: state.hotProducts.length,
                  itemBuilder: (context, index) =>
                      buildCard(product: state.hotProducts[index]),
                ),
              );
            }
            return Text("Something went wrong,sta =  ${state}!");
          }),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              scrollDirection: Axis.vertical,
              children: [
                ExpansionTile(title: Text('男裝'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),

                  //
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    if (state is DataLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is DataLoadedState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, _) => SizedBox(
                          height: 12,
                        ),
                        itemCount: state.menProducts.length,
                        itemBuilder: (context, index) {
                          return buildProduct(
                              context: context, product: state.menProducts[index]);
                        },
                      );
                    }
                    return const Text('Something went wrong!');
                  }),
                ]),
                SizedBox(
                  height: 12,
                ),
                ExpansionTile(title: Text('女裝'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            
                    if (state is DataLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is DataLoadedState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, _) => SizedBox(
                          height: 12,
                        ),
                        itemCount: state.womenProducts.length,
                        itemBuilder: (context, index) {
                          return buildProduct(
                              context: context, product: state.womenProducts[index]);
                        },
                      );
                    }
                    return const Text('Something went wrong!');
                  }),
                ]),
                SizedBox(
                  height: 12,
                ),
                ExpansionTile(title: Text('配件'), children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  
                    if (state is DataLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is DataLoadedState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, _) => SizedBox(
                          height: 12,
                        ),
                        itemCount: state.accessoriesProducts.length,
                        itemBuilder: (context, index) {
                          
                          return buildProduct(
                              context: context, product: state.accessoriesProducts[index]);
                        },
                      );
                    }
                    return const Text('Something went wrong!');
                  }),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
