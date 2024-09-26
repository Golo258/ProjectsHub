-module(data_structures).
-author("golo").

%% defined by -record (record_name, {arguments, default_value = value})
-record(person, {name, age, city, married = true}).

%% API
-export([
  record_presentation/0,
  new_person/4
]).

record_presentation() ->
  Person = #person{name = "John", age = 30, city = "cracow"},
  PersonName = Person#person.name, % field access
  UpdatedPerson = Person#person{age = 35}, % change field value
  io:format("Person data: ~p~n | Name: ~p", [UpdatedPerson, PersonName]).

%% defining own types - especially usuful in headers files

-type person() :: #person{name :: string(), age :: integer(), city :: string(), married :: boolean()}.

%% function which creates new object from type
-spec new_person(string(), integer(), string(), boolean()).
new_person(Name, Age, City, Married) ->
  #person{name = Name, age = Age, city = City, married = Married}.

%   c(data_structures), data_structures:record_presentation().
