import './image_set_content_model.dart';
import './image_set_model.dart';

ImageSetContentModel checkImageIsNull(ImageSetContentModel iscm) {
  String _1x = "";
  String _2x = "";
  String _3x = "";

  for (var each in iscm.images) {
    if (each.scale == '1x') {
      _1x = each.filename != null ? each.filename.trim() : "";
    } else if (each.scale == '2x') {
      _2x = each.filename != null ? each.filename.trim() : "";
    } else if (each.scale == '3x') {
      _3x = each.filename != null ? each.filename.trim() : "";
    }
  }

  final bool a = _1x.length ^ 0 != 0;
  final bool b = _2x.length ^ 0 != 0;
  final bool c = _3x.length ^ 0 != 0;

  if (a && b && c) {
    return iscm;
  } else if (a && b) {
    _3x = _2x;
  } else if (b && c) {
    _1x = _2x;
  } else if (a && c) {
    _2x = _3x;
  } else if (a) {
    _2x = _3x = _1x;
  } else if (b) {
    _1x = _3x = _2x;
  } else if (c) {
    _1x = _2x = _3x;
  } else {
    return ImageSetContentModel(images: null, info: null);
  }

  ImageSetContentModel result = ImageSetContentModel(images: [
    ImageSetModel(filename: _1x, idiom: "universal", scale: "1x"),
    ImageSetModel(filename: _2x, idiom: "universal", scale: "2x"),
    ImageSetModel(filename: _3x, idiom: "universal", scale: "3x"),
  ], info: iscm.info);

  return result;
}