## Aplication Controller

@TodoCtrl = ["$scope", "$log", "Todo", ($scope, $log, Todo) ->

    $scope.todos = Todo.query()

    $scope.remaining = ->
        count = 0
        angular.forEach $scope.todos, (todo) ->
            count += 1 if todo.done
        count

    $scope.addTodo = ->
        $scope.newTodo.done = false
        Todo.save($scope.newTodo)
        # I need to know if the object was saved properly
        $scope.todos.push($scope.newTodo)
        $scope.newTodo = {}

    $scope.archive = ->
        pool = []
        angular.forEach $scope.todos, (todo) ->
            pool.push todo if not todo.done
        $scope.todos = pool
]
