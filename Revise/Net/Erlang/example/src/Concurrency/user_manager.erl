-module(user_manager).
-author("golo").
-behaviour(gen_server).
%% API
-export([
  get_records_data/1,
  start_link/0,
  stop/1,
  add_user/1,
  remove_user/1,
  update_user/2,
  get_user/1,
  get_all_users/0
]).
-export([init/1,
  handle_call/3,
  handle_cast/2,
  handle_info/2
]).

-record(user, {id, name, age, email}).

%%  c(user_manager). user_manager:function().

init([]) ->
  {ok, []}.

get_records_data(Data) ->
  [Name, Age, Email] = [maps:get(Key, Data) || Key <- maps:keys(Data)],
  [Name, Age, Email].

%% Userdata -> map # name age email
handle_call({add_user, UserData}, _From, Users) ->
  [Name, Age, Email] = get_records_data(UserData),
  NewUser = #user{id= length(Users) + 1, name = Name, age = Age, email = Email },
  ChangedUsers = [NewUser | Users],
  {reply, ok, ChangedUsers};

handle_call({remove_user, UserId}, _From, Users) ->
  UsersWithoutRemovalId = lists:filter(
    fun(User) -> User#user.id =/= UserId end, Users
  ),
  {reply, ok, UsersWithoutRemovalId};

handle_call({update_user, UserId, NewData}, _From, Users) ->
    UpdatedUsers = lists:map(
      fun(User) ->
        if User#user.id =:= UserId ->
          [Name, Age, Email] = get_records_data(NewData),
          User#user{name = Name, age = Age, email = Email };
        true ->
          User
        end
      end, Users
    ),
  {reply, ok, UpdatedUsers};


handle_call({get_user, UserId}, _From, Users) ->
  SearchedUser = lists:filter(
    fun(User) -> User#user.id =:= UserId end, Users
  ),
  {reply, SearchedUser, Users};

handle_call(get_all_users, _From, Users) ->
  {reply, Users, Users};

handle_call({stop, Pid }, _From, _Users) ->
  {reply, "Pid " ++ Pid ++ "removed", []}.

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

%% API
start_link() ->
  gen_server:start(?MODULE, [], []).

stop(Pid) ->
  gen_server:call(?MODULE, {stop, Pid}).

add_user(NewUserData) ->
  gen_server:call(?MODULE, {add_user, NewUserData}).

remove_user(UserId) ->
  gen_server:call(?MODULE, {remove_user, UserId}).

update_user(UserId, NewData) ->
  gen_server:call(?MODULE, {update_user, UserId, NewData}).

get_user(UserId) ->
  gen_server:call(?MODULE, {get_user, UserId}).

get_all_users() ->
  gen_server:call(?MODULE, get_all_users).

