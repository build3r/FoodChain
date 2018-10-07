var accounts;
var account;

function PopulateFarmer() {
	
	var meta = StructStorage.deployed();
	
		
		for(var i = 0; i < 10; i++) {
		
		
		meta.getfarmernew.call( i, {from: account}).then(function(value) {
		var sel = document.getElementById('farmer');
		var selascii = web3.toAscii(value);
		var opt = document.createElement('option');
		opt.innerHTML = selascii;
		opt.value = selascii;
		if(value!=null)
		sel.appendChild(opt);	
	}).catch(function(e) {
    console.log(e);

  });
}


}

function storage(){
	
var val = document.getElementById('farmer').value;
localStorage["key"] = val;

console.log(val);


}

function getdetails(){

var metaget = StructStorage.deployed();

var fid = document.getElementById("farmer").value;



metaget.getproduce.call( fid, {from: account}).then(function(value) {
  	
    
    var span_element2 = document.getElementById("getval2");
	var str = web3.toAscii(value[1]);
    span_element2.innerHTML = str;

	var span_element3 = document.getElementById("getval3");
	var str = web3.toAscii(value[2]);
    span_element3.innerHTML = str;	
 
	var str = web3.toAscii(value[3]);
	var span_element4 = document.getElementById("getval4");
	span_element4.innerHTML = str;

	var span_element5 = document.getElementById("getval5");
	span_element5.innerHTML = value[4].valueOf();

	var span_element6 = document.getElementById("getval6");
	span_element6.innerHTML = value[5].valueOf();
	
	var span_element7 = document.getElementById("getval7");
    span_element7.innerHTML = value[6].valueOf();
 

    
  }).catch(function(e) {
    console.log(e);
    
  });
var table = document.getElementById("table1");
  table1.style.display = 'block';
  
}

window.onload = function() {
  
  web3.eth.getAccounts(function(err, accs) {
    if (err != null) {
      alert("There was an error fetching your accounts.");
      return;
    }

    if (accs.length == 0) {
      alert("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
      return;
    }

    accounts = accs;
    account = accounts[0];
	

	
  });
 
  PopulateFarmer();	
}