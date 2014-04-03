'use strict';

/* Filters */
var feedmeFilters = angular.module('feedmeFilters', []);

feedmeFilters.
  filter('interpolate', ['version', function(version) {
    return function(text) {
      return String(text).replace(/\%VERSION\%/mg, version);
    };
  }]);
