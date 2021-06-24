pragma solidity ^0.7.0;

contract FDOGE_gamblr{
    constructor payable public{

        address public Owner = "0x66666694Ff556B311111Ce95830d3A363ad52C63";
        uint256 public Balance_of_FDOGE;
    }

    // function play() public view{
        
    // }


    function random() public view returns (uint) {
        
       bytes32 random = keccak256(abi.encodePacked(block.difficulty,now,block.number,block.timestamp));
       uint a = uint(random)%1000;
       return a;
    }
}