'use strict';

angular.module("app.controllers",[]);
angular.module("app.services",[]);

var app  = angular.module('app', [
  "app.controllers",
  "app.services",
  "ui.router",
  "ngResource",
]);


app.config(['$urlRouterProvider', '$stateProvider',
  function($urlRouterProvider, $stateProvider) {
    $stateProvider
      .state("dashboard", {
        url: "/dashboard",
        templateUrl: "/dashboard",
        controller: 'DashBoardController'
      })
      .state('campers', {
        url: '/campers',
        templateUrl: '/admin/campers',
        controller: 'CampersController'
      });
    $urlRouterProvider.otherwise("dashboard");
  }
]);

app.config(["$httpProvider", function (provider) {
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);