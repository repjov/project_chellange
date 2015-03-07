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
  'js-data'
])
  .config ($httpProvider, $locationProvider, config, DSProvider) ->

    #CORS configuration
    $httpProvider.defaults.useXDomain = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

    #HTML5 URL routing
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

    DSProvider.defaults.basePath = config.apiUrl.base

  .run(['$rootScope', '$state', '$stateParams', '$http', 'Permission', 'config', 'AuthService', 'DS', (
      $rootScope, $state, $stateParams, $http, Permission, config, AuthService, DS) ->
    #here will be general and main variables and configurations

    Permission.defineRole 'transport', () ->
      AuthService.isAuthorized config.userRoles.transport

    Permission.defineRole 'shipper', () ->
      AuthService.isAuthorized config.userRoles.shipper
  ])