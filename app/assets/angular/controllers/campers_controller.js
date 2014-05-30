var app = angular.module("app.controllers");

app.controller("CampersController", ['$scope', 'Camper',
  function($scope, Camper) {
    $scope.isFetching = false;
    $scope.campers = {}
    window.CP = Camper


    $scope.fetchData = function() {
      $scope.isFetching = true;
      Camper.query().$promise.then(function(res) {
        Camper.data = $scope.campers = res;
        $scope.isFetching = false;
      });
    }

    $scope.fetchData();
  }
]);


app.controller("CampersShowController", ['$scope', 'Camper', '$stateParams',
  function($scope, Camper, $stateParams) {

    Camper.get({
      id: $stateParams.id
    }).$promise.then(function(res) {
      $scope.camper = res
    });
  }
]);