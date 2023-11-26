class UserInformation {
  String name;
  String? email;
  final int introModuleQuizScore;
  int malwareModuleQuizScore;
  int threatModuleQuizScore;
  int iotAIModuleQuizScore;
  int cyberLawModuleQuizScore;
  int ethicalHackingModuleQuizScore;

  UserInformation(
      {required this.name,
      required this.email,
      required this.introModuleQuizScore,
      required this.malwareModuleQuizScore,
      required this.threatModuleQuizScore,
      required this.iotAIModuleQuizScore,
      required this.cyberLawModuleQuizScore,
      required this.ethicalHackingModuleQuizScore});
}
