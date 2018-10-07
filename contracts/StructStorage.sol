pragma solidity ^0.4.2;

contract StructStorage {

    uint256 public s = 1; 
    uint256 public c;
    uint256 public t=1;
    function StructStorage() public {
    }
    mapping (uint => uint) balances;

    function fundaddr(uint addr) {
        balances[addr] = 2000;
	}

    function sendCoin(address receiver, uint amount, address sender, uint rid, uint sid) returns(bool sufficient) {
		if (balances[sid] < amount) 
		return false;
		
		balances[sid] -= amount;
		balances[rid] += amount;
		
						
    	return true;
		
	}

    function getBalance(uint addr) returns(uint) {
		return balances[addr];
	}
struct User {

    uint uid;
    string name;
    string password;
    string aadhaar_num;
    string home_address;
    string phone_num;
    string user_type;
}

mapping(uint => User) public users;
    event registeredEvent (
        User indexed user
    );
function register(
    uint _uid,
    string _name,
    string _password,
    string _aadhaar_num,
    string _home_address,
    string _phone_num,
    string _user_type) public {
users[_uid] = User(_uid, _name,_password,_aadhaar_num,
_home_address,_phone_num,_user_type);

 registeredEvent(users[_uid]);
}

struct farmer {
   
    bytes fid;
    bytes32 name;
    bytes32 loc;
    bytes32 crop;
    uint256 contact;
    uint quantity;
    uint exprice;
}

struct lot {

    bytes lotno;
    bytes grade;
    uint mrp;
    bytes32 testdate;
    bytes32 expdate;
}

address public tester;
address owner;

mapping (bytes => farmer) f1;
farmer[] public fm;

mapping (bytes => lot) l1;
lot[] public l;



function produce(bytes id, bytes32 name, bytes32 loc, bytes32 cr, uint256 con, uint q, uint pr) {
               
        var fnew = farmer(id,name,loc,cr,con,q,pr);
        f1[id] = fnew;
        fm.push(fnew);
        s++;
  
}
    
 function getproduce(bytes j) constant returns(bytes,bytes32,bytes32,bytes32,uint256,uint,uint) {
        return (f1[j].fid,f1[j].name,f1[j].loc,f1[j].crop,f1[j].contact,f1[j].quantity,f1[j].exprice);
    }
 function quality(bytes ll, bytes g, uint p, bytes32 tt, bytes32 e) {
    
        var lnew=lot(ll,g,p,tt,e);
        l1[ll]=lnew;
        l.push(lnew);
        t++;
  
 }  
 function getquality(bytes k) constant returns(bytes,bytes,uint,bytes32,bytes32) {
     return(l1[k].lotno,l1[k].grade,l1[k].mrp,l1[k].testdate,l1[k].expdate);
     
 }
}
