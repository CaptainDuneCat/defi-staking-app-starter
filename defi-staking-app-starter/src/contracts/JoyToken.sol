// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract JoyToken {



    // track balances
    mapping(address => uint256) private _balanceOf;

    // track allowances
    mapping(address => mapping(address => uint256)) private _allowance;

    string private _name;
    string private _symbol;


    event Transfer (
        address indexed from,
        address indexed to, 
        uint256 amount
    );

    event Approval (
        address indexed owner,
        address indexed spender,
        uint256 amount
    );


    constructor(string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _balanceOf[tx.origin] = 10000;
    }    
    

    function getBalance(address addr) public view returns (uint256) { 
        return _balanceOf[addr];
    }

    function getBalanceInEth(address addr) public view returns (uint256) {
        return _convert(getBalance(addr), 2);
    }

    function transfer(address to, uint256 amount) public virtual returns (bool) {
        address owner = msg.sender;
        _transfer(owner, to, amount);
        return true;
    }

    function approve(address owner, address spender, uint256 amount) public virtual returns (bool) {
        require(owner != address(0), "ERC: approve from the zero address");
        require(spender != address(0), "ERC: approve from the zero address"); 

        _allowance[owner][spender] = amount;
        emit Approval(owner, spender, amount);
        return true;
    }


    function transferFrom(address from, address to, uint256 amount) public virtual returns (bool) {
        address spender = msg.sender;
        address owner = from; 
        uint256 currentAllowance = _allowance[from][spender];

        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
        }
            approve(owner, spender, currentAllowance - amount);
            _transfer(from, to, amount);

        return true;
    }

   function _transfer(address from, address to, uint256 amount) internal virtual {
       require(from != address(0), "ERC: transfer from the zero address");
       require(to != address(0), "ERC: transfer to the zero address");

       uint256 fromBalance = _balanceOf[from];
       require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
       _balanceOf[from] -= amount;
       _balanceOf[to] += amount;
       emit Transfer(from, to, amount);
   } 

   function _convert(uint amount,uint conversionRate) internal pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}

}