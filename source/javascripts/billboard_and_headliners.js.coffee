
do -> Array::shuffle ?= ->
  for i in [@length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [@[i], @[j]] = [@[j], @[i]]
  @

window.app = app = angular.module('app', [])

app.controller('BillboardCtrl', ['$scope', '$http', ($scope, $http) ->
  
  $scope.billboard = null
  
  $http.get('data/billboards.json').success (data) ->
    $scope.billboard = data.shuffle()[0]
    
])
  
app.controller('HeadlinersCtrl', ['$scope', '$http', ($scope, $http) ->
  
  $scope.headliners = []
  
  $http.get('data/headliners.json').success (data) ->
    $scope.headliners = data.shuffle()[0...10][..]
    
])