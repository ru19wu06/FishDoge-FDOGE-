// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface init{
    function inputadd(uint256 a) payable external returns (bool);
}


contract ReceiveEther {
    
    init SweetDOG = init(address(0x67d269191c92Caf3cD7723F116c85e6E9bf55933));
    
    bool public bo;
 
    function tryAddress(uint256 a) public payable{
         require(msg.value == 1 ether);
         bo = SweetDOG.inputadd(a);
            
         
         require(bo == true,"catch fail");
     
     }
    
}


