
-module(other).
-author("golo").

%% API
-export([show/0]).

show() ->
  basics:run(),
  SumFromBasic = basics:add_numbers(2,5),
  io:format("~n `Print integer from other ~B~n", [SumFromBasic]).

