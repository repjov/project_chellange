'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider) ->
    
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "/app/autorization/autorization.html",
        controller: "autorizationCtrl"

      .state "signup",
        url: "/signup",
        templateUrl: "/app/registration/signup.html"

      .state "signup.shipper",
        url: "/shipper",
        templateUrl: "/app/registration/signup.shipper.html",
        controller: "shipperSignupCtrl"

      .state "signup.transporter",
        url: "/transporter",
        templateUrl: "/app/registration/signup.transporter.html",
        controller: "transporterSignupCtrl"

