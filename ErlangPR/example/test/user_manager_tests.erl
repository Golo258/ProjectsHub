
-module(user_manager_tests).
-author("golo").
%% API
-include_lib("eunit/include/eunit.hrl").
-export([
  setup/0
%%  teardown/0,
%%  add_user_test/0,
%%  remove_user_test/0,
%%  update_user_test/0,
%%  get_user_test/0,
%%  get_all_users_test/0
]).

%%  c(user_manager_tests).
-record(user, {id, name, age, email}).

setup() ->
  {ok, Pid} = user_manager:start_link(),
  erlang:put(user_manager_pid, Pid). % setting pid as global var in cache

%%teardown() ->
%%  Pid = erlang:get(user_manager_pid),
%%  user_manager:stop(Pid).

add_user_test() ->
  Status = user_manager:add_user(#{name => "Alice", age => 23, email => "Alice123@gmail.com"}),
  Users = user_manager:get_all_users(),
  ?assertEqual(ok, Status),
  ?assertEqual(1, length(Users)),
  User= user_manager:get_user(1),
  ?assertEqual("Alice", User#user.name).


remove_user_test() ->
  user_manager:add_user(#{name => "Bob", age => 35, email => "bob@example.com"}),
  user_manager:remove_user(1),
  Users = user_manager:get_all_users(),
  ?assertEqual(0, length(Users)).

update_user_test() ->
  user_manager:add_user(#{name => "Charlie", age => 35, email => "charlie@example.com"}),
  user_manager:update_user(1, #{name => "Marshal", email => "marshmaello@gmail.com"}),
  User = user_manager:get_user(1),
  ?assertEqual("Marshal", User#user.name),
  ?assertEqual("marshmaello@gmail.com", User#user.email).

get_user_test() ->
  user_manager:add_user(#{name => "Diana", age => 28, email => "diana@example.com"}),
  User = user_manager:get_user(1),
  ?assertEqual("Diana", User#user.name).

get_all_users_test() ->
  user_manager:add_user(#{name => "Diana", age => 28, email => "diana@example.com"}),
  user_manager:add_user(#{name => "Eve", age => 40, email => "eve@example.com"}),
  Users = user_manager:get_all_users(),
  ?assertEqual(2, length(Users)).

