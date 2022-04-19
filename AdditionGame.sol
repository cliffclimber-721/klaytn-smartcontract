pragma solidity ^0.4.24;

contract AdditionGame {
    address public Owner;

    constructor() public {
        Owner = msg.sender; // 현재 이 컨트랙트를 호출하고 있는 사람을 의미한다. 배포하는 데 쓰이는 계정을 의미
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function getDeposit() public payable {
        require(msg.sender == Owner);
    }

    function getTransfer(uint256 _value) public returns (bool) {
        require(getBalance() >= _value);
        msg.sender.transfer(_value);
        return true;
    }
}
