part of'../view.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 50.h,
        width: 350.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 1,
                color: Colors.grey.withOpacity(.1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                size: 25.r,
                color: Colors.grey,
              ),
              label: Text(
                '     Que quieres comer hoy?',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              border: InputBorder.none),
        ));
  }
}
