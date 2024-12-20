// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

library SsoStorage {
  //keccak256('clave.contracts.ClaveStorage') - 1
  bytes32 private constant SSO_STORAGE_SLOT = 0x3248da1aeae8bd923cbf26901dc4bfc6bb48bb0fbc5b6102f1151fe7012884f4;

  struct Layout {
    // ┌───────────────────┐
    // │   Ownership Data  │
    mapping(bytes => bytes) r1Owners;
    mapping(address => address) k1Owners;
    uint256[50] __gap_0;
    // └───────────────────┘

    // ┌───────────────────┐
    // │     Fallback      │
    address defaultFallbackContract; // for next version
    mapping(bytes4 selector => address) fallbackContractBySelector;
    uint256[50] __gap_1;
    // └───────────────────┘

    // ┌───────────────────┐
    // │     Validation    │
    mapping(address => address) r1Validators;
    mapping(address => address) k1Validators;
    mapping(address => address) moduleValidators;
    uint256[50] __gap_2;
    // └───────────────────┘

    // ┌───────────────────┐
    // │       Module      │
    mapping(address => address) modules;
    mapping(address => address) execModules;
    uint256[50] __gap_3;
    // └───────────────────┘

    // ┌───────────────────┐
    // │       Hooks       │
    mapping(address => address) validationHooks;
    mapping(address => address) executionHooks;
    mapping(address => mapping(bytes32 => bytes)) hookDataStore;
    uint256[50] __gap_4;
    // └───────────────────┘
  }

  function layout() internal pure returns (Layout storage l) {
    bytes32 slot = SSO_STORAGE_SLOT;
    assembly {
      l.slot := slot
    }
  }
}
