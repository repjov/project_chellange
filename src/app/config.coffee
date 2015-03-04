'use strict'

angular.module "foxrey"
  .constant 'config',
    auth:
      apiUrl: 'http://localhost:4444/api'
      signOutUrl: '/v1/logout'
      emailSignInPath: '/v1/login'
      storage: 'localStorage'
      getUser: '/v1/users'
      handleLoginResponse: (response) -> response
    authEvents:
      loginSuccess: 'auth-login-success'
      loginFailed: 'auth-login-failed'
      logoutSuccess: 'auth-logout-success'
      sessionTimeout: 'auth-session-timeout'
      notAuthenticated: 'auth-not-authenticated'
      notAuthorized: 'auth-not-authorized'
    userRoles:
      all: '*'
      transport: 'transport'
      shipper: 'shipper'