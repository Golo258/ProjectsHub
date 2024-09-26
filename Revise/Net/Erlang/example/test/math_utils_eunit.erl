
-module(math_utils_eunit).
-author("golo").

-export([
  add/2,
  subtract/2
]).
%% Tested functions
add(A, B) ->
  A + B.

subtract(A, B) ->
  A - B.


-include_lib("eunit/include/eunit.hrl").

add_test() ->
  ExpectedNumber = 5,
  ?assertEqual(ExpectedNumber, math_utils_eunit:add(2,3)),
  ?assertEqual(ExpectedNumber, math_utils_eunit:add(4,1)).

subtract_test() ->
  ?assertEqual(1, math_utils_eunit:subtract(3, 2)),
  ?assertEqual(-1, math_utils_eunit:subtract(2, 3)).

%% Running test  c(math_utils_eunit), eunit:test(math_utils_eunit).