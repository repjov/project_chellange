angular.module "foxrey"
  .service "FilterDeliveryService", (Restangular, $http) ->
    class FilterDeliveryService

      @getAll = () ->

        Restangular
          .one 'deliveries'
          .get()

      @getByFilter = (category, pickup_date, limit, skip) ->
        
        Restangular
          .getList 'deliveries', {category:category, pickup_date:pickup_date, limit:limit, skip:skip}
          
