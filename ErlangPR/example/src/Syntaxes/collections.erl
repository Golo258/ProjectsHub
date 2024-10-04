%%%-------------------------------------------------------------------
%%% @author golo
%%% @copyright (C) 2024, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Sep 2024 4:21 PM
%%%-------------------------------------------------------------------
-module(collections).
-author("golo").

%% API
-export([
  collections/0,
  map_collection/0,
  tuple_collection/0,
  list_comprehensions/0,
  iterate/1

]).
%% Erlang doesn't have loops, but iteration is done by recursion
iterate(List) ->
  case List of
    [] ->
      ok;
    [Head, Tail] ->
      io:format("Element: ~p ~n", [Head]),
      iterate(Tail)
  end.

collections() ->
  SimpleList = [1, 23, 5],
  NewElement=  61,
  ChangedSimpleList = [NewElement | SimpleList], %%  Add new element
  MappedList = lists:map(fun(Number) -> Number * 2 end, ChangedSimpleList),
  io:format("Mapped list: ~p ~n", [MappedList]),
  lists:foreach(fun(Element) -> io:format("~p~n", [Element]) end, SimpleList),
  GreaterNumbers = lists:filter(fun(Element) -> Element > 2 end, SimpleList),  %% filter list by condition
  io:format("Filtered list: ~p ~n", [GreaterNumbers]),
  iterate(SimpleList),
  ExtendedList = [1,2,3] ++ [14,15,16],
  SecondExtendedList = lists:append(ExtendedList, ["man" ,"woman"]),%%   extending two lists into one
  io:format("Extend by append: ~p", [SecondExtendedList]).

%%  #{Pairs => Key,}
map_collection() ->
  Person = #{name => "Alice", age => 30, married => true},
  PersonName = maps:get(name, Person),
  PersonCivilStatus = maps:get(married, Person),
  if
    is_boolean(PersonCivilStatus) -> io:format("Person: ~p, is_married: ~p ", [PersonName, PersonCivilStatus]);
    true -> io:format("is not boolean")
  end,
  ChangedPerson = maps:put(city, "Cracow", Person),%%  Add element or change it
  io:format("~n Person city: ~p", [maps:get(city, ChangedPerson)]),
  PersonWithoutName = maps:remove(name, ChangedPerson),
  maps:fold( %%  Iterating
    fun(Key, Value, _) ->
      io:format("Key ~p | Value: ~p ", [Key, Value])
    end,
    ok, PersonWithoutName
  ).

%%  const length of argument, used to group data
tuple_collection() ->
  Data = {1, "Alice", true},
  DataName = element(2, Data), % first index = 1
  io:format("Data: ~p | NameData: ~p", [Data, DataName]).

list_comprehensions() ->
%% 1. function done for each element. 2. generator expression, 3. filtering conditions
%%    Syntax: [Expression || Pattern < List, Conditions]
  Numbers = [1, 5, 12, 62],%%  Map list values
  DoubledNumbers = [Numb * 2 || Numb <- Numbers, Numb > 2],
  EvenNumbers = [Numb || Numb <- Numbers, Numb rem 2 == 0],%% Filter list values
  Persons = [{john, 25}, {jane, 51}, {mark, 12}],
  NameList = [Name || {Name, _Age} <- Persons],%% Iteration through tuples and getting values
  io:format("Doubled numbers: ~p | ~n Even Numbers: ~p ~n| Names: ~p | ~n",
    [DoubledNumbers, EvenNumbers, NameList]).

