angular.module "foxrey"
  .service 'AuthService', ($cookies, $http, Restangular) ->

    class AuthService

      @status =
        autorized: false
  
      @loginByCred = (cred) ->
  
        Restangular
            .all 'login'
            .post cred
            .then (response) =>
              @loginByToken response.token
  
      @loginByToken = (token) ->
  
        $http.defaults.headers.common['token'] = token
  
        Restangular
            .one 'users'
            .get()
            .then (response) ->
              $cookies.accessToken = token
              @status.autorized = true
              console.log response
              return response
  
      @logout = () ->
  
        Restangular
            .all 'logout'
            .get()
            .then () =>
              @status.autorized = false
              $cookies.accessToken = ''