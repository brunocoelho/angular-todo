todoApp = angular.module "TodoApp", ["ngResource"]

todoApp.factory "Todo", ["$resource", ($resource) ->
    $resource("/todos/:id", {}, { update: { method: "PUT" } })
]

todoApp.config(["$routeProvider", ($routeProvider) ->
    $routeProvider
    .when("/",
      templateUrl: "/assets/todos.html"
      controller: TodoCtrl
    )
])
