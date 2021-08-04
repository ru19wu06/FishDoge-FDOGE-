pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
    // don't need to define other functions, only using `transfer()` in this case
}

contract MyContract {
    // Do not use in production
    // This function can be executed by anyone
    function sendFDOGE(address _to, uint256 _amount) external {
         // This is the mainnet USDT contract address
         // Using on other networks (rinkeby, local, ...) would fail
         //  - there's no contract on this address on other networks
        IERC20 FDOGE = IERC20(address(0x4742DC121d121f4Ae2A5fD23DB6031b32916F4a2));
        
        // transfers USDT that belong to your contract to the specified address
        FDOGE.transfer(_to, _amount);
    }
}