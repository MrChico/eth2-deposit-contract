all: compile

clean:
	@rm -f DepositContract.abi DepositContract.bin IDepositContract.abi IDepositContract.bin deposit_contract.json
	@rm -rf out

compile: clean
	@solc --bin --abi --overwrite -o . deposit_contract.sol
	@/bin/echo -n '{"abi": ' > deposit_contract.json
	@cat DepositContract.abi >> deposit_contract.json
	@/bin/echo -n ', "bytecode": "0x' >> deposit_contract.json
	@cat DepositContract.bin >> deposit_contract.json
	@/bin/echo -n '"}' >> deposit_contract.json

test:
	DAPP_SRC=. dapp --use solc:0.6.6 test -v
