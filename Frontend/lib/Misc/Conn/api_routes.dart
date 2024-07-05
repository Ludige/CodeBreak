class APIRoutes {
  static String apiUrl = 'http://192.168.18.55:7778';


  static String createProfile = '/profile/create';
  static String followProfileById = '/profile/follow';
  static String updateProfileByToken = '/profile/update';
  static String updateProfileById = '/profile/getProfileByToken';

  static String getProfileByIdId(id) {
    return '/profile/getById/$id';
  }

  static String deleteProfileById(id) {
    return '/profile/deleteById/$id';
  }

  //Exercices
  static String getAllExercice = '/exercice/getAll';
  
  static String getExerciceByIdId(id) {
    return '/exercice/getById/$id';
  }

  //Lesson
  static String getLessonById(id) {
    return '/lesson/deleteById/$id';
  }
}