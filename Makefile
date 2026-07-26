# CredChain Solidity — thin wrapper over hardhat for verb parity across repos.
# Deployment is NOT here: the orchestrator (CredChain_Golang: make local-up / dev-up)
# deploys via scripts/setup-contracts.py, which also wires the new addresses into
# the Go env. A standalone deploy would leave those addresses stale.

.PHONY: compile test

compile:
	npx hardhat compile

test:
	npx hardhat test
