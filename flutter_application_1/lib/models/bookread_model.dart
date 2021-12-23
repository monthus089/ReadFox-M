class BookModel {
  String images;

  BookModel(
    this.images,
  );
}

List<BookModel> bookdata =
    bookData.map((item) => BookModel(item['images'])).toList();

var bookData = [
  {"images": "assets/images/03.png"},
  {"images": "assets/images/04.png"},
  {"images": "assets/images/05.png"},
  {"images": "assets/images/06.png"},
  {"images": "assets/images/07.png"},
  {"images": "assets/images/08.png"},
  {"images": "assets/images/09.png"},
  {"images": "assets/images/010.png"},
  {"images": "assets/images/011.png"},
  {"images": "assets/images/012.png"},
  {"images": "assets/images/013.png"},
  {"images": "assets/images/014.png"},
  {"images": "assets/images/015.png"},
  {"images": "assets/images/016.png"},
  {"images": "assets/images/017.png"},
  {"images": "assets/images/018.png"},
  {"images": "assets/images/019.png"},
  {"images": "assets/images/020.png"},
  {"images": "assets/images/021.png"},
  {"images": "assets/images/022.png"},
  {"images": "assets/images/023.png"},
];
