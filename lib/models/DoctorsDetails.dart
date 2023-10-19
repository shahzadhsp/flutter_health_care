// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorsDetails {
  late String image;
  String name;
  String speciality;
  String rating;
  String? about;
  DoctorsDetails({
    required this.image,
    required this.name,
    required this.speciality,
    required this.rating,
     this.about
  });
}
