-module(types_and_conditions).
-author("Czesław").

%% function define with lowercase with _
%% Variables and arguments defined with Capitalizzation

%% API
-export([run/0,
  add_numbers/3,
  types/0,
  statement/0,
  match_example/1,
  check_pattern/2,
  pattern_matching/0,
  exceptions_handling/0,
  operators_differences/0
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
  Pattern = "^[A-Za-z]{3}",
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

operators_differences() ->
  IsEqual = 1 == 1.0, % check equality without checking types
  IsEqualType = 1 =:= 1.0, % check equality with types
  IsNotEqualType = 1 =/= 1.0,
%%  IsNotEqual = 1 != 2.0
  ResultList = [IsEqual, IsEqualType, IsNotEqualType],
  io:format("ResultList: ~p", [ResultList]).



%%   c(basics), basics:exceptions_handling().


