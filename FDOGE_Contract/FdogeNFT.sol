// SPDX-License-Identifier: MIT

// import ERC-721
// import SafeMath

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract FDOGE_NFT is ERC721 {
 
    using SafeMath for uint256;

    string public TOKEN_PROVENANCE = ""; // IPFS 發行時執行

    uint256 public constant tonkenPrice = 80000000000000000; //0.08 * 10 ** 18 總共 0.08 ETH
    uint256 public constant MAX_Token_supply = 10000;//總產量
    uint256 public constant maxTokenPurchase = 10;//限制購買數量10
    
    address private constant creatorAddress = 0x66666694Ff556B311111Ce95830d3A363ad52C63 ;//設計團隊操作
    address private devAddress ;//開發者

    //constant 為不可竄改的

    uint256 private Total_Mint = 0;
    uint256 private Remaining_FDOGE = 0;

    string public baseTokenURI;

    bool public saleActive = false; //開啟交易
    bool public allowListIsActive = false;

    mapping(address => uint256) public NumberOfUpgrades; //用戶可以升級FDOGE
    mapping(uint256 => bool) public FDOGE_Upgrade; //是否升級過了
    
    mapping (uint256 => string) private _tokenURIs; //metadata URL

    
    event WabyCteated(uint256 indexed id);

    constructor() ERC721( "LAST FDOGE" , "FDOGE" ){//BaseURI 待定
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
    
    function preSaleActiveChange() public {
        require(msg.sender == devAddress,"You are not contract creater");
        
        if(preSale == false){
            preSale = true;
        }else{
            preSale = false;
        }
    }
    

    function totalSupply() public view returns(uint256){ //Waby總產量
        return MAX_Token_supply;
    }

    function total_Mint() public view returns(uint256){
        return Total_Mint;
    }
    function remain_Waby() public view returns(uint){ //剩下多少Waby 還沒有被鑄造
        return MAX_Token_supply - Total_Mint;
    }
    
    
       
    

    function mint() public payable{ // 第二次發售鑄造新的Waby 0.08ETH
        require(saleActive == true,"Sale is not open yet!");
        require(Total_Mint <= 10000,"Dope Waby has bean sale out");
        require(msg.value == 0.08 ether, "Value below price");
        require(balanceOf(msg.sender) <= 10,"You buy too much Waby!!");
       
        _mintWaby(msg.sender);
        
        Remaining_FDOGE = MAX_Token_supply - Total_Mint;
        
    }

    function _mintWaby(address buyer) private{
        Total_Mint++;
        
        _safeMint(buyer,Total_Mint);
        FDOGE_Upgrade[Total_Mint] = false;
        emit WabyCteated(Total_Mint);
    }
    
    
    



    function Mint_to_any_address(address to) public payable{//開發者團隊可以直接將Waby mint出並轉移到用戶身上
        require(msg.sender == devAddress);
        require(Total_Mint <= 10000,"Dope Waby has bean sale out");

         _mintWabyByOwner(to);
        
        Remaining_FDOGE = MAX_Token_supply - Total_Mint;
        
    }
    
    function _mintWabyByOwner(address buyer) private{
        Total_Mint++;
        
        _mint(buyer,Total_Mint);
        FDOGE_Upgrade[Total_Mint] = false;
        emit WabyCteated(Total_Mint);
    }

    
    function WithDrawEth() public {//領出所有合約內ETH
        require(msg.sender == creatorAddress || msg.sender == devAddress);
        payable(msg.sender).transfer(address(this).balance);
    }
    
    
    function GiveUserUpgradeChance(address userchance) public {
        require(msg.sender == creatorAddress || msg.sender == devAddress);
        NumberOfUpgrades[userchance] = NumberOfUpgrades[userchance] +1;
    }

    function Upgrade_Waby(uint256 FDOGE) public {
        require(ownerOf(FDOGE) == msg.sender,'This one is not your FDOGE!');
        require(NumberOfUpgrades[msg.sender] >= 1 ,"You cant't upgrade");
        FDOGE_Upgrade[FDOGE] = true;
        NumberOfUpgrades[msg.sender] = NumberOfUpgrades[msg.sender] -1;
           
    }
    
    
   function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseURI(string memory baseURI) public  {
        require(msg.sender == devAddress);
        baseTokenURI = baseURI;
    }


}


