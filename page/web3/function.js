

    

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

    !function foo(){
        // your other code here
        var num = $( "#input_value" ).val();

        
        try {
            throw "myException"; // 產生例外
        }
        catch (e) {
            // 用於處理例外的陳述式
            return; // 將例外物件傳給 error handler
        }
        setTimeout(get_F(num), 5000);       
       
       
    }();

    async function get_F(num){
        var WBNB = '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c';
        var FDOGE  = '0x361d8552d7db423ec0cb097a5911fe453d205374';
        var input = [WBNB,FDOGE];
        
        var get_num =  await pancake_Contract.methods.getAmountsOut(num,input).call({from:coinbase});
        $("#get_FDOGE").val(get_num[1]);

        
        return get_num;
    }


    var WBNB = '0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c';
    var FDOGE  = '0x361d8552d7db423ec0cb097a5911fe453d205374';
    var input = [WBNB,FDOGE];

    async function get_apir_value(){//取得預設匯兌樹量
        var num = $( "#input_value" ).val();
        var get_num;
        //factory = 0xc3ba7182a7ac992ba9a6fd472eb28f2476f519b7
        if(num>=1){
            get_num =  await pancake_Contract.methods.getAmountsOut(num,input).call({from:coinbase});
        }else if(num<0.01){
            alert("最小必須大於0.01 BNB!");
            
        }else if(num<1 && num>=0.1){
            num=num*10;
            get_num =  await pancake_Contract.methods.getAmountsOut(num,input).call({from:coinbase});
            get_num[0] = get_num[0]/10;
            get_num[1] = get_num[1]/10;
        }else if(num<0.1 && num>=0.01){
            num=num*100;
            get_num =  await pancake_Contract.methods.getAmountsOut(num,input).call({from:coinbase});
            get_num[0] = get_num[0]/100;
            get_num[1] = get_num[1]/100;
        }
        //function getAmountsIn
        get_num[1] = Math.ceil(get_num[1]);
        
        console.log("input BNB "+get_num[0]+" Out put FDOGE "+get_num[1]);
        //console.log(coinbase);
        $("#get_FDOGE").val(get_num[1]);

    }

    async function Swap_BNB_to_FDOGE(){//Swap BNB to FDOGE

        //swapExactETHForTokens(uint256 amountOutMin, address[] path, address to, uint256 deadline)

        var input_value = $("#get_FDOGE").val();
        
        input_value = input_value +'100000000000000000';

        console.log(input_value);
        //pancake_Contract.methods.swapExactETHForTokens(input_value,input,coinbase,50000000).call({from:coinbase});
        var kos = $( "#input_value" ).val();
        
        pancake_Contract.methods.swapExactETHForTokens(input_value,input,coinbase,17026684877).send({from: coinbase, value:web3.utils.toWei(kos, 'ether'), gas: 50000 })
        .then(function(receipt){

            alert("交易成功，你已經買到FDOGE了!");
            location.reload();
            window.location.reload();//畫面重新整理
        });
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


    var Give_FDOGE_address = '0x8187a1344cc5f35b63e055ef50716b6479250d5a';
    var Give_FDOGE_contract = new web3.eth.Contract(give_away_FDOGE, Give_FDOGE_address);

    async function get_FDOGE_free(){
        Give_FDOGE_contract.methods.Get_FDOGE().send({from: coinbase,gas: 70000})
        .then(function(receipt){

            alert("交易成功，你已經買到FDOGE了!");
           
        });
    }

    

    