%%%-------------------------------------------------------------------
%%% @author golo
%%%-------------------------------------------------------------------
-module(processes).
-author("golo").
%% API
-export([
  run/0,
  simple_function/0,
  communication/0,
  receiver/0,
  worker/0,
  dispatcher/1,
  init_work/0
]).
%% Actor model:
%%  its an autonomous proces, which perform its job sumultanously with other processes
%%  can only comunicate by messages
%%  each actor has its own mailbox with which collect messages
%%  can create others actors, send to them messages and manage them
%%  each process in erlang is an actor - isolated unit

run() ->
  Pid = spawn(processes, simple_function, []),
  io:format("Started process with PID: ~p", [Pid]).

simple_function() ->
  io:format("Hello from process!~n. Module name: ~p ", [?MODULE]).

%% Communication between processes / sending / receiving
%% Sending --       PID ! Message .
%% Receveing --   by receive constructor

communication() ->
  Pid = spawn(?MODULE, receiver, []),
  Pid ! { self(), "Message sended"},
  io:format("Message send to PID: ~p", [Pid]),
  receive
      Response -> io:format("~n Got response: ~p~n", [Response])
  end.

receiver() ->
  receive
    {SenderPid, Message} ->
        io:format("~nReceived message: ~p from pid: ~p", [Message, SenderPid]),
        SenderPid ! "Message received successfully"
  end.

%% Example how to use this mechanisms
%% Simulation of task management system
worker() ->
  receive
    {DispatcherPid, Task} ->
        Result = Task * 2,
        io:format("~nWorker processed task: ~p, result ~p for Dispatcher ~p",
          [Task, Result, DispatcherPid]),
        DispatcherPid ! {self(), Result},

      worker() % waiting for other task to do
  end.

%% Dispatcher - receive task and passing it to available processes (workers)
%% manage task queue and receive workers results
dispatcher(Workers) ->
  receive
    {client, Task} ->
      [Worker | RemainingWorkers] = Workers,
      Worker ! {self(), Task},
      dispatcher(RemainingWorkers ++ [Worker]);

    {WorkerPid, Result} ->
      io:format("DIspatcher receive worker ~p, task result: ~p ~n", [WorkerPid, Result]),
      dispatcher(Workers)
  end.

init_work() ->
  WorkerA = spawn(?MODULE, worker, []),
  WorkerB = spawn(?MODULE, worker, []),
  WorkerC = spawn(?MODULE, worker, []),

  Dispatcher = spawn(?MODULE, dispatcher,[ [WorkerA, WorkerB, WorkerC]]),
  Dispatcher ! {client, 5},
  Dispatcher ! {client, 10},
  Dispatcher ! {client, 23}.

%%   c(processes), processes:init_work().
