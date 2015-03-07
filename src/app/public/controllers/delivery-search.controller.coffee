angular.module "foxrey"
  .controller "DeliverySearchCtrl", ($scope, $state) ->
    $scope.filterCategory = ""
    $scope.filter =
      dt: null
      pickupCity: ""
      deliveryCity: ""

    $scope.print = ->
      console.log $scope.filter.dt

    $scope.deliveries = [
      {id: 1234567890, name:'John', age:25, gender:'boy', date: new Date("10/01/2014"), from: "Some", to: "there", category: "1"}
      {id: 1234567891, name:'Jessie', age:30, gender:'girl', date: new Date("11/02/2013"), from: "Some Place", to: "Dest", category: "2"}
      {id: 1234567892, name:'Johanna', age:28, gender:'girl', date: new Date("12/03/2012"), from: "Some", to: "Dest", category: "2"}
      {id: 1234567893, name:'Joy', age:15, gender:'girl', date: new Date("10/01/2011"), from: "Some Place", to: "Dest", category: "1"}
      {id: 1234567894, name:'Mary', age:28, gender:'girl', date: new Date("10/01/2010"), from: "Place", to: "here", category: "1"}
      {id: 1234567895, name:'Peter', age:95, gender:'boy', date: new Date("10/01/2010"), from: "Place", to: "here", category: "1"}
      {id: 1234567896, name:'Sebastian', age:50, gender:'boy', date: new Date("10/01/2015"), from: "Some Place", to: "no", category: "1"}
      {id: 1234567897, name:'Erika', age:27, gender:'girl', date: new Date("10/01/2015"), from: "Some Place", to: "Dest", category: "1"}
      {id: 1234567898, name:'Patrick', age:40, gender:'boy', date: new Date("10/01/2015"), from: "Some Place", to: "Dest", category: "1"}
      {id: 1234567899, name:'Samantha', age:60, gender:'girl', date: new Date("10/01/2015"), from: "Some", to: "Dest", category: "1"}
    ]

    $scope.open = ($event) ->
      $event.preventDefault()
      $event.stopPropagation()

      $scope.opened = true

    return