// SPDX-License-Identifier: MIT

// import ERC-721
// import SafeMath

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract FDOGE_NFT is ERC721 {
 
    using SafeMath for uint256;

    string public TOKEN_PROVENANCE = ""; // IPFS 發行時執行

    uint256 private constant tonkenPrice = 10000000000000000; //0.01 * 10 ** 18 總共 0.01 ETH
    uint256 private constant MAX_Token_supply = 200;//總產量
    
    
    address private constant creatorAddress = 0x66666694Ff556B311111Ce95830d3A363ad52C63 ;//設計團隊操作
    address private devAddress ;//開發者

    //constant 為不可竄改的

    uint256 private Total_Mint = 0;
    uint256 private Remaining_FDOGE = 0;

    string public baseTokenURI;

    bool public saleActive = false; //開啟交易
   

    mapping(address => uint256) public NumberOfUpgrades; //用戶可以升級FDOGE
    mapping(uint256 => bool) public FDOGE_Upgrade; //是否升級過了
    
    mapping (uint256 => string) private _tokenURIs; //metadata URL

    
    event FDOGECreated(uint256 indexed id);

    constructor() ERC721( "Perfect FishDoggie" , "FDOGE" ){//BaseURI 待定
        //setBaseURI('https://ru19wu06.github.io/FishDoge_FDOGE/fdoge_nft/');
        //https://ru19wu06.github.io/NftMetadata/MetadataTest2/
        devAddress = msg.sender;
    }
    
    function SaleActiveChange() public {
        require(msg.sender == devAddress,"You are not contract creater");
        
        if(saleActive == false){
            saleActive = true;
        }else{
            saleActive = false;
        }
        
    }
    
    

    function totalSupply() public view returns(uint256){ //FDOGE總產量
        return MAX_Token_supply;
    }
        //Waby
    function total_Mint() public view returns(uint256){
        return Total_Mint;
    }
    function remain_FDOGE() public view returns(uint){ //剩下多少FDOGE 還沒有被鑄造
        return MAX_Token_supply - Total_Mint;
    }
    
    
       
    

    function mint() public payable{ // FDOGE 0.08ETH
        require(saleActive == true,"Sale is not open yet!");
        require(Total_Mint <= 100,"Dope FDOGE has bean sale out");
        require(msg.value == 0.01 ether, "Value below price");
        
       
        _mintFDOGE(msg.sender);
        
        Remaining_FDOGE = MAX_Token_supply - Total_Mint;
        
    }

    function _mintFDOGE(address buyer) private{
        Total_Mint++;
        
        _safeMint(buyer,Total_Mint);
        FDOGE_Upgrade[Total_Mint] = false;
        emit FDOGECreated(Total_Mint);
    }
    
    
    



    function Mint_to_any_address(address to) public payable{//開發者團隊可以直接將FDOGE mint出並轉移到用戶身上
        require(msg.sender == devAddress);
        require(Total_Mint <= 10000,"Dope FDOGE has bean sale out");

         _mintFDOGEByOwner(to);
        
        Remaining_FDOGE = MAX_Token_supply - Total_Mint;
        
    }
    
    function _mintFDOGEByOwner(address any) private{
        Total_Mint++;
        
        _mint(any,Total_Mint);
        FDOGE_Upgrade[Total_Mint] = false;
        emit FDOGECreated(Total_Mint);
    }

    
    function WithDrawEth() public {//領出所有合約內ETH
        require(msg.sender == creatorAddress || msg.sender == devAddress);
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
    
    
    
   function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseURI(string memory baseURI) public  {
        require(msg.sender == devAddress);
        baseTokenURI = baseURI;
    }


}


