## App

angular.module("TodoApp", ["TodoService"])
    .config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
        $locationProvider.html5Mode(true).hashPrefix('!') # Deleting hashbang symbol '#' from url.
        $routeProvider
        .when("/",
             templateUrl: "/assets/todos.html"
             controller: TodoCtrl
        )
    ]
