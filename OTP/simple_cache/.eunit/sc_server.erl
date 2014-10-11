%%%-------------------------------------------------------------------
%%% @author proctor
%%% @copyright (C) 2014, proctor
%%% @doc
%%%
%%% @end
%%% Created : 2014-10-10 15:12:02.785082
%%%-------------------------------------------------------------------
-module(sc_server).

-behaviour(gen_server).

%% API
-export([start_link/0,
         insert/2,
         lookup/1,
         stop/0]).

%% gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-define(SERVER, ?MODULE).

%%%% -record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec start_link() -> {ok, pid()} | ignore | {error, term()}.
start_link() ->
        gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).


-spec insert(atom(), term()) -> ok.
insert(Key, Value) ->
    gen_server:cast(?SERVER, {insert, {Key, Value}}).

-spec lookup(atom()) -> ok.
lookup(Key) ->
    gen_server:call(?SERVER, {lookup, Key}).

-spec stop() -> ok.
stop() ->
    gen_server:call(?SERVER, stop).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
        {ok, []}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call({lookup, Key}, _From, State) ->
    Reply = find_by_key(Key, State),
    {reply, Reply, State};
handle_call(stop, _From, State) ->
    {stop, normal, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast({insert, {Key, Value}}, State) ->
    NewState = [{Key, Value}|State],
    {noreply, NewState}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(_Info, State) ->
        {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
        ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
        {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================

find_by_key(Key, State) ->
    proplists:get_value(Key, State).


%%%===================================================================
%%% Test functions
%%%===================================================================

-ifndef(NOTEST).
-include_lib("eunit/include/eunit.hrl").

find_by_key_returns_value_if_key_is_present_test() ->
    ?assertMatch(bar, find_by_key(foo, [{foo, bar}])).

find_by_key_returns_first_value_in_the_list_if_key_is_present_test() ->
    ?assertMatch(baz, find_by_key(foo, [{foo, baz}, {foo, bar}])).

find_by_key_returns_undefined_if_key_is_not_present_test() ->
    ?assertMatch(undefined, find_by_key(baz, [{foo, bar}])).

-endif.
