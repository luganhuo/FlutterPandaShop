import 'dart:convert';
import "dart:io";
import 'package:path/path.dart';
import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:xcassets_migrater/image_set_model.dart';
import './image_set_content_model.dart';

typedef FilterCallback = bool Function(String word);

class CommandLineModel {
  String input;
  String output;
  String assetPrefix;
  String classSrcFile;
  CommandLineModel(
      {this.input, this.output, this.assetPrefix, this.classSrcFile});
}

void main(List<String> argv) {
  print(argv);

  var cmdParser = ArgParser();
  cmdParser
    ..addOption('input', abbr: 'i')
    ..addOption('output', abbr: 'o')
    ..addOption('asset-prefix', abbr: 'p', defaultsTo: "assets/")
    ..addOption('source', abbr: 's', defaultsTo: "constant_images.dart");

  List<String> yamlAssetIDList = [];
  // List<String> constSrcList = [];

  final result = cmdParser.parse(argv);
  final cmdline = CommandLineModel(
      input: result['input'],
      output: result['output'],
      assetPrefix: result['asset-prefix'],
      classSrcFile: result['source']);

  if (cmdline.output.endsWith("/") == true) {
    cmdline.output =
        cmdline.output.replaceRange(cmdline.output.length - 1, null, "");
  }

  final File yamlAssetFile = File("${cmdline.output}/yaml/assetSpec.yaml");
  if (yamlAssetFile.existsSync() == false) {
    yamlAssetFile.createSync(recursive: true);
  }

  final File constantSrcFile =
      File("${cmdline.output}/src/${cmdline.classSrcFile}");
  if (constantSrcFile.existsSync() == false) {
    constantSrcFile.createSync(recursive: true);
  }

  final List<String> allImagesetPaths = _scanDirectory(
      cmdline.input,
      (path) => (false == FileSystemEntity.isFileSync(path) &&
          path.endsWith('.imageset')));

  FutureGroup fg = FutureGroup();
  StringBuffer outSrcStrBuf = StringBuffer();

  for (var each in allImagesetPaths) {
    final List<String> eachPathComponents = each.split("/");
    final String imageAssetName =
        basenameWithoutExtension(eachPathComponents.last);
    final File contentFile = File("${each}/Contents.json");
    String extName = "";

    // print("Processing ${imageAssetName}");

    fg.add(contentFile
        .readAsString()
        .then((String content) => JsonDecoder().convert(content))
        .then((dynamic json) =>
            ImageSetContentModel.fromJson(json as Map<String, dynamic>))
        .then((dynamic isc) {
      ImageSetContentModel imageSetContent = _checkImageIsNull(isc as ImageSetContentModel);

      for (var eachImage in imageSetContent.images) {
        if (eachImage.filename != null && eachImage.filename.length > 0) {
          var outFileName = eachImage.filename;
          extName = extension(outFileName);

          if (eachImage.scale == "1x") {
            outFileName = eachImage.filename.replaceAll(RegExp(r'@1x'), "");
            outFileName =
                normalize("${cmdline.output}/${imageAssetName}${extName}");
          } else if (eachImage.scale == "2x") {
            outFileName = eachImage.filename.replaceAll(RegExp(r'@2x'), "");
            outFileName =
                normalize("${cmdline.output}/2.0x/${imageAssetName}${extName}");
          } else if (eachImage.scale == "3x") {
            outFileName = eachImage.filename.replaceAll(RegExp(r'@3x'), "");
            outFileName =
                normalize("${cmdline.output}/3.0x/${imageAssetName}${extName}");
          } else {
            continue;
          }
          _copy("${each}/${eachImage.filename}", outFileName);
        }
      }
      // TASK: asset id in yaml for flutter.
      yamlAssetIDList.add(normalize("${cmdline.assetPrefix}/${imageAssetName}${extName}"));
      outSrcStrBuf.write("  static String get ${imageAssetName} => \"${imageAssetName}\";\n");
      print('Process.... ${imageAssetName}');
    }));
  }

  fg.future
    .then((List<dynamic> completer) => yamlAssetFile.writeAsString(yamlAssetIDList.join("\n")))
    .then((dynamic any) => print("YAML file - DONE?"))
    .then((any) => constantSrcFile.writeAsString(outSrcStrBuf.toString()))
    .then((dynamic any) => print("Constant source file - DONE?"));
  
  fg.close();

  print("Waiting...");
}

List<String> _scanDirectory(String base, FilterCallback filter) {
  List<String> result = List<String>();
  try {
    var dir = new Directory(base);
    List<FileSystemEntity> files = dir.listSync();

    for (final eachFile in files) {
      final curPath = eachFile.path;

      if (filter(curPath)) {
        result.add(curPath);
      }

      if (false == FileSystemEntity.isFileSync(curPath)) {
        result.addAll(_scanDirectory(curPath, filter));
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  return result;
}

void _copy(String source, String destination) {
  final File fileSource = File(source);

  if (FileSystemEntity.isFileSync(source) && fileSource.existsSync()) {
    final File fileDestination = File(destination);

    if (fileDestination.parent.existsSync() == false) {
      fileDestination.parent.createSync(recursive: true);
    }

    fileSource.copy(destination);
  }

  return;
}

ImageSetContentModel _checkImageIsNull(ImageSetContentModel iscm) {
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
