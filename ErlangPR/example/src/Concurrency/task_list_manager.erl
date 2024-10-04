%%%-------------------------------------------------------------------
%%% @author golo
%%%-------------------------------------------------------------------

-module(task_list_manager).
-behaviour(gen_server).
-author("golo").

%% API
-export([server_runner/0,
  start_link/0,
  add_task/1,
  get_tasks/0,
  remove_task/1,
  update_task/2
]).


%% GenServer callbacks
-export([init/1,
  handle_call/3,
  handle_cast/2,
  handle_info/2,
  terminate/2,
  code_change/3]).

server_runner() ->
  task_list_manager:start_link(),
  TaskList = ["Buy groceries", "Complete homework", "Write Erlang code"],
  lists:foreach(fun(Task) -> task_list_manager:add_task(Task) end, TaskList),
  CurrentTasks = task_list_manager:get_tasks(),
  io:format("Current taks: ~p ~n", [CurrentTasks]),
  task_list_manager:remove_task(lists:nth(1, CurrentTasks)),
  UpdatedTasks = task_list_manager:get_tasks(),
  io:format("Tasks after removal of ~p:  takss: ~p ~n", [lists:nth(1, CurrentTasks), UpdatedTasks]),
  task_list_manager:update_task("Make your bed", 1),
  io:format("Tasks after change of element 1, tasks: ~p ~n", [task_list_manager:get_tasks()]).

%%   c(task_list_manager), task_list_manager:server_runner().


%%Genserver - advanced tool to manage processes and communication
%%  its special type of generic server
%%  its make easier to work and manage processes
start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

get_tasks() ->
  gen_server:call(?MODULE, get_tasks).

add_task(NewTask) ->
  gen_server:call(?MODULE, {add_task, NewTask}).

remove_task(TaskToRemove) ->
  gen_server:call(?MODULE, {remove_task, TaskToRemove}).

update_task(UpdatedValue, ElementIndex) ->
  gen_server:call(?MODULE, {update_task, UpdatedValue, ElementIndex}).

%% Callbacks methods
%% init - init server primary state

init([]) ->
  {ok, []}.

%% manage sync request which requires response - GET
handle_call({add_task, NewTask}, _From, State) ->
  io:format("Adding task: ~p~n", [NewTask]),
  NewState = [NewTask | State],
  {reply, ok, NewState};

handle_call(get_tasks, _From, State) ->
  {reply, State, State};  %% Zwraca aktualną listę zadań

handle_call({remove_task, TaskToRemove}, _From, State) ->
  io:format("Removing task: ~p~n", [TaskToRemove]),
  NewState = lists:delete(TaskToRemove, State),
  {reply, ok, NewState};

handle_call({update_task, UpdatedTask, UpdatedElementIndex}, _From, State) ->
  ChangedListState = lists:map(
    fun({Index, Element})->
      case Index of
        UpdatedElementIndex ->
          UpdatedTask;
        _ -> Element
      end
    end,
    lists:zip(lists:seq(1, length(State)), State)),
  {reply, ok, ChangedListState}.

%% manage async request (not requires response) POST
handle_cast(_Message, State) ->
  {noreply, State}.

%% h other request besides  call/cast
handle_info(_Info, State) ->
  {no_reply, State}.

%% Clean up if needed
terminate(_Reason, _state) ->
  ok.

code_change(_OldVersion, State, _Extra) ->
  {ok, State}.


