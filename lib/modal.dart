class Modal {
  final double waterexcbef;
  final double waterexcaft;
  final int cropprodbef;
  final int cropprodaft;

  Modal(this.waterexcbef, this.waterexcaft, this.cropprodbef, this.cropprodaft);

  Modal.fromMap(Map<String, dynamic> map)
      : assert(map['waterexcbef'] != null),
        assert(map['waterexcaft'] != null),
        assert(map['cropprodbef'] != null),
        assert(map['cropprodaft'] != null),
        waterexcbef = map['waterexcbef'],
        waterexcaft = map['waterexcaft'],
        cropprodbef = map['cropprodbef'],
        cropprodaft = map['cropprodaft'];

  @override
  String toString() =>
      "Record<$waterexcbef:$waterexcaft:$cropprodbef:$cropprodaft>";
}
