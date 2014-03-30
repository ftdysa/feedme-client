'use strict';

/* Controllers */

var feedme = angular.module('feedme', []);

feedme.controller('RecipeListCtrl', ['$scope', '$http', function ($scope, $http) {
    $http.get('recipes/recipes.json').success(function(data) {
        $scope.recipes = data;
    })
}]);

feedme.controller('MyCtrl2', [function() {}]);