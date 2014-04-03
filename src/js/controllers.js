'use strict';

/* Controllers */

var feedmeControllers = angular.module('feedmeControllers', []);

feedmeControllers.controller('RecipeListCtrl', ['$scope', '$http', function ($scope, $http) {
    $http.get('app_dev.php/recipes/recipes.json').success(function(data) {
        console.log('hi');
        $scope.recipes = data;
    })
}]);

feedmeControllers.controller('MyCtrl2', [function() {}]);