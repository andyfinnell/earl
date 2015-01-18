-module(earl_error_SUITE).
-author("andy@losingfight.com").

-include_lib("common_test/include/ct.hrl").
-export([all/0, groups/0, init_per_group/2, end_per_group/2, 
		init_per_testcase/2, end_per_testcase/2]).
-export([test_success/1, test_failure/1]).

all() ->
    [test_success, test_failure].

groups() ->
	[].

%% Test Group callbacks
init_per_group(_, Config) ->
	Config.

end_per_group(_, _Config) ->
	ok.

%% Test Cases setup and teardown
init_per_testcase(_, Config) ->
	Config.

end_per_testcase(_, Config) ->
	Config.

%% Test Cases

test_success(_Config) ->
	true = earl_error:is_success(ok),
	true = earl_error:is_success({ok, 42}),
	false = earl_error:is_success({error, badvalue}).
	
test_failure(_Config) ->
	false = earl_error:is_failure(ok),
	false = earl_error:is_failure({ok, 42}),
	true = earl_error:is_failure({error, badvalue}).
