-module(basics).
-author("Czesław").

%% API
-export([start/0]).

start() ->
    io:format("Hello in the city~n"),
    print_sum(5, 10).

print_sum(Prev, Next) ->
    Sum = Prev + Next,
    io:format("Sum of ~p and ~p is: ~p~n", [Prev, Next, Sum]).
