// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

 
 contract Student{
//struct contenting student info
     struct studentInfo{
         string name;
         string class;
         string food;
         uint256 age;
         
     }
     //A variable storing adminonly
     address adminAddress;
     constructor(address _addr){
         adminAddress = _addr;
     }
     modifier strictlyAdmin(){
         require(msg.sender == adminAddress,"only admin can update");
         _;
     }
     mapping (address => studentInfo) public Studentinfo;
     function studentUpdate(address _addr, string memory _name) public {
         studentInfo storage studentinfo = Studentinfo [_addr];
         studentinfo.name = _name;
     }
     // function to update student
     function studentupdate2(address _addr, string memory _class) public{
         Studentinfo[_addr].class = _class;
     }
     //function that allow admin to update student

     function studentupdate3(address _addr, uint256 _age)public {
         Studentinfo[_addr].age = _age;
     }
     //function that allow admin to delete 
     function removeStudent(address _addr ) public{
         require(msg.sender == adminAddress,"only admin can delete");
         delete Studentinfo[_addr];
     }
 }



