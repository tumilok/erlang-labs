%%%-------------------------------------------------------------------
%%% @author tumilok
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Apr 2020 20:06
%%%-------------------------------------------------------------------
-module(records).
-author("tumilok").

-include("records.hrl").

-compile(export_all).

%% To load record from module use:
%% rr(module_name)

-record(robot, {name,
                type=industrial,
                hobbies,
                details=[]}).

first_robot() ->
  #robot{name = "Mechatron",
         type = handmade,
         details = ["Moved by a small man inside"]}.

car_factory(CorpName) ->
  #robot{name = CorpName, hobbies = "building cars"}.


-record(user, {id, name, group, age}).

%% use pattern matching to filter
admin_panel(#user{name=Name, group=admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
  Name ++ " is not allowed".

%% can extend user without problem
adult_section(U = #user{}) when U#user.age >= 18 ->
  %% Show stuff that can't be written in such a text
  allowed;
adult_section(_) ->
  forbidden.

included() -> #included{some_field="Some value"}.