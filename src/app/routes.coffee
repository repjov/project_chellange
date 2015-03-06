'use strict'

#Main Routing
angular.module "foxrey"
  .config ($stateProvider, $urlRouterProvider) ->
    
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "/app/autorization/autorization.html",
        controller: "autorizationCtrl",
        data: {
          permissions: {
            except: ['shipper', 'tp'],
            redirectTo: 'inside'
          }
        }

      .state "signup",
        url: "/signup",
        templateUrl: "/app/registration/signup.html",
        data: {
          permissions: {
            except: ['shipper', 'tp'],
            redirectTo: 'inside'
          }
        }

      .state "signup.shipper",
        url: "/shipper",
        templateUrl: "/app/registration/signup.shipper.html",
        controller: "shipperSignupCtrl",
        data: {
          permissions: {
            except: ['shipper', 'tp'],
            redirectTo: 'inside'
          }
        }

      .state "signup.transporter",
        url: "/transporter",
        templateUrl: "/app/registration/signup.transporter.html",
        controller: "transporterSignupCtrl",
        data: {
          permissions: {
            except: ['shipper', 'tp'],
            redirectTo: 'inside'
          }
        }

      .state "inside",
        url: "/dashboard",
        templateUrl: "/app/inside/dashboard/dashboard.html",
        controller: "dashboardCtrl",
        data: {
          permissions: {
            except: ['anonymous'],
            redirectTo: 'home'
          }
        },
        ncyBreadcrumb: {
          label: 'Dashboard'
        }

      .state "inside.deliveries",
        url: "/deliveries",
        data:{
          pageReq: {
            title: 'Deliveries'
          }
        },
        views:{
          'AutorizedView@inside': {
            templateUrl: "/app/inside/deliveries/deliveries.html"
          }
        }
        ncyBreadcrumb: {
          label: 'Deliveries'
        }
          


