# CredChain — Smart Contracts

Solidity contracts for the CredChain decentralized credential platform.

## Stack

Solidity 0.8.24 · Hardhat 2.28 · OpenZeppelin 5.6.1 · TypeScript · Chai + Mocha

## Contracts

| Contract | Purpose |
|---|---|
| `CredentialBase` | Abstract base: shared errors, deployer protection |
| `CredentialConfig` | Service locator for authority + registry addresses |
| `CredentialAuthority` | Role management (5 tiers), ECDSA signature verification |
| `CredentialRegistry` | Soulbound ERC-721 credential NFTs (issue, revoke, verify) |

### Role Hierarchy

`None(0) → Holder(1) → Issuer(2) → Admin(3) → SuperAdmin(4)`

Go mirrors this numeric chain enum. Go database roles and React use four string application roles without `None`; Python does not define platform roles.

## Quick Start

```bash
cp .env.example .env
# Set PRIVATE_KEY, RPC URLs, INITIAL_SUPER_ADMIN_WALLET_ADDRESS
npm install
make compile
make test
```

## Deploy

Local-chain deploy is automated by the orchestrator (`cd ../CredChain_Golang && make dev-up`),
which runs `scripts/deploy.ts` against Anvil and wires the addresses into the backend. Deploy by
hand only for real networks:

```bash
# Amoy testnet (recommended)
npx hardhat run scripts/deploy.ts --network amoy

# Polygon mainnet
npx hardhat run scripts/deploy.ts --network polygon
```

Mumbai is deprecated (retired April 2024). Use Amoy instead.

## Key Commands

| Command | Purpose |
|---|---|
| `make compile` | Compile contracts |
| `make test` | Run contract tests |
| `npx hardhat coverage` | Generate coverage report |
| `npx hardhat test test/<file>` | Run a single test file |

## Related Docs

- [AGENTS.md](AGENTS.md) — Full contract specs, deployment details, architecture
