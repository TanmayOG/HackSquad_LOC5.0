//SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity >=0.5.0 <0.9.0;

contract SuppyChain {
    struct NewSuppler {
        address supplerAddress;
        string supplerName;
        string supplerLocation;
        string supplerContact;
        string supplerEmail;
        string role;
        bool isSuppler;
    }

    struct RawMaterial {
        string materialName;
        string materialType;
        string materialLocation;
        string materialDate;
        string materialOwnerAddress;
        string materialOwnerContact;
        string materialOwnerEmail;
        string materialOwnerRole;
    }

    mapping(uint => NewSuppler) public suppler;
    mapping(uint => RawMaterial) public rawMaterial;
    address[] public supplerAccts;


    uint public supplerCount;
    uint public rawMaterialCount;
    address public owner;


    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // suppler add there details and bydefault isSuppler is false

    function addSuppler(
        address _address,
        string memory _name,
        string memory _location,
        string memory _contact,
        string memory _email,
        string memory _role
    ) public {
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                revert("Suppler already exists");
            }
        }
        suppler[supplerCount] = NewSuppler(
            _address,
            _name,
            _location,
            _contact,
            _email,
            _role,
            false
        );

        supplerCount++;
        supplerAccts.push(_address);
    }

    // verify suppler by owner

    function verifySuppler(address _address) public {
        require(msg.sender == owner);
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                suppler[i].isSuppler = !suppler[i].isSuppler;
            }
        }
    }

   // if suppler is IsSuppler then suppler can add raw material

    function addRawMaterial(
        string memory _materialName,
        string memory _materialType,
        string memory _materialLocation,
        string memory _materialDate,
        string memory _materialOwnerAddress,
        string memory _materialOwnerContact,
        string memory _materialOwnerEmail,
        string memory _materialOwnerRole
    ) public {
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == msg.sender) {
                if (suppler[i].isSuppler == true) {
                    rawMaterial[rawMaterialCount] = RawMaterial(
                        _materialName,
                        _materialType,
                        _materialLocation,
                        _materialDate,
                        _materialOwnerAddress,
                        _materialOwnerContact,
                        _materialOwnerEmail,
                        _materialOwnerRole
                    );
                    rawMaterialCount++;
                } else {
                    revert("You are not a suppler");
                }
            }else{
                


            }
        }
    }



    // // get all suppler details

    // function getSuppler() public view returns (NewSuppler[] memory) {
    //     NewSuppler[] memory supplerList = new NewSuppler[](supplerCount);
    //     for (uint i = 0; i < supplerCount; i++) {
    //         supplerList[i] = suppler[i];
    //     }
    //     return supplerList;
    // }

    // // get all raw material details

    // function getRawMaterial() public view returns (RawMaterial[] memory) {
    //     RawMaterial[] memory rawMaterialList = new RawMaterial[](
    //         rawMaterialCount
    //     );
    //     for (uint i = 0; i < rawMaterialCount; i++) {
    //         rawMaterialList[i] = rawMaterial[i];
    //     }
    //     return rawMaterialList;
    // }

    // // get all suppler address

    // function getSupplerAddress() public view returns (address[] memory) {
    //     return supplerAccts;
    // }

    // // get suppler details by address

    // function getSupplerByAddress(address _address)
    //     public
    //     view
    //     returns (NewSuppler memory)
    // {
    //     for (uint i = 0; i < supplerAccts.length; i++) {
    //         if (supplerAccts[i] == _address) {
    //             return suppler[i];
    //         }
    //     }
    // }

    // get raw




}
