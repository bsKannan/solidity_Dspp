
pragma solidity ^0.4.0;
contract Recharge_Shop
{
    uint256 amount=7000;
    uint256[] arr;
    uint256 count=0;
    struct details 
    {
        uint256[] a;
        uint256 balance;
        uint256 ph_no;
        uint256 id;
        uint256 Total_duration;
        uint256 value;
    }
    uint256[] ar;
    mapping(uint256=>details) acc;
    modifier check2(uint256 _cash,uint256 from)
    {
        require((_cash<acc[from].balance));
        _;
    }
    modifier check(uint256 ph_no)
    {
          while(ph_no!=0)
            {
            ph_no=(ph_no/10);
            count++;
            }
            require(count==10);
        _;
    }
    function Recharge_Shop() 
    {
        acc[1].balance=amount;
    }
    function phone(uint256 ph_no) check(ph_no) private
    {
        acc[ph_no].ph_no=ph_no;
      
    }
    function history() constant returns(uint256[])
    {
        return arr;
    }
    function transfer(uint256 from,uint256 ph_no,uint256 _cash)check2(_cash,from) public
    {
        arr.push(ph_no);
        arr.push(_cash);
        acc[ph_no].balance+=_cash;
        acc[from].balance-=_cash;
        acc[ph_no].a.push(_cash);
    }
   function balance(uint256 from) public constant returns(uint256)
   {
       return acc[from].balance;
   }
    function ph_balance(uint256 ph_no) public constant  returns(uint256)
   {
       return acc[ph_no].balance;
   }
}
