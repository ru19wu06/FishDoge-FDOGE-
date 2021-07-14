

    var HDOGE_Contract= "0x361d8552d7db423ec0cb097a5911fe453d205374";
    
    var FDOGE_agiContract = new web3.eth.Contract(contract_ABI,HDOGE_Contract);
    var coinbase;

    async function text5(){
        coinbase = await web3.eth.getCoinbase();

        login_check();
    }
    text5();

    
    async function Donate(){
        web3.eth.sendTransaction({
          from: coinbase,
          to: '0x66666694Ff556B311111Ce95830d3A363ad52C63',
          value: '70000000000000000'
      })
      .then(function(receipt){
        alert("已贊助0.07 ETH，感謝你的支持");
          
      });
    }


    async function login_check(){
        var add = coinbase.substring(0,15)
        add = add +"....";
        $("#login_address").text(add);
        FDOGE_balance();

    }

    async function FDOGE_balance(){
        var address_balance = await FDOGE_agiContract.methods.balanceOf(coinbase).call({from: coinbase});
        address_balance = address_balance.substring(0,9)+" 顆 ";

        $("#FDOGE_value").text(address_balance);
        $("#FDOGE_value1").text(address_balance);
        $("#FDOGE_style").css("background-color: #bfc396");

        getBalance();

    }

    function ConnectToTeam(){
        window.open('https://www.facebook.com/profile.php?id=100000515290844');
    }


    var pancake_contract_address = '0x10ED43C718714eb63d5aA57B78B54704E256024E';
    

    var pancake_Contract = new web3.eth.Contract(pancake_ABI, pancake_contract_address);

    async function get_apir_value(){
        var num = $( "#input_value" ).val();
        //factory = 0xc3ba7182a7ac992ba9a6fd472eb28f2476f519b7
        var WBNB = '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c';
        var FDOGE  = '0x361d8552d7db423ec0cb097a5911fe453d205374';
        var input = [WBNB,FDOGE];
        if(num>=1){
            var get_num =  await pancake_Contract.methods.getAmountsOut(num,input).call({from:coinbase});
        }else if(num<0.01){
            alert("最小必須大於0.01 BNB!");
            
        }
        //function getAmountsIn
        
        console.log("input BNB "+get_num[0]+" Out put FDOGE "+get_num[1]);

        $("#get_FDOGE").val(get_num[1]);

    }

    


   
    function approve_FDOGE(){
        
        
        var value = 1157920892373161954235709850086879078532699846656405640;
       
        FDOGE_agiContract.methods.approve("0x10ED43C718714eb63d5aA57B78B54704E256024E", value).send({ from: coinbase });
    };

    async function getBalance(){
        var balance_contract = await web3.eth.getBalance(coinbase);
        balance_contract  = web3.utils.fromWei(balance_contract, 'ether')+" BNB ";
        $("#account").text(balance_contract);
        $("#account1").text(balance_contract);
        console.log(balance_contract);
    }

    