class APIRoutes {
  //TODO> alterar para acesso remoto
  static String apiUrl = 'http://localhost:7778';

  //Profile
  static String createProfile = '/profile/create';

  static String deleteProfileById(id) {
    return '/profile/deleteById/$id';
  }

  //Exercices
  static String getAllExercice = '/exercice/getAll';
  
}
