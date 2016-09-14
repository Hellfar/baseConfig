(function(){
	var app = angular.module('mod', [  ]);

	app.controller('FetchJson', ['$http', function($http){
		var self = this;
		self.data = null;
		$http.get('/data.json').success(function(data){
			self.data = data;
		});
	}]);
})();
