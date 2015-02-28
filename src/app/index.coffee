angular.module "foxrey", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap']
  .config ($httpProvider, $locationProvider) ->
    
    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    #HTML5 URL routing
    $locationProvider.html5Mode
        enabled: true
        requireBase: false

