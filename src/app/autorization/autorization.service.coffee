angular.module "foxrey"
  .service 'AuthService', ($cookies, $http, Restangular) ->

    class AuthService
      self = this

      this.status =
        autorized: false
  
      this.loginByCred = (cred) ->
  
        Restangular
            .all 'login'
            .post cred
            .then (response) ->
              console.log response.token
              self.loginByToken response.token
  
      this.loginByToken = (token) ->
  
        $http.defaults.headers.common['X-Token'] = token
  
        Restangular
            .all 'users'
            .get()
            .then (response) ->
            $cookies.accessToken = token
            self.status.autorized = true
            return response
  
      this.logout = () ->
  
        Restangular
            .all 'logout'
            .get()
            .then () ->
              self.status.autorized = false
              $cookies.accessToken = ''