part of'../view.dart';
class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:SafeArea(
        child:   BlocConsumer<AdminCubit, HomeStates>(listener: (context, state) {
          // if (state is CreateProductsSuccess) {
          //   // MagicRouter.navigateAndReplacement(Login());
          //   image = null;
          //   HomeCubit.get(context).image = null;
          // }
        }, builder: (context, state) {
          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                // SizedBox(
                //   height: 30.h,
                // ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              const SimpleDialogOption(
                                child: Text('Pick Photo'),
                              ),
                              SimpleDialogOption(
                                child: InkWell(
                                    onTap: () async {
                                      await AdminCubit.get(context)
                                          .pickFromGallery(context);
                                    },
                                    child: const Text('Pick From Gallery')),
                              ),
                              SimpleDialogOption(
                                child: InkWell(
                                    onTap: () async {
                                      await AdminCubit.get(context)
                                          .pickFromCamera(context);
                                    },
                                    child: const Text('Pick From Camera')),
                              ),
                            ],
                          );
                        });
                  },
                  child: AdminCubit.get(context).image == null
                      ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.w, ),
                    child: Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: .5.w,
                            style: BorderStyle.solid,
                          )),
                      child: const Center(
                        child: Icon(
                          Icons.add_box_rounded,
                          size: 40,
                          color: Color(0xFFC3D61B),
                        ),
                      ),
                    ),
                  )
                      : Container(
                    height: 300.h,
                    width: 500.w,
                    child: Image.file(
                      AdminCubit.get(context).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: AdminCubit.get(context).controllerName,
                          name: 'Title',
                          hintText: 'Enter Title ',
                        ),
                        CustomTextField(
                          controller: AdminCubit.get(context).controllerPrice,
                          name: 'Price',
                          hintText: 'Enter Price',
                        ),
                        CustomTextField(
                          controller: AdminCubit.get(context).controllerDes,
                          name: 'Describe',
                          hintText: 'Enter Product Describe ',
                          lines: 3,
                          height: 160.h,
                        ),
                      ],
                    )),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomButton(
                    function: () {
                      // print('prooooooooo');
                      // print(HomeCubit.get(context).controllerName.text);
                      // print(HomeCubit.get(context).controllerPrice.text);
                      // print(HomeCubit.get(context).controllerDes.text);
                      // print(HomeCubit.get(context).img1.toString());
                      // print(HomeCubit.get(context).image.toString());
                      // if (formKey.currentState!.validate()) {
                      String fileName =
                          AdminCubit.get(context).image!.path.split('/').last;
                      var img = MultipartFile.fromFile(
                          AdminCubit.get(context).image!.path,
                          filename: fileName);
                      print(img.toString());
                      AdminCubit.get(context).addProduct(CreatePro(
                        title: 'vvvvv',
                        price: 220,
                        categoryId: 1000,
                        description: 'dddddd',
                        images: ['https://th.bing.com/th/id/OIP.1YM53mG10H_U25iPjop83QHaEo?pid=ImgDet&rs=1'],
                      ));
                    },
                    text: 'Create Product',
                    height: 70.h,
                    colortext: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      )
    );
  }
}
