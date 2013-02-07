todoApp = angular.module "TodoApp", ["ngResource"]

todoApp.factory "Todo", ["$resource", ($resource) ->
    $resource("/todos/:id", {}, { update: { method: "PUT" } })
]

todoApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true).hashPrefix('!') # Deleting hashbang symbol '#' from url.
    $routeProvider
    .when("/",
      templateUrl: "/assets/todos.html"
      controller: TodoCtrl
    )
]
