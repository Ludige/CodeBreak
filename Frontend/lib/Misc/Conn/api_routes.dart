class APIRoutes {
  //TODO> alterar para acesso remoto
  static String apiUrl = 'http://192.168.18.55:7778';
  //meu ip final  55: 192.168.18.55
  static String createProfile = '/profile/create';

  static String deleteProfileById(id) {
    return '/profile/deleteById/$id';
  }

  //Exercices
  static String getAllExercice = '/exercice/getAll';
}
