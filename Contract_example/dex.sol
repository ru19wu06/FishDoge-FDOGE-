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


<<<<<<< HEAD:getFDOGE.sol
=======
contract ERC20Basic is IERC20 {

    string public constant name = "ERC20Basic";
    string public constant symbol = "ERC";
    uint8 public constant decimals = 18;


    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_ = 10 ether;

    using SafeMath for uint256;

   constructor() public {
	balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256) {
	return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
>>>>>>> refs/remotes/origin/main:dex.sol

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

<<<<<<< HEAD:getFDOGE.sol
contract get_FDOGE{
    constructor () public {
        owner = msg.sender;
        uint frequency = 10;
        address FDOGE_Address = 0x361d8552d7db423ec0cb097a5911fe453d205374;
    }

    mapping (address => uint) public Gets;
    mapping (address => uint256) public balances;

    event AwardList(address,uint frequency,uint tatal_FDOGE);
=======

    IERC20 public token;
>>>>>>> refs/remotes/origin/main:dex.sol

    constructor() public {
        token = new ERC20Basic();
    }

<<<<<<< HEAD:getFDOGE.sol
        ERC20(FDOGE_Address).transferFrom(msg.sender, address(this), 50000);

        uint balanca_of_account = ERC20(FDOGE_Address).balanceOf(msg.sender);
        
        
        emit AwardList(msg.sender,Gets[msg.sender],balanca_of_account);
=======
    function buy() payable public {
        uint256 amountTobuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some Ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        token.transfer(msg.sender, amountTobuy);
        emit Bought(amountTobuy);
    }
>>>>>>> refs/remotes/origin/main:dex.sol

    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        token.transferFrom(msg.sender, address(this), amount);
        msg.sender.transfer(amount);
        emit Sold(amount);
    }

}


<<<<<<< HEAD:getFDOGE.sol
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
=======

pragma solidity ^0.8;

interface IERC20 {
    function transfer(address _to, uint256 _value) external returns (bool);
    
    // don't need to define other functions, only using `transfer()` in this case
}

contract MyContract {
    // Do not use in production
    // This function can be executed by anyone
    function sendUSDT(address _to, uint256 _amount) external {
         // This is the mainnet USDT contract address
         // Using on other networks (rinkeby, local, ...) would fail
         //  - there's no contract on this address on other networks
        IERC20 usdt = IERC20(address(0xdAC17F958D2ee523a2206206994597C13D831ec7));
        
        // transfers USDT that belong to your contract to the specified address
        usdt.transfer(_to, _amount);
    }
}
>>>>>>> refs/remotes/origin/main:dex.sol
