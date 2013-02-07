## Aplication Controller

@TodoCtrl = ["$scope", "$log", "Todo", ($scope, $log, Todo) ->
    #$scope.todos = [
    #    { 'text': 'todo 1', 'done': true }
    #    { 'text': 'todo 2', 'done': false }
    #    { 'text': 'todo 3', 'done': false }
    #]

    ## FAZER REQUISIÇÃO PARA SHOW!
    $scope.todos = Todo.query()
    $log.log($scope.todos.length)

    $scope.remaining = ->
        count = 0
        angular.forEach $scope.todos, (todo) ->
            count += 1 if todo.done
        count

    $scope.addTodo = ->
        $scope.todos.push({ 'description': $scope.todoDescription, 'done': false })
        $scope.todoDescription = ''

    $scope.archive = ->
        pool = []
        angular.forEach $scope.todos, (todo) ->
            pool.push todo if not todo.done
        $scope.todos = pool
]
