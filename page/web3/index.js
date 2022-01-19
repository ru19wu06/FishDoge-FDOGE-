async function login_In_button(){
    ethereum.request({ method: 'eth_requestAccounts' });
    window.location.reload();
}

let coinbase;
async function RenewAddress(){

  coinbase = await web3.eth.getCoinbase();

  let ETHbalance = await web3.eth.getBalance(coinbase);
  ETHbalance = web3.utils.fromWei(ETHbalance, 'ether');

  let add = coinbase.substring(0,15)
  add = add +"....";
  $("#login_address").text(ETHbalance.substring(0,6)+" Eth | "+add);
     
}
RenewAddress();