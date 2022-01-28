async function login_In_button(){
    await ethereum.request({ method: 'eth_requestAccounts' });
    window.location.reload();
}


async function RenewAddress(){

  coinbase = await web3.eth.getCoinbase();
  console.log(coinbase);

  let ETHbalance = await web3.eth.getBalance(coinbase);
  ETHbalance = web3.utils.fromWei(ETHbalance, 'ether');

  let add = coinbase.substring(0,15)
  add = add +"....";
  $("#login_address").text(add);
     
  setNFT_ABI();
}


//FDOGE_NFT_ABI

let FDOGE_Contract;
let FDOGE_agiContract;

let FDOGE_coin_contract;
let FDogeToken;

async function setNFT_ABI(){

  FDOGE_Contract= "0xbb5abff929e15239d9f28119d6e339276d2186f7";
    
  FDOGE_agiContract = new web3.eth.Contract(FDOGE_NFT_ABI,FDOGE_Contract);

  FDOGE_coin_contract ="0xF8136d6B6D1a49c6c61856Cb5c9ad4cd65f25C92";

  FDogeToken = new web3.eth.Contract(FDOGE_Token,FDOGE_coin_contract);

  
}

async function getTotalMint(){
  let mintValue = await FDOGE_agiContract.methods.total_mint().call();
  return mintValue;
}


async function MintFdoge(){
  
    await FDOGE_agiContract.methods.mint().send({from: coinbase, value:web3.utils.toWei('0.01', 'ether'), gas: 350000 })
    .on('receipt', function(receipt){
        // receipt example
        console.log(receipt);
     })
    .on('error', function(error){  
         console.log("error!");
    })
    .then(function(error, event){ 
    
        console.log("Finish"); 
    });
  

}


RenewAddress();

