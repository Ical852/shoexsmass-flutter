//@dart=2.9

class FileModel {
  String uri;
  String name;
  String type;

  FileModel.settup(String uri, String name, String type) {
    this.uri = uri;
    this.name = name;
    this.type = type;
  }
}