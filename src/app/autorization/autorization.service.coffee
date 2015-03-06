angular.module "foxrey"
  .service 'AuthService', ($cookies, $state, $rootScope, $http, $sessionStorage, Restangular) ->

    class AuthService

      @autorized = false

      @loginByCred = (cred) ->
  
        Restangular
            .all 'login'
            .post cred
            .then(
              ((response) =>
                $('.error-message').slideUp(200)
                @loginByToken response.token)
              ((response) -> $('.error-message').html(response.data.error).slideDown(200)))
              
      @loginByToken = (token) ->
        
        $http.defaults.headers.common['token'] = token
  
        Restangular
            .one 'users'
            .get()
            .then(
              ((response) ->
                $('.error-message').slideUp(200)
                $cookies.accessToken = token
                $sessionStorage.user = response
                AuthService.autorized = true
                $state.go 'inside')
              ((response) -> $('.error-message').html(response.data.error).slideDown(200)))

      @logout = () ->
        delete $cookies['accessToken']
        delete $sessionStorage['user']
        delete $rootScope.user
        delete $http.defaults.headers.common['token']
        AuthService.autorized = false
        $state.go 'home'
        Restangular
            .one 'logout'
            .get()
              