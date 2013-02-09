## Services

angular.module("TodoService", ["ngResource"])
    .factory "Todo", ["$resource", ($resource) ->
        $resource("/todos/:id", {}, { update: { method: "PUT" } })
    ]

angular.module("UserService", ["ngResource"])
    .factory "User", ["$resource", ($resource) ->
        $resource("/users/:id", {}, { update: { method: "PUT" } })
    ]
