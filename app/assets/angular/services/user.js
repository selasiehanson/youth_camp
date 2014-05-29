'use strict';
var app = angular.module("app.services");

app.factory('Camper', function($resource){
  return $resource('/api/campers/:id', {id: "@_id"});
});
