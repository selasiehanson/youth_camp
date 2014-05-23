var app = angular.module("app.controllers");

app.controller("CampersController", ['$scope', 'Camper',
    function($scope, Camper) {
      $scope.campers = {}
      window.CP = Camper
      Camper.query().$promise.then(function(res) {
          Camper.data = $scope.campers = res;
      });
      }
    ]);


  app.controller("CampersShowController", ['$scope', 'Camper', '$stateParams',
    function($scope, Camper, $stateParams) {
      
      Camper.get({id : $stateParams.id}).$promise.then(function (res){
        $scope.camper = res
      });
    }
  ]);