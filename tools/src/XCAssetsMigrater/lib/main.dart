import "dart:io";
import 'dart:convert';
import 'package:path/path.dart';
import 'package:args/args.dart';
import 'package:async/async.dart';

import './image_set_content_model_helper.dart';
import './image_set_content_model.dart';
import './directory_helper.dart';
import './variable_helper.dart';

class CommandLineModel {
  String input;
  String output;
  String assetPrefix;
  String classSrcFile;
  CommandLineModel(
      {this.input, this.output, this.assetPrefix, this.classSrcFile});
}

void printWarning() {
  print("============================================================================\n" +
          "前方ハイエナ-ジの!前方ハイエナ-ジの!前方ハイエナ-ジの!前方ハイエナ-ジの!\n" +
        "============================================================================\n");
}

void main(List<String> argv) {

  var cmdParser = ArgParser();
  cmdParser
    ..addOption('input', abbr: 'i')
    ..addOption('output', abbr: 'o')
    ..addOption('asset-prefix', abbr: 'p', defaultsTo: "assets/")
    ..addOption('source', abbr: 's', defaultsTo: "constant_images.dart");

  final result = cmdParser.parse(argv);
  final cmdline = CommandLineModel(
      input: result['input'],
      output: result['output'],
      assetPrefix: result['asset-prefix'],
      classSrcFile: result['source']);

  printWarning();

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

  final List<String> allImagesetPaths = scanDirectory(
      cmdline.input,
      (path) => (false == FileSystemEntity.isFileSync(path) &&
          path.endsWith('.imageset')));

  FutureGroup fg = FutureGroup();
  StringBuffer yamlStrBuf = StringBuffer();
  StringBuffer outSrcStrBuf = StringBuffer();

  outSrcStrBuf.write(
    "import 'dart:core';\n" 
    + "\n" 
    + "class Images {\n"
  );
  
  final int totalImagesCount = allImagesetPaths.length;
  var idx = 1;
  
  print('There are ${allImagesetPaths.length} images in Xcode image assets.');
  
  for (var each in allImagesetPaths) {
    final List<String> eachPathComponents = each.split("/");
    final String imageAssetName =
        basenameWithoutExtension(eachPathComponents.last);
    final File contentFile = File("${each}/Contents.json");
    String extName = "";

     print("Processing ${imageAssetName}");

    fg.add(contentFile
        .readAsString()
        .then((String content) => JsonDecoder().convert(content))
        .then((dynamic json) =>
            ImageSetContentModel.fromJson(json as Map<String, dynamic>))
        .then((dynamic isc) {
      ImageSetContentModel imageSetContent =
          checkImageIsNull(isc as ImageSetContentModel);

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
      yamlStrBuf.write(normalize("- ${cmdline.assetPrefix}/${imageAssetName}${extName}\n"));
      outSrcStrBuf.write("  static const String ${normalizeVariableName(imageAssetName)} = \"${cmdline.assetPrefix}/${imageAssetName}${extName}\";\n");
  
      print('[${idx}/${totalImagesCount}] Process ... ${imageAssetName}');
      idx++;
    }));
  }

  fg.future
      .then((List<dynamic> completer) => outSrcStrBuf.write("}\n"))
      .then((dynamic any) => yamlAssetFile.writeAsString(yamlStrBuf.toString()))
      .then((dynamic any) => print("YAML file - DONE?"))
      .then((any) => constantSrcFile.writeAsString(outSrcStrBuf.toString()))
      .then((dynamic any) => print("Constant source file - DONE?"));

  fg.close();

  print("Waiting...");
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

