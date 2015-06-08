var app = angular.module("app.controllers");

app.controller("CampersController", ['$scope', 'Camper','$http',
  function($scope, Camper, $http) {
    $scope.isFetching = false;
    $scope.campers = {}
    window.CP = Camper


    $scope.fetchData = function() {
      $scope.isFetching = true;
      Camper.query().$promise.then(function(res) {
        Camper.data = $scope.campers = res;
        $scope.isFetching = false;
      });
    };
    var durl = 'api/campers/download/';
    $scope.export = function (){
      console.log('exporting');
      $http.post('api/campers/export').then(function (res) {
        $scope.download_link = durl + res.data.file_name;
      }); 
    };

    $scope.fetchData();
  }
]);


app.controller("CampersShowController", ['$scope', 'Camper', '$stateParams',
  function($scope, Camper, $stateParams) {

    Camper.get({
      id: $stateParams.id
    }).$promise.then(function(res) {
      $scope.camper = res;
    });
  }
]);
