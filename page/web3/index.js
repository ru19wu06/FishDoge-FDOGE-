async function login_In_button(){
    ethereum.request({ method: 'eth_requestAccounts' });
    window.location.reload();
}

let coinbase;
async function RenewAddress(){

  coinbase = await web3.eth.getCoinbase();
  console.log(coinbase);

  let ETHbalance = await web3.eth.getBalance(coinbase);
  ETHbalance = web3.utils.fromWei(ETHbalance, 'ether');

  let add = coinbase.substring(0,15)
  add = add +"....";
  $("#login_address").text(ETHbalance.substring(0,6)+" Eth | "+add);
     
  setNFT_ABI();
}


//FDOGE_NFT_ABI

var FDOGE_Contract;
var FDOGE_agiContract;

async function setNFT_ABI(){
  FDOGE_Contract= "0x361d8552d7db423ec0cb097a5911fe453d205374";
    
  FDOGE_agiContract = new web3.eth.Contract(FDOGE_NFT_ABI,FDOGE_Contract);
}


async function MintFdoge(){
  await FDOGE_agiContract.methods.mint().send({from: coinbase, value:web3.utils.toWei('0.01', 'ether'), gas: 350000 })
  .then(function(receipt){

    alert("交易成功，你已經買到FDOGE了!");
  })

}


RenewAddress();