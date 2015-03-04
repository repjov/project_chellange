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
        controller: "StaticsCtrl"

      .state "contact",
        url: "/contact",
        templateUrl: "/app/statics/contact.html"

      .state "registration",
        url: "/registration"
        templateUrl: "/app/registration/registration.html"
        controller: "StaticsCtrl"

      .state "registration.shipper",
        url: "/shipper"
        templateUrl: "/app/registration/shipper/shipper.html"
        controller: "RegisterShipperCtrl"

      .state "registration.transport",
        url: "/transport"
        templateUrl: "/app/registration/transport/transport.html"
        controller: "RegisterTransportCtrl"

      .state "login",
        url: "/login"
        templateUrl: "/app/registration/login/login.html"
        controller: "LoginCtrl"

      .state "transport",
        url: ""
        abstract: true
        templateUrl: '<ui-view/>'
        data:
          permissions:
            only: ['tp']
            redirectTo: 'login'

      .state "transport.dashboard",
        url: "/dashboard"
        templateUrl: "app/main/dashboard/dashboard.html"

      .state "shipper",
        url: "/dashboard"
        abstract: true
        templateUrl: '<ui-view/>'
        data:
          permissions:
            only: ['shipper']
            redirectTo: 'login'

      .state "shipper.dashboard",
        url: ""
        templateUrl: "app/main/dashboard/dashboard.html"