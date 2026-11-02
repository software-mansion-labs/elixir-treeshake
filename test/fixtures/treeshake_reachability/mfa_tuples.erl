-module(mfa_tuples).
-export([specs/1, parse/1, start_link/2, run/1, spawned/1, exact/1, exact/2]).

%% Functions referenced with argument lists, whose lengths are not the arities
specs(Args) ->
    spawn(?MODULE, spawned, Args),
    %% Called with the list as the only argument, like httpc's response parser
    [{?MODULE, parse, [Args, relaxed]},
     %% Started by a simple_one_for_one supervisor, which appends arguments
     #{id => worker, start => {?MODULE, start_link, []}},
     {?MODULE, run, Args},
     {?MODULE, exact, 1}].

parse([_Data, _Args, _Relaxed]) -> ok.
start_link(_Sup, _Arg) -> ok.
run(_Arg) -> ok.
spawned(_Arg) -> ok.
exact(_Arg) -> ok.
exact(_Arg1, _Arg2) -> ok.
