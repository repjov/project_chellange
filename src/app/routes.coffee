'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider) ->
    
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html"

      .state "shipper-signup",
        url: "/shipper-signup",
        templateUrl: "app/statics/shipper-signup.html",
        controller: "formValid"

      .state "transporter-signup",
        url: "/transporter-signup",
        templateUrl: "app/statics/transporter-signup.html",
        controller: "formValid"

