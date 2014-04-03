'use strict';

/* Directives */

var feedmeDirectives = angular.module('feedmeDirectives', []);
feedmeDirectives.
  directive('appVersion', ['version', function(version) {
    return function(scope, elm, attrs) {
      elm.text(version);
    };
  }]);
