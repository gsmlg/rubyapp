aMailServices = angular.module 'AMail', ['ngRoute']

aMailServices.config ($routeProvider)->
  $routeProvider.
    when('/', {
      controller: ListController
      templateUrl: 'tpl/list.html'
    }).
    when('/view/:id', {
      controller: DetailController
      templateUrl: 'tpl/detail.html'
    }).
    otherwise {redirectTo: '/'}

ListController = ($scope, $http)->
  $http.get('/emails').success((data, status, headers, config)->
    $scope.messages = data
    )
  $scope.messages = messages

DetailController = ($scope, $http, $routeParams)->
  $http.get('/emails/'+$routeParams.id).success((data)->
    $scope.message = data
  )

messages = [
  { id: 0, sender: 'jean', subject: 'Hi there', date: 'Oct 10' }
  { id: 1, sender: 'jean', subject: 'Hi there', date: 'Oct 10' }
  { id: 2, sender: 'jean', subject: 'Hi there', date: 'Oct 10' }
  { id: 3, sender: 'jean', subject: 'Hi there', date: 'Oct 10' }
  { id: 4, sender: 'jean', subject: 'Hi there', date: 'Oct 10' }
]
