angular.module "foxrey", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap', 'ng-token-auth']
  .config ($httpProvider, $locationProvider, $authProvider) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']
    $httpProvider.defaults.headers.get['If-Modified-Since'] = '0';

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

    #ng-token-auth
    $authProvider.configure {
      apiUrl: 'http://localhost:4444/api'
      signOutUrl: '/v1/logout'
      emailSignInPath: '/v1/login'
      storage: 'localStorage'
      handleLoginResponse: (response) -> response
    }
  .run ['$rootScope', '$state', '$stateParams', '$http', ($rootScope, $state, $stateParams, $http) ->
    #here will be general and main variables and configurations

    # It's very handy to add references to $state and $stateParams to the $rootScope
    # so that you can access them from any scope within your applications.For example,
    # <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
    # to active whenever 'contacts.list' or one of its decendents is active.
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams


  ]