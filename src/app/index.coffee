angular.module "foxrey", ['ngMessages', 'ngAnimate', 'permission', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap', 'ngStorage']
  .config ($httpProvider, $locationProvider) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

  .run ($http, $sessionStorage, $rootScope, $state, $stateParams, Permission)->
    
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
    
    Permission
      .defineRole 'anonymous', (stateParams) ->
        if !$sessionStorage.user
          return true
        return false
      .defineRole 'shipper', (stateParams) ->
        if $sessionStorage.user? && $sessionStorage.user.type = "sheeper"
          return true
        return false
      .defineRole 'tp', (stateParams) ->
        if $sessionStorage.user? && $sessionStorage.user.type = "tp"
          return true
        return false

    
