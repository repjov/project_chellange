'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider, config) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "/app/main/main.html",
        controller: "MainCtrl"

      .state "about",
        url: "/about",
        templateUrl: "/app/statics/about.html",
        controller: "StaticsCtrl"

      .state "contact",
        url: "/contact",
        templateUrl: "/app/statics/contact.html"

      .state "registration",
        url: "/registration"
        templateUrl: "/app/auth/views/registration.html"
        controller: "BaseAuthCtrl as base"

      .state "registration.shipper",
        url: "/shipper"
        templateUrl: "/app/auth/views/shipper.html"
        controller: "RegisterShipperCtrl"

      .state "registration.transport",
        url: "/transport"
        templateUrl: "/app/auth/views/transport.html"
        controller: "RegisterTransportCtrl"

      .state "login",
        url: "/login"
        templateUrl: "/app/auth/views/login.html"
        controller: "LoginCtrl"

      .state "transport",
        url: "/transport"
        abstract: true
        template: '<div ui-view></div>'
        controller: "BaseTransportCtrl as base"
        data:
          permissions:
            only: ['transport']
            redirectTo: 'login'

      .state "transport.dashboard",
        url: "/dashboard"
        templateUrl: "/app/transport/views/dashboard.html"

      .state "shipper",
        url: "/shipper"
        abstract: true
        template: '<div ui-view></div>'
        controller: "BaseShipperCtrl as base"
        data:
          permissions:
            only: ['shipper']
            redirectTo: 'login'

      .state "shipper.dashboard",
        url: "/dashboard"
        templateUrl: "/app/shipper/views/dashboard.html"