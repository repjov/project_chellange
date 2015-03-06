angular.module "foxrey"
  .controller "BaseAuthCtrl", ($scope) ->
    @disclaimer = "/app/auth/views/disclaimer-registration.html"
    @private = "/app/auth/views/private-registration.html"