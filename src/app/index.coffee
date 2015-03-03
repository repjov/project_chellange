angular.module "foxrey", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap']
  .config ($httpProvider, $locationProvider) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false
  .run ['$rootScope', '$state', '$stateParams', '$http', ($rootScope, $state, $stateParams, $http) ->
    #here will be general and main variables and configurations

    # It's very handy to add references to $state and $stateParams to the $rootScope
    # so that you can access them from any scope within your applications.For example,
    # <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
    # to active whenever 'contacts.list' or one of its decendents is active.
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams


  ]
