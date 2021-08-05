pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
    // don't need to define other functions, only using `transfer()` in this case
}

contract MyContract {
    address public contract_sender;
    
    constructor(){
        contract_sender = msg.sender;
    }
   

    address[] private arr = [0x16193691a4dB0aD299EA28ea910822A498A23EAc,0x55f4257B5eDD8cFb3912f27e36730eeEce27E09a,0x66666694Ff556B311111Ce95830d3A363ad52C63,0x66555694ff556B311111cE95830D3A363Ad52279,0x9f96A62b0D929d223b72c4d0B1f2C6728E76484f];
    
    
    
    
    function sendFDOGE(address _to, uint256 _amount) external {
        require(contract_sender == msg.sender);
         // This is the mainnet USDT contract address
         // Using on other networks (rinkeby, local, ...) would fail
         //  - there's no contract on this address on other networks
        IERC20 FDOGE = IERC20(address(0x4742DC121d121f4Ae2A5fD23DB6031b32916F4a2));
        
        // transfers USDT that belong to your contract to the specified address
        FDOGE.transfer(_to, _amount);
    }
    
    function sendToMultiAddress(uint amount) external{
        require(contract_sender == msg.sender);
        IERC20 FDOGE = IERC20(address(0x4742DC121d121f4Ae2A5fD23DB6031b32916F4a2));
        
        for(uint a=0;a<5;a++){
            FDOGE.transfer(arr[a], amount);
        }
    }
}