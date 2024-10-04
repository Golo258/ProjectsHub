%%%-------------------------------------------------------------------
%% @doc learnProject public API
%% @end
%%%-------------------------------------------------------------------

-module(learnProject_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    learnProject_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
