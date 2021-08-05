pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
}

contract MyContract {
    address private contract_sender;
    
    constructor() {
        contract_sender = msg.sender;
    }
    
    mapping(address => uint)CountFrequency;
    
    event transfer(address,uint frequency);
    
    function Get_FDOGE() external{
        CountFrequency[msg.sender]++;
        require(CountFrequency[msg.sender]<5,"Hey! You take too much!");
        
        
        IERC20 FDOGE = IERC20(address(0x4742DC121d121f4Ae2A5fD23DB6031b32916F4a2));
        FDOGE.transfer(msg.sender, 50000000000000000000000);
        
        emit transfer(msg.sender, CountFrequency[msg.sender]);
    }
   

    
    
    function sendFDOGE(address _to, uint256 _amount) external {
        require(msg.sender == contract_sender,"You are not the contract sender Bro!!");
        IERC20 FDOGE = IERC20(address(0x4742DC121d121f4Ae2A5fD23DB6031b32916F4a2));
        
        
        FDOGE.transfer(_to, _amount);
    }
    
    
}