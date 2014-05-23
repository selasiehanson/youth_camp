app = angular.module("app.controllers");

app.controller("CampersController", ['$scope', 'Camper', function ($scope, Camper){
    Camper.query(function(res){
      $scope.campers = res;
    });
}]);