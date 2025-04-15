// SPDX-License-Identifier: MIT
pragma solidity 0.6.6;
import "@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol";
import "@uniswap/v2-periphery/contracts/libraries/UniswapV2OracleLibrary.sol";
import "hardhat/console.sol";
import "@uniswap/lib/contracts/libraries/FixedPoint.sol";
contract UniswapOracle{

 
    address _factory;
    constructor(address _f) public {
        _f=_factory;
    }
 
    function consult(address tokenA,address tokenB) external {

        address pairAddress=UniswapV2Library.pairFor( _factory,  tokenA,  tokenB);
        require(pairAddress!=address(0));
        (uint price0Cumulative, uint price1Cumulative, uint32 blockTimestamp) =UniswapV2OracleLibrary.currentCumulativePrices(pairAddress);
        console.log(price0Cumulative);
        console.log(price1Cumulative);
        console.log(blockTimestamp);

    }

}