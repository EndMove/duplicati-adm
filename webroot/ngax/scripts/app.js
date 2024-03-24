var backupApp = angular.module(
    'backupApp', 
    [
        'ngRoute', 
        'dotjem.angular.tree',
        'ngCookies',
        'ngSanitize',
        'gettext',
        'ngclipboard'
    ]
);

backupApp.constant('appConfig', {
    login_url: '/login.html?v=2.0.7.1'
});

backupApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/home', {
                templateUrl: 'templates/home.html?v=2.0.7.1'
            }).
            when('/add', {
                templateUrl: 'templates/addoredit.html?v=2.0.7.1'
            }).
            when('/add-import', {
                templateUrl: 'templates/addoredit.html?v=2.0.7.1'
            }).
            when('/restorestart', {
                templateUrl: 'templates/restorewizard.html?v=2.0.7.1'
            }).
            when('/addstart', {
                templateUrl: 'templates/addwizard.html?v=2.0.7.1'
            }).
            when('/edit/:backupid', {
                templateUrl: 'templates/addoredit.html?v=2.0.7.1'
            }).
            when('/restoredirect', {
                templateUrl: 'templates/restoredirect.html?v=2.0.7.1'
            }).
            when('/restoredirect-import', {
                templateUrl: 'templates/restoredirect.html?v=2.0.7.1'
            }).
            when('/restore/:backupid', {
                templateUrl: 'templates/restore.html?v=2.0.7.1'
            }).
            when('/settings', {
                templateUrl: 'templates/settings.html?v=2.0.7.1'
            }).
            when('/about', {
                templateUrl: 'templates/about.html?v=2.0.7.1'
            }).
            when('/delete/:backupid', {
                templateUrl: 'templates/delete.html?v=2.0.7.1'
            }).
            when('/log/:backupid', {
                templateUrl: 'templates/backuplog.html?v=2.0.7.1'
            }).
            when('/log', {
                templateUrl: 'templates/log.html?v=2.0.7.1'
            }).
            when('/updatechangelog', {
                templateUrl: 'templates/updatechangelog.html?v=2.0.7.1'
            }).
            when('/export/:backupid', {
                templateUrl: 'templates/export.html?v=2.0.7.1'
            }).
            when('/import', {
                templateUrl: 'templates/import.html?v=2.0.7.1'
            }).
            when('/restore-import', {
                templateUrl: 'templates/import.html?v=2.0.7.1'
            }).
            when('/localdb/:backupid', {
                templateUrl: 'templates/localdatabase.html?v=2.0.7.1'
            }).
            when('/commandline', {
                templateUrl: 'templates/commandline.html?v=2.0.7.1'
            }).
            when('/commandline/:backupid', {
                templateUrl: 'templates/commandline.html?v=2.0.7.1'
            }).
            when('/commandline/view/:viewid', {
                templateUrl: 'templates/commandline.html?v=2.0.7.1'
            }).
            otherwise({
                templateUrl: 'templates/home.html?v=2.0.7.1'
                //redirectTo: '/home'
        });
}]);

backupApp.run(function($injector) {
    try {
        $injector.get('OEMService');
    } catch(e) {}
    try {
        $injector.get('CustomService');
    } catch(e) {}
    try {
        $injector.get('ProxyService');
    } catch(e) {}
});

// Registers a global parseInt function
angular.module('backupApp').run(function($rootScope){
    $rootScope.parseInt = function(str) {
        return parseInt(str);
    };  
});

// Register a global back function
/*backupApp.run(function ($rootScope, $location) {

    var history = [];
    $rootScope.$on('$routeChangeSuccess', function() {
        history.push($location.$$path);
    });

    $rootScope.back = function () {
        var prevUrl = history.length > 1 ? history.splice(-2)[0] : "/home";
        $location.path(prevUrl);
    };

});*/
