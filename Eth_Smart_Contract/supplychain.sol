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
        string materialId;
        string materialType;
        string materialLocation;
        string materialDate;
        address materialOwnerAddress;
    }

    struct Manufacture {
        string productToken;
        address manufactureAddress;
    }

    struct TransferRawToManufacture {
        address manufactureAddress;
        address rawMaterialAddress;
        string rawMaterialId;
    }

    struct Distributor {
        string productToken;
        address distributorAddress;
        address manufactureAddress;
        uint productQuantity;
        string productDate;
        string productLocation;
        string docId;
    }

    struct Retailers {
        string productToken;
        address retailerAddress;
        address distributorAddress;
        uint productQuantity;
        string productDate;
        string productLocation;
        string docId;
    }

    struct Customer {
        string productToken;
        address customerAddress;
        address retailerAddress;
        uint productQuantity;
        string productDate;
        string productLocation;
        string docId;
    }

    // create an NFT Token

    mapping(uint => NewSuppler) public suppler;
    mapping(uint => RawMaterial) public rawMaterial;
    mapping(uint => Manufacture) public manufacture;
    mapping(uint => TransferRawToManufacture) public transferRawToManufacture;
    mapping(uint => Distributor) public distributor;
    mapping(uint => Retailers) public retailers;
    mapping(uint => Customer) public customer;
    address[] public supplerAccts;
    uint public supplerCount;
    uint public rawMaterialCount;
    uint public manufactureCount;
    uint public transferRawToManufactureCount;
    uint public distributorCount;
    uint public retailersCount;
    uint public customerCount;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function AddSuppler(
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

    function VerifySuppler(address _address) public {
        require(msg.sender == owner);
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                suppler[i].isSuppler = !suppler[i].isSuppler;
            }
        }
    }

   function GetAllSuppler( ) public view returns (NewSuppler[] memory) {
        NewSuppler[] memory temp = new NewSuppler[](supplerCount);
        for (uint i = 0; i < supplerCount; i++) {
            temp[i] = suppler[i];
        }
        return temp;
    }

   
    // add raw material

   function AddMaterial(
        string memory _materialName,
        string memory _materialId,
        string memory _materialType,
        string memory _materialLocation,
        string memory _materialDate,
        address _materialOwnerAddress
    ) public {
        require(isVerified(msg.sender) == true);
        rawMaterial[rawMaterialCount] = RawMaterial(
            _materialName,
            _materialId,
            _materialType,
            _materialLocation,
            _materialDate,
            _materialOwnerAddress
        );
        rawMaterialCount++;
    }


// get Raw Material Where Address is equal to owner address

function GetRawMaterials(address _ownerAddress)
        public
        view
        returns (RawMaterial[] memory)
    {
       
        RawMaterial[] memory temp = new RawMaterial[](rawMaterialCount);
        uint count = 0;
        for (uint i = 0; i < rawMaterialCount; i++) {
            if (rawMaterial[i].materialOwnerAddress == _ownerAddress) {
                temp[count] = rawMaterial[i];
                count++;
            }
        }
        return temp;
    }

    function GetRawMaterialByOwnerAddress(address _ownerAddress)
        public
        view
        returns (RawMaterial[] memory)
    {
        require(isVerified(msg.sender) == true);
        RawMaterial[] memory temp = new RawMaterial[](rawMaterialCount);
        uint count = 0;
        for (uint i = 0; i < rawMaterialCount; i++) {
            if (rawMaterial[i].materialOwnerAddress == _ownerAddress) {
                temp[count] = rawMaterial[i];
                count++;
            }
        }
        return temp;
    }
        

    function TransferToManuFacture(
        address _manufactureAddress,
        address _rawMaterialAddress,
        string memory _rawMaterialId
    ) public {
        // require(isVerified(msg.sender) == true);
        // require(isVerified(_manufactureAddress) == true);
        transferRawToManufacture[
            transferRawToManufactureCount
        ] = TransferRawToManufacture(
            _manufactureAddress,
            _rawMaterialAddress,
            _rawMaterialId
        );
        transferRawToManufactureCount++;
    }

    // get all data when raw material is transfered to manufacture

    function GetRawMaterialTransferToManufacture(
        address _manufactureAddress
    ) public view returns (TransferRawToManufacture[] memory) {
        require(isVerified(msg.sender) == true);
        TransferRawToManufacture[] memory temp = new TransferRawToManufacture[](
            transferRawToManufactureCount
        );
        uint count = 0;
        for (uint i = 0; i < transferRawToManufactureCount; i++) {
            if (
                transferRawToManufacture[i].manufactureAddress ==
                _manufactureAddress
            ) {
                temp[count] = transferRawToManufacture[i];
                count++;
            }
        }
        return temp;
    }

    // add manufacture

    function AddManufacture(
        string memory productToken,
        address manufactureAddress
    ) public {
        // require(isVerified(msg.sender) == true);
        manufacture[manufactureCount] = Manufacture(
            productToken,
            manufactureAddress
        );
        manufactureCount++;
    }


    function displayManufacture() public view returns (Manufacture[] memory) {
        require(isVerified(msg.sender) == true);
        Manufacture[] memory temp = new Manufacture[](manufactureCount);
        for (uint i = 0; i < manufactureCount; i++) {
            temp[i] = manufacture[i];
        }
        return temp;
    }

    function AddDistributor(
        string memory _productToken,
        address _distributorAddress,
        address _manufactureAddress,
        uint _productQuantity,
        string memory _productDate,
        string memory _productLocation,
        string memory _docId
    ) public {
        require(isVerified(msg.sender) == true);
        // also check if manufacture is verified
        require(isVerified(_manufactureAddress) == true);
        distributor[distributorCount] = Distributor(
            _productToken,
            _distributorAddress,
            _manufactureAddress,
            _productQuantity,
            _productDate,
            _productLocation,
            _docId
        );
        distributorCount++;
    }

    function GetDistributor(
        address _distributorAddress
    ) public view returns (Distributor[] memory) {
        require(isVerified(msg.sender) == true);
        Distributor[] memory temp = new Distributor[](distributorCount);
        uint count = 0;
        for (uint i = 0; i < distributorCount; i++) {
            if (distributor[i].distributorAddress == _distributorAddress) {
                temp[count] = distributor[i];
                count++;
            }
        }
        return temp;
    }

    function AddRetailers(
        string memory _productToken,
        address _retailerAddress,
        address _distributorAddress,
        uint _productQuantity,
        string memory _productDate,
        string memory _productLocation,
        string memory _docId
    ) public {
        require(isVerified(msg.sender) == true);
        // also check if distributor is verified
        require(isVerified(_retailerAddress) == true);
        retailers[retailersCount] = Retailers(
            _productToken,
            _retailerAddress,
            _distributorAddress,
            _productQuantity,
            _productDate,
            _productLocation,
            _docId
        );
        retailersCount++;

        reduceQuantityFromDistributor(
            _distributorAddress,
            _productQuantity,
            _docId
        );
    }

    function reduceQuantityFromDistributor(
        address _distributorAddress,
        uint _productQuantity,
        string memory docId
    ) public {
        require(isVerified(msg.sender) == true);
        for (uint i = 0; i < distributorCount; i++) {
            if (distributor[i].distributorAddress == _distributorAddress) {
                if (
                    keccak256(abi.encodePacked(distributor[i].docId)) ==
                    keccak256(abi.encodePacked(docId))
                ) {
                    distributor[i].productQuantity =
                        distributor[i].productQuantity -
                        _productQuantity;
                }
            }
        }
    }

    function reduceQuantityFromRetailer(
        address _retailerAddress,
        uint _productQuantity,
        string memory docId
    ) public {
        require(isVerified(msg.sender) == true);
        for (uint i = 0; i < retailersCount; i++) {
            if (retailers[i].retailerAddress == _retailerAddress) {
                if (
                    keccak256(abi.encodePacked(retailers[i].docId)) ==
                    keccak256(abi.encodePacked(docId))
                ) {
                    retailers[i].productQuantity =
                        retailers[i].productQuantity -
                        _productQuantity;
                }
            }
        }
    }

    function GetRetailers(
        address _retailerAddress
    ) public view returns (Retailers[] memory) {
        require(isVerified(msg.sender) == true);
        Retailers[] memory temp = new Retailers[](retailersCount);
        uint count = 0;
        for (uint i = 0; i < retailersCount; i++) {
            if (retailers[i].retailerAddress == _retailerAddress) {
                temp[count] = retailers[i];
                count++;
            }
        }
        return temp;
    }

    function giveToCustomer(
        string memory _productToken,
        address _customerAddress,
        address _retailerAddress,
        uint _productQuantity,
        string memory _productDate,
        string memory _productLocation,
        string memory _docId
    ) public {
        require(isVerified(msg.sender) == true);
        // also check if retailer is verified
        require(isVerified(_retailerAddress) == true);
        customer[customerCount] = Customer(
            _productToken,
            _customerAddress,
            _retailerAddress,
            _productQuantity,
            _productDate,
            _productLocation,
            _docId
        );
        customerCount++;

        reduceQuantityFromRetailer(_retailerAddress, _productQuantity, _docId);
    }

    function AddManufacture(
        address _manufactureAddress,
        string memory _productToken
    ) public {
        require(isVerified(msg.sender) == true);
        manufacture[manufactureCount] = Manufacture(
            _productToken,
            _manufactureAddress
        );
        manufactureCount++;
    }

    function GetProductToken(
        address _manufactureAddress
    ) public view returns (Manufacture[] memory) {
        require(isVerified(msg.sender) == true);
        Manufacture[] memory temp = new Manufacture[](manufactureCount);
        uint count = 0;
        for (uint i = 0; i < manufactureCount; i++) {
            if (manufacture[i].manufactureAddress == _manufactureAddress) {
                temp[count] = manufacture[i];
                count++;
            }
        }
        return temp;
    }

    function isVerified(address _address) public view returns (bool) {
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                return suppler[i].isSuppler;
            }
        }
    }

    // create function to see suppler are are present or not

    function isSuppler(address _address) public view returns (bool) {
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                return true;
            }else{
                return false;
            }
        }
        return false;
    }

    function CheckisVerified(address _address) public view returns (bool) {
        for (uint i = 0; i < supplerAccts.length; i++) {
            if (supplerAccts[i] == _address) {
                if (suppler[i].isSuppler == true) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }
}
