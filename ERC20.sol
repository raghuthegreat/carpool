pragma solidity ^0.5.1;

import "./SafeMath.sol";

contract ERC20 {
    using SafeMath for uint256;
    string public name = "Vineyard COin";
    string public ticker = "VYC";
    uint private _totalSupply = 100000;
    
    mapping (address => uint) private _balances;
    mapping (address => mapping(address => uint)) private _allowed;
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address owner)public view returns (uint256) {
        return _balances[owner];
    }
    
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowed[owner][spender];
    }
    
    function approve(address spender, uint value) public returns (bool) {
        require(spender != address(0));
        
        _allowed[msg.sender][spender] = value;
        return true;
    }
    
    function _transfer(address from, address to, uint value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
    }
    
    function transferFrom(address from, address to, uint value) public returns (bool) {
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
    }
}
