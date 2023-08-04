part of '../view.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({Key? key}) : super(key: key);

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  List foundUsers = [];

  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = AdminCubit.get(context).productList;
    } else {
      results = AdminCubit.get(context)
          .productList
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      foundUsers = results;
      print('daaaaa1111111111${foundUsers.length}');
    });
  }

  @override
  void initState() {
    AdminCubit.get(context).productList.length;
    AdminCubit.get(context).getProduct();
    //  foundUsers = AdminCubit.get(context).productList;
    //  AdminCubit.get(context).productList;
    print('daaaaa  ${AdminCubit.get(context).productList.length}');
    // print('daaaaa  ${foundUsers.length}');
    print('dataaa');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: SafeArea(
              child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 3, 8, 0),
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      onChanged: (value) => _runFilter(value),
                      // readOnly: true,
                      // autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 20,
                            )),
                        label: const Center(
                          child: Text(
                            'Products',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                BlocConsumer<AdminCubit, HomeStates>(
                    builder: (context, state) {
                      return state is GetProductsSuccess
                          ? Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                height: .9.sh,
                                width: double.infinity,
                                child: GridView.builder(
                                    itemCount: AdminCubit.get(context)
                                        .productList
                                        .length,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: .65,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          badges.Badge(
                                            position:
                                                const badges.BadgePosition(
                                              top: 0,
                                              end: 1,
                                            ),
                                            badgeColor: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            badgeContent: InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return SimpleDialog(
                                                        title: const Text(
                                                            'Sure Delete......'),
                                                        children: [
                                                          SimpleDialogOption(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'Cancel')),
                                                          ),
                                                          SimpleDialogOption(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  AdminCubit.get(
                                                                          context)
                                                                      .deleteProduct(
                                                                    state.productList[
                                                                            index]
                                                                        ['id'],
                                                                    context,
                                                                  )
                                                                      .then(
                                                                          (value) async {
                                                                    await AdminCubit.get(
                                                                            context)
                                                                        .getProduct();
                                                                    Navigator.pop(
                                                                        context);
                                                                  }).catchError(
                                                                          (onError) {
                                                                    print(onError
                                                                        .toString());
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    'Delete')),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: 600.h,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green[200],
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(7),
                                                        bottomRight:
                                                            Radius.circular(7),
                                                      )),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              child: Container(
                                                                height: 100.h,
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        border: Border.all(
                                                                            color: Colors
                                                                                .transparent),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                2),
                                                                        color: Colors.grey[
                                                                            200],
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          image: NetworkImage(AdminCubit.get(context).productList[index]['images'][0] == null
                                                                              ? 'https://img.freepik.com/free-vector/error-404-landing-page-flat-style_52683-16151.jpg?w=1060&t=st=1691181318~exp=1691181918~hmac=70d8fb34e028cdc8c4633ca4eb4373fd2d33a4ff147ba49d6ee156f692812ff2'
                                                                              : AdminCubit.get(context).productList[index]['images'][0].toString()),
                                                                        )),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                const Text(
                                                                  'id: ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  AdminCubit.get(
                                                                          context)
                                                                      .productList[
                                                                          index]
                                                                          ['id']
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                const Text(
                                                                  'Name:',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Container(
                                                                  height: 20.h,
                                                                  width: 1.sw,
                                                                  child: Text(
                                                                    AdminCubit.get(
                                                                            context)
                                                                        .productList[
                                                                            index]
                                                                            [
                                                                            'title']
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Price:  ',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .green,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                Text(
                                                                    AdminCubit.get(
                                                                            context)
                                                                        .productList[
                                                                            index]
                                                                            [
                                                                            'price']
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                const Text(
                                                                  'Description:',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                FittedBox(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        80.h,
                                                                    width:
                                                                        150.w,
                                                                    child: Text(
                                                                      AdminCubit.get(
                                                                              context)
                                                                          .productList[
                                                                              index]
                                                                              [
                                                                              'description']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontSize: 10
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                height: .9.sh,
                                width: double.infinity,
                                child: GridView.builder(
                                    itemCount: 4,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: .7,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return Shimmer.fromColors(
                                        enabled: true,
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[400]!,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: 400.h,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.green[200],
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(7),
                                                        bottomRight:
                                                            Radius.circular(7),
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            );
                    },
                    listener: (context, state) {}),
              ],
            ),
          )),
        ));
  }
}
