## Services

angular.module("TodoService", ["ngResource"])
    .factory "Todo", ["$resource", ($resource) ->
        $resource("/todos/:id", {}, { update: { method: "PUT" } })
    ]
