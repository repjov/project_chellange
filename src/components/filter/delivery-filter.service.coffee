angular.module "foxrey"
  .service "FilterDeliveryService", (Restangular, $http) ->
    class FilterDeliveryService

      @getAll = () ->

        Restangular
          .one 'deliveries'
          .get()

      @getByFilter = (query) ->
        
        Restangular
          .one 'deliveries'
          .get query
          
