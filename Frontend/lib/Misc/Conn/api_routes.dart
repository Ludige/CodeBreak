class APIRoutes {
  static String apiUrl = 'http://192.168.18.55:7778';

  static String createProfile = '/profile/create';
  static String updateProfileByToken =
      '/profile/getProfileByToken'; //TODO implementar

  static String getProfileById(String id) {
    return '/profile/getById/66870325e2941cd763b32621';
  }

  static String followProfileById(followObjectId) {
    return '/profile/follow/:$followObjectId';
  }

  static String deleteProfileById(id) {
    return '/profile/deleteById/:$id';
  }

  //Exercices
  // static String getAllExercice = '/exercice/getAll';

  static String getExerciceById(id) {
    return '/exercice/getById/:$id';
  }

  //TODO criar rota de exercicio especifico

  //Lesson
  static String getLessonById(id) {
    return '/lesson/deleteById/:$id';
  }
}
