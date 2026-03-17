# ilookup

> Solidity interfaces for on-chain lookup contracts.

---

## Overview

`lookup` provides canonical Solidity interfaces for interacting with on-chain lookup contracts. Implementations may be immutable or mutable — `lookup` defines only the interface. Import these into your project without taking a dependency on any specific implementation.

---

## Usage

```solidity
import { IAddressLookup } from "ilookup/IAddressLookup.sol";

IAddressLookup lookup = IAddressLookup(LOOKUP_ADDRESS);
address token = lookup.get(key);
```

---

## Installation

```bash
forge install uniteum/ilookup
```

```bash
npm install @uniteum/ilookup
```

---

## License

MIT
