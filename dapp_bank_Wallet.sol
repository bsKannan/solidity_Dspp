
pragma solidity ^0.4.0;
contract Bank_Wallet
{
    struct bks
    { 
        uint256 balance;   
     }
    mapping(address => bks)bks1;
    mapping(address=>mapping(address => uint256))bks2;
    address owner=msg.sender;
   
   function totalSupply(uint256 dep)
    {
        bks1[owner].balance=dep;
    }
    function transfer(address reciver,uint256 transamt) public
    {
        require(bks1[msg.sender].balance>transamt);
        bks1[reciver].balance+=transamt;
        bks1[msg.sender].balance-=transamt;
    }
     function approve(address _spender, uint256 _value) returns (bool success) {
        
        bks2[msg.sender][_spender] = _value;
        
        return true;
    }
    
   function allowance(address _owner, address _spender) constant returns (uint256 remaining) 
   {
      return bks2[_owner][_spender];
   }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) 
    {
       if (bks2[msg.sender][_from] >= _value && _value > 0) 
       {
           bks1[_to].balance += _value;
            bks1[msg.sender].balance -= _value;
            bks2[msg.sender][_from] -= _value;
            
            return true;
        } 
        else 
        {
            return false; 
        }
    }
    function balanceOf(address balcheck)public view returns(uint256)
    {
        return bks1[balcheck].balance;
    }
}
