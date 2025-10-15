# 🧾 InteractionLogger

**InteractionLogger** is a minimalistic Solidity smart contract that logs every on-chain interaction with its timestamp and caller address.  
No imports, no constructors, and no input fields — just pure on-chain logging.  

---

## 🌐 Deployed Contract

| Network | Address | Transaction Hash |
|----------|----------|------------------|
| **Ethereum / Testnet** | [`0x0160d3B075a1556d1C7def0d9168e2462c1fAf71`](https://etherscan.io/address/0x0160d3B075a1556d1C7def0d9168e2462c1fAf71) | [`0x0160d3B075a1556d1C7def0d9168e2462c1fAf71`](https://etherscan.io/tx/0x0160d3B075a1556d1C7def0d9168e2462c1fAf71) |

*(Replace the links above with your network explorer if not on Ethereum mainnet)*

---

## ⚙️ Overview

This contract acts like a **public blockchain diary** — each function call automatically logs:
- The caller’s wallet address (`msg.sender`)
- The current block timestamp (`block.timestamp`)
- A predefined action tag (optional)

No input parameters are needed — interactions are tracked automatically.

---

## ✨ Key Features

✅ Zero-input logging functions  
✅ Transparent and immutable on-chain records  
✅ No constructor or external imports  
✅ Emits an event for every interaction  
✅ Easy to fetch logs via view functions or event listeners  

---

## 🔍 Smart Contract Details

**Solidity Version:** `^0.8.17`  
**License:** `MIT`  
**Deployed By:** Angel  
**Contract Name:** `InteractionLogger`

---

## 🧩 Functions

| Function | Type | Description |
|-----------|------|-------------|
| `logInteraction()` | `public` | Logs a generic interaction with no tag |
| `logInteractionActionA()` | `public` | Logs an interaction tagged `"ACTION_A"` |
| `logInteractionActionB()` | `public` | Logs an interaction tagged `"ACTION_B"` |
| `count()` | `view` | Returns the total number of interactions logged |
| `latest()` | `view` | Returns the most recent interaction details |
| `all()` | `view` | Returns all interactions (IDs, users, timestamps, actions) |

---

## 🧠 Data Structure

```solidity
struct Interaction {
    uint256 id;
    address user;
    uint256 timestamp;
    bytes32 action;
}
