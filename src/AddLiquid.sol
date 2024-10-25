// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./interfaces/IUniswapV2Pair.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AddLiquid {
    /**
     *  ADD LIQUIDITY WITHOUT ROUTER EXERCISE
     *
     *  The contract has an initial balance of 1000 USDC and 1 WETH.
     *  Mint a position (deposit liquidity) in the pool USDC/WETH to msg.sender.
     *  The challenge is to provide the same ratio as the pool then call the mint function in the pool contract.
     *
     */
    function addLiquidity(address usdc, address weth, address pool, uint256 usdcReserve, uint256 wethReserve) public {
        IUniswapV2Pair pair = IUniswapV2Pair(pool);

        (uint256 reserve0, uint256 reserve1, ) = pair.getReserves();

        uint256 usdcAmount = (1 ether * reserve0) / reserve1; // in USDC units

        // console2.log(usdcAmount);

        IERC20(usdc).approve(pool, usdcAmount);
        IERC20(weth).approve(pool, 1 ether);

        require(IERC20(usdc).transfer(pool, usdcAmount), "USDC transfer failed");
        require(IERC20(weth).transfer(pool, 1 ether), "WETH transfer failed");

        // Call mint to add liquidity and mint LP tokens to msg.sender
        pair.mint(msg.sender);
    }
}
