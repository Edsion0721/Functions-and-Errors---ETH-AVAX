# ETH-AVAX-PROOF-Intermediate-EVM-Course_Module1

# ProductIDChecker

## Overview

The `ProductIDChecker` is a Solidity smart contract designed to manage and validate product IDs within a specified range. This contract ensures that product IDs fall within the range of 1 to 99, inclusive. It provides functionality to validate, add, and check the validity of product IDs.

## Contract Details

### State Variables

- **productCount (uint)**: Keeps track of the number of valid products added.

### Functions

1. **assertProductID(uint productID) public pure**

   This function checks if a given product ID is within the valid range (1 to 99) using the `assert` statement.
   
   ```solidity
   function assertProductID(uint productID) public pure {
       assert(productID >= 1 && productID <= 99);
   }```
2.	**addProduct(uint productID) public returns (uint)**
	This function increments the productCount if the provided product ID is valid. If the product ID is not valid, it reverts the transaction with an error message.

```solidity
function addProduct(uint productID) public returns (uint) {
    if (productID < 1 || productID > 99) {
        revert("This is not a valid product ID");
    }
    productCount += 1;
    return productCount;
}
```
3.	**isValidProductID(uint productID) public pure returns (bool)**
   This function checks if the provided product ID is within the valid range using the require statement. It returns true if the product ID is valid.

   ```solidity
   function isValidProductID(uint productID) public pure returns (bool) {
    require(productID >= 1 && productID <= 99, "Product ID range should be between 1-99");
    return true;
}
```
4.	addProductWithChecks(uint productID) public returns (uint)
 This function combines the use of require, assert, and revert to ensure the product ID is valid before adding it to the productCount.

```solidity
function addProductWithChecks(uint productID) public returns (uint) {
    require(productID >= 1 && productID <= 99, "Product ID range should be between 1-99");
    
    // Assert to double-check the product ID is valid
    assert(productID >= 1 && productID <= 99);
    
    // Use revert if product ID is not valid after assert (though this will typically not be reached due to assert)
    if (productID < 1 || productID > 99) {
        revert("This is not a valid product ID");
    }

    productCount += 1;
    return productCount;
}
```
#Usage

Deploy the ProductIDChecker contract on the Ethereum blockchain. The functions can be called to validate, add, and check product IDs as per the requirements.

Example

	1.	Deploy the contract.
	2.	Call addProduct(10) to add a valid product ID.
	3.	Call isValidProductID(50) to check if a product ID is valid.
	4.	Call addProductWithChecks(25) to add a product with all checks.


## Project By
- Edison

