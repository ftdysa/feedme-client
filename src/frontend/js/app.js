'use strict';


// Declare app level module which depends on filters, and services
var feedme = angular.module('feedme', [
  'ngRoute',
  'myApp.filters',
  'myApp.services',
  'myApp.directives',
  'myApp.controllers'
]);

feedme.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when(
        '/recipes', {
          templateUrl: 'partials/recipe-list.html',
          controller: 'RecipeListCtrl'
      }).
      when(
        '/view2', {
          templateUrl: 'partials/partial2.html',
          controller: 'MyCtrl2'
      }).
      otherwise({
          redirectTo: '/view2'
      });
}]);
