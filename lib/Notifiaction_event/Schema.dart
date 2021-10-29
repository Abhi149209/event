class UserData{
  late final String description;
  late final String name;
  late final String uniqueId;
  late final String topic;
  late final int date;
  late final int time;
  late final int tenure;
  UserData(
  {required this.description,required this.name,required this.uniqueId,required this.date,required this.tenure,required this.time,required this.topic});
  factory UserData.fromRTDB(Map<String,dynamic> data){
    return UserData(
      description:data['description'] ?? 'Drink',
      name: data['name'] ?? "jon",
      uniqueId: data['uniqueId'] ?? 'me19112',
      topic: data['topic'] ?? 'lorem ipsum',
      time: data['time'] ?? 1245,
      tenure: data['tenure'] ?? 2,
      date: data['date'] ?? 5444
    );
  }









}