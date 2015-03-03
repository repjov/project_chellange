'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider) ->
    
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/autorization/autorization.html",
        controller: "autorizationCtrl"

      .state "shipper-signup",
        url: "/shipper-signup",
        templateUrl: "app/registration/shipper-signup.html",
        controller: "shipperSignupCtrl"

      .state "transporter-signup",
        url: "/transporter-signup",
        templateUrl: "app/registration/transporter-signup.html",
        controller: "transporterSignupCtrl"

