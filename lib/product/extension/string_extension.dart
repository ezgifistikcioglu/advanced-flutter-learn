extension ColorStringExtension on String? {
//computed bir değer, yani çağırıldığında çalışacak o yüzden getter yazıyoruz
  int get colorValue {
    // Bu kısmın amacı request data'dan color'ın  bu "#98B2D1" formatta gelmesi
    //Ama hex kodları flutterda "0xff" bu şekilde
    var _newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.parse(_newColor);
  }
}
