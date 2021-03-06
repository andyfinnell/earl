REBAR:=rebar

DEPS_PLT=$(CURDIR)/.deps_plt
DEPS_DIR=$(CURDIR)/deps
DEPS=erts kernel stdlib

.PHONY: all erl test clean doc dialyzer

all: erl

erl:
	$(REBAR) get-deps compile

test: all
	@mkdir -p .eunit
	$(REBAR) skip_deps=true ct

clean:
	$(REBAR) clean
	-rm -rvf deps ebin doc .eunit logs
	-rm -rvf test/*.beam

doc:
	$(REBAR) doc

$(DEPS_PLT):
	@echo Building local plt at $(DEPS_PLT)
	@echo
	dialyzer --output_plt $(DEPS_PLT) --build_plt \
	   --apps $(DEPS) -r $(DEPS_DIR)
 
dialyzer: $(DEPS_PLT)
	dialyzer --fullpath --plt $(DEPS_PLT) -Wrace_conditions -r ./ebin
