pragma solidity ^0.6.0;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}



library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}



contract DEX {

    event Bought(uint256 amount);
    event Sold(uint256 amount);


    constructor () public {
        owner = msg.sender;
        uint frequency = 10;
        address FDOGE_Address = 0x361d8552d7db423ec0cb097a5911fe453d205374;
    }

    mapping (address => uint) public Gets;
    mapping (address => uint256) public balances;

    event AwardList(address,uint frequency,uint tatal_FDOGE);

    constructor() public {
        token = new ERC20Basic();
    }

        ERC20(FDOGE_Address).transferFrom(msg.sender, address(this), 50000);

        uint balanca_of_account = ERC20(FDOGE_Address).balanceOf(msg.sender);
        
        
        emit AwardList(msg.sender,Gets[msg.sender],balanca_of_account);

   

}


//  function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)external virtual override payable ensure(deadline) returns (uint[] memory amounts){
//         require(path[0] == WETH, 'PancakeRouter: INVALID_PATH');
//         amounts = PancakeLibrary.getAmountsOut(factory, msg.value, path);
//         require(amounts[amounts.length - 1] >= amountOutMin, 'PancakeRouter: INSUFFICIENT_OUTPUT_AMOUNT');
//         IWETH(WETH).deposit{value: amounts[0]}();
//         assert(IWETH(WETH).transfer(PancakeLibrary.pairFor(factory, path[0], path[1]), amounts[0]));
//         _swap(amounts, path, to);
//     }



// function buy() payable public {
//         uint256 amountTobuy = msg.value;
//         uint256 dexBalance = token.balanceOf(address(this));
//         require(amountTobuy > 0, "You need to send some Ether");
//         require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
//         token.transfer(msg.sender, amountTobuy);
//         emit Bought(amountTobuy);
//     }

//     function sell(uint256 amount) public {
//         require(amount > 0, "You need to sell at least some tokens");
//         uint256 allowance = token.allowance(msg.sender, address(this));
//         require(allowance >= amount, "Check the token allowance");
//         token.transferFrom(msg.sender, address(this), amount);
//         msg.sender.transfer(amount);
//         emit Sold(amount);
//     }
