'use strict'

angular.module("foxrey", [
  'ngAnimate'
  'ngCookies'
  'ngTouch'
  'ngSanitize'
  'restangular'
  'ui.router'
  'ui.bootstrap'
  'permission'
  'LocalStorageModule'
])
  .config ($httpProvider, $locationProvider, config) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

  .run(['$rootScope', '$state', '$stateParams', '$http', 'Permission', 'config', 'AuthService', (
      $rootScope, $state, $stateParams, $http, Permission, config, AuthService) ->
    #here will be general and main variables and configurations

    # Permission.defineRole 'tp', (stateParams) ->
    #   AuthService.isAuthorized config.userRoles.transport

    # Permission.defineRole 'shipper', (stateParams) ->
    #   AuthService.isAuthorized config.userRoles.shipper
  ])