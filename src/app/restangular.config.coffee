angular.module "foxrey"
  .config (RestangularProvider) ->
    RestangularProvider
      .setBaseUrl 'http://localhost:4444/api/v1'
