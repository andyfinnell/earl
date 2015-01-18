-module(earl_error).
-author("andy@losingfight.com").

-export([is_success/1, is_failure/1]).

%% Public API

-spec is_success({error, any()} | {ok, any()} | ok) -> boolean().
is_success({error, _Error}) ->
	false;
is_success({ok, _Value}) ->
	true;
is_success(ok) ->
	true.
	
-spec is_failure({error, any()} | {ok, any()} | ok) -> boolean().
is_failure(Result) ->
	not is_success(Result).
