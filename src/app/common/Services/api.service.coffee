'use strict'

angular.module "foxrey"
  .factory 'API', ($http, config, Session, DS, localStorageService, DSHttpAdapter) ->
    class Api
      constructor: ->
        # DSHttpAdapter.defaults.basePath = config.apiUrl.base

      token: ->
        value = localStorageService.get 'auth'
        console.log value
        value = value.token if value

      url: (slug) ->
        [config.apiUrl.base, slug].join('')

      get: (slug, object) =>
        console.log "token used", @token()
        DSHttpAdapter.GET @url(slug), {headers: { token: @token() }, params: object}

      post: (slug, object, JSON) =>
        DSHttpAdapter.POST @url(slug), object, {headers: { token: @token() }, params: JSON}



    new Api()