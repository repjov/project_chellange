'use strict'

angular.module "foxrey"
  .constant 'config',
    auth:
      apiUrl: 'http://localhost:4444/api'
      signOutUrl: '/v1/logout'
      emailSignInPath: '/v1/login'
      storage: 'localStorage'
      handleLoginResponse: (response) -> response