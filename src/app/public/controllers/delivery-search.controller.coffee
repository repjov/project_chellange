angular.module "foxrey"
  .controller "DeliverySearchCtrl", ($scope, $state) ->
    $scope.deliveries = [
      {id: 1234567890, name:'John', age:25, gender:'boy', date: "10-01-2014", from: "Some", to: "there"}
      {id: 1234567890, name:'Jessie', age:30, gender:'girl', date: "10-01-2013", from: "Some Place", to: "Dest"}
      {id: 1234567890, name:'Johanna', age:28, gender:'girl', date: "10-01-2012", from: "Some", to: "Dest"}
      {id: 1234567890, name:'Joy', age:15, gender:'girl', date: "10-01-2011", from: "Some Place", to: "Dest"}
      {id: 1234567890, name:'Mary', age:28, gender:'girl', date: "10-01-2010", from: "Place", to: "here"}
      {id: 1234567890, name:'Peter', age:95, gender:'boy', date: "10-01-2010", from: "Place", to: "here"}
      {id: 1234567890, name:'Sebastian', age:50, gender:'boy', date: "10-01-2015", from: "Some Place", to: "no"}
      {id: 1234567890, name:'Erika', age:27, gender:'girl', date: "10-01-2015", from: "Some Place", to: "Dest"}
      {id: 1234567890, name:'Patrick', age:40, gender:'boy', date: "10-01-2015", from: "Some Place", to: "Dest"}
      {id: 1234567890, name:'Samantha', age:60, gender:'girl', date: "10-01-2015", from: "Some", to: "Dest"}
    ]

    console.log "Data", $scope.deliveries

    $scope.open = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()

      $scope.opened = true