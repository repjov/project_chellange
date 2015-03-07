angular.module "foxrey"
  .controller "BaseAuthCtrl", ($scope, $state, AuthService) ->
    @disclaimer = "/app/auth/views/disclaimer-registration.html"
    @private = "/app/auth/views/private-registration.html"