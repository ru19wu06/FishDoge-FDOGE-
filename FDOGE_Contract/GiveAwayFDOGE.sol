// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
}



contract FishDOGE {
    address private contract_sender;
    
    constructor() {
        contract_sender = msg.sender;
    }
    
    mapping(address => uint)CountFrequency;
    
    event transfer(address,uint frequency);
    
    function Get_FDOGE() external{
        CountFrequency[msg.sender]++;
        require(CountFrequency[msg.sender]<5,"Hey! You take too much!");
        
        
        IERC20 FDOGE = IERC20(address(0x361D8552d7Db423eC0cb097a5911fE453d205374));
        FDOGE.transfer(msg.sender, 50000000000000000000000);
        
        emit transfer(msg.sender, CountFrequency[msg.sender]);
    }
   

    
    
    function sendFDOGE(address _to, uint256 _amount) external {
        require(msg.sender == contract_sender,"You are not the contract sender Bro!!");
        IERC20 FDOGE = IERC20(address(0x361D8552d7Db423eC0cb097a5911fE453d205374));
        
        
        FDOGE.transfer(_to, _amount);
    }
    
    
}