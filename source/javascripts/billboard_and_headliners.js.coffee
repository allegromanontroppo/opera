
do -> Array::shuffle ?= ->
  for i in [@length-1..1]
    j = Math.floor Math.random() * (i + 1)
    [@[i], @[j]] = [@[j], @[i]]
  @

window.BillboardCtrl = ($scope, $http) ->
  
  $scope.billboard = null
  
  $http.get('/data/billboards.json').success (data) ->
    $scope.billboard = data.shuffle()[0]
  
window.HeadlinersCtrl = ($scope, $http) ->
  
  $scope.headliners = []
  
  $http.get('/data/headliners.json').success (data) ->
    $scope.headliners = data.shuffle()[0...10][..]
  