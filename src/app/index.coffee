angular.module "foxrey", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap']
  .config ($httpProvider, $locationProvider, RestangularProvider) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    RestangularProvider
      .setBaseUrl 'http://localhost:4444/api/v1'

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false
  .run ($http)->
    #here will be general and main variables and configurations
