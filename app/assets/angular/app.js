'use strict';

angular.module('app', [
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
      .state('roles_and_permissions', {
        url: '/admin/roles_and_permissions',
        templateUrl: '/app?app=admin&url=roles_and_permissions',
        controller: 'PermissionsController'
      });
    $urlRouterProvider.otherwise("dashboard");
  }
]);