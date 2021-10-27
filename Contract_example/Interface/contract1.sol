// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract face {
   
   mapping(uint => address) public inputAddress;
   
   uint256 public num=0;
   
   function inputadd(uint256 a) payable external returns (bool){
       require(msg.value ==1 ether);
       
       
       if(block.number %3 == a){
            payable(msg.sender).transfer(1 ether);
            
            return(true);
       }else{
           return(false);
       }
       
   }
    
}


