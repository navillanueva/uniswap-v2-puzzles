# Uniswap-v2-puzzles by [RareSkills](https://www.rareskills.io)

##  Notes Hello World

Orignal contract fails because it is trying to call a .name() for an IERC20 standard, the name() function is not guaranteed in this contract (only totalySupply, balanceOf and transfer)
