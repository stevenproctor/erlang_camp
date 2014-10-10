-module(ec_lists).

-export([print_each/1,
         yourmap/2]).

-spec print_each(list()) -> ok.
print_each(List) ->
    print_each(List, 1).

yourmap(Fun, List) ->
    yourmap(Fun, List, []).



print_each([], _) ->
    ok;
print_each([Head|Rest], Index) ->
    io:format("~p is ~p~n", [Index, Head]),
    print_each(Rest, Index + 1).


yourmap(_Fun, [], Accum) ->
    lists:reverse(Accum);
yourmap(Fun, [Head|Tail], Accum) ->
    yourmap(Fun, Tail, [Fun(Head)|Accum]).
