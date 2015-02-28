'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider) ->
    
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"

      .state "about",
        url: "/about",
        templateUrl: "app/statics/about.html",

      .state "contact",
        url: "/contact",
        templateUrl: "app/statics/contact.html"
