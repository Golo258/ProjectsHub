-module(basics).
-author("Czesław").

%% function define with lowercase with _
%% Variables and arguments defined with Capitalizzation

%% API
-export([run/0,
  add_numbers/3,
  types/0,
  iterate/1,
  collections/0,
  statement/0,
  map_collection/0,
  tuple_collection/0,
  match_example/1,
  check_pattern/2,
  pattern_matching/0,
  list_comprehensions/0,
  exceptions_handling/0
]).  % define which function will be possible to import /2 -artis (nr of arguments)


run() ->
  DoubleSum = add_numbers(2, 5, 7),
  List = [1, 2, 3],
  io:format("Print string ~s~n", ["Hello, world!"]),
  io:format("Print integer ~B~n", [DoubleSum]),
  io:format("Print List  ~p~n", [List]).

% Function can be overloaded with different number of arguments
add_numbers(Prev, Middle, Next) ->
  Prev + Middle + Next.

types() ->
  IntNumb = 15,
  FloatNumber = -3.15,
  SimpleAtom = error, % always lowercase, its a final number
%%  EmptyList = [],
  FiledList = [pending, 12.5, "Error message"],
  [Head | Tail] = FiledList,
  io:format("Int numb: ~B | Float: ~.2f | Atom: ~p | Head ~p | Tail: ~p",
    [IntNumb, FloatNumber, SimpleAtom, Head, Tail]),

  collections().


collections() ->
  SimpleList = [1, 23, 5],
  MappedList = lists:map(fun(Number) -> Number * 2 end, SimpleList),
  io:format("Mapped list: ~p ~n", [MappedList]),
  %% execute function for each elements without output
  lists:foreach(fun(Element) -> io:format("~p~n", [Element]) end, [SimpleList]),
  %% filter list by condition
  GreaterNumbers = lists:filter(fun(Element) -> Element > 2 end, SimpleList),
  io:format("Filtered list: ~p ~n", [GreaterNumbers]),
  iterate(SimpleList).

%% Erlang doesn't have loops, but iteration is done by recursion
iterate(List) ->
  case List of
    [] ->
      ok;
    [Head, Tail] ->
      io:format("Element: ~p ~n", [Head]),
      iterate(Tail)
  end.

%% If syntax
%%    if
%%      condition ->
%%        action;
%%      condition ->
%%        action;
%%      true ->
%%        default
%%    end.

statement() ->
%%   == equals  =/= - not equal
  Number = -4,
  Message = if
              Number > 0 orelse Number < -10 andalso Number /= -5 ->
                "Number ~p is positive or  less then -10 and different than -5";
              Number < 0 andalso Number > -10 orelse Number == -5 ->
                "Number ~p is negative and bigger then -10 or equals -5";
              true ->
                "Number ~p equals zero"
            end,
  io:format(Message, [Number]).

map_collection() ->
%%  #{Pairs => Key,}
  Person = #{name => "Alice", age => 30, married => true},
  PersonName = maps:get(name, Person),
  PersonCivilStatus = maps:get(married, Person),
  if
    is_boolean(PersonCivilStatus) -> io:format("Person: ~p, is_married: ~p ", [PersonName, PersonCivilStatus]);
    true -> io:format("is not boolean")
  end,
%%  Add element or change it
  ChangedPerson = maps:put(city, "Cracow", Person),
  io:format("~n Person city: ~p", [maps:get(city, ChangedPerson)]),
%% Remove item
  PersonWithoutName = maps:remove(name, ChangedPerson),
%%  Iterating
  maps:fold(
    fun(Key, Value, _) ->
      io:format("Key ~p | Value: ~p ", [Key, Value])
    end,
    ok, PersonWithoutName
  ).

tuple_collection() ->
%%  const length of argument, used to group data
  Data = {1, "Alice", true},
  DataName = element(2, Data), % first index = 1
  io:format("Data: ~p | NameData: ~p", [Data, DataName]).

%% using pattern matching as arguments
match_example({Numb, Value}) ->
  io:format("X: ~p, Y: ~p~n", [Numb, Value]).

check_pattern(Content, Pattern) ->
  case re:run(Content, Pattern) of
    {match, [Groups]} ->
      io:format("Pattern matched in: ~p~n", [Groups]),
      case Groups of
        {Start, End} ->
          MatchedText = string:substr(Content, Start + 1, End),
          io:format("Matched Text: ~p ~n", [MatchedText]);
        _ ->
          io:format("No valid groups found")
      end;
    nomatch ->
      io:format("Pattern not matched in: ~s~n", [Content])
  end.


pattern_matching() ->
  match_example({1, 2}),
%%  Regex additionally
%%  FUnctions: re:run/2 -matching regular text content,
  Pattern = "^[A-Za-z]{3}",  % Wzór: trzy wielkie litery na początku
  Content1 = "ABC is a sample string.",
  check_pattern(Content1, Pattern),
%%  re:split - splitting content based on pattern
  SplittingPattern = "\\s+",
  Parts = re:split(Content1, SplittingPattern),
  StringParts = [binary_to_list(Part) || Part <- Parts],
  io:format("Split parts: ~p~n", [StringParts]),
%%  re:replace - replacing matching in content
  NewText = re:replace(Content1, "is", "isn't", [global]),
  io:format("New text ~p ~n", [NewText]).

list_comprehensions() ->
%% 1. function done for each element. 2. generator expression, 3. filtering conditions
%%    Syntax: [Expression || Pattern < List, Conditions]

%%  Map list values
  Numbers = [1, 5, 12, 62],
  DoubledNumbers = [Numb * 2 || Numb <- Numbers, Numb > 2],
%% Filter list values
  EvenNumbers = [Numb || Numb <- Numbers, Numb rem 2 == 0],
%% Iteration through tuples and getting values
  Persons = [{john, 25}, {jane, 51}, {mark, 12}],
  NameList = [Name || {Name, _Age} <- Persons],
  io:format("Doubled numbers: ~p | ~n Even Numbers: ~p ~n| Names: ~p | ~n",
    [DoubledNumbers, EvenNumbers, NameList]).


%% Exceptions handling
%%Syntax
%%  try
%%
%%  catch
%%    ErrorType:Reason ->
%%  after  - like finally
%%  end
exceptions_handling() ->
  FirstNumb = 12,
  SecondNumber = 0,
  try
      Result = FirstNumb / SecondNumber,
      io:format("Result: ~p", [Result])
  catch
      error:badarith ->
          io:format("Error: Bad argument for division ~n");
        _:_ ->
          io:format("An unexpected error occurred~n"),
          undefined
  end.


%%   c(basics), basics:exceptions_handling().


