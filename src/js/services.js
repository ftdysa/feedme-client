'use strict';

/* Services */


// Demonstrate how to register services
// In this case it is a simple value service.
var feedmeServices = angular.module('feedmeServices', []);

feedmeServices.
  value('version', '0.1');
