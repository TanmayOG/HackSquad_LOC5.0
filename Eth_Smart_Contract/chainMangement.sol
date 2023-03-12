//SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;
pragma solidity >=0.5.0 <0.9.0;

contract ChainManagement {
    struct RawMaterial {
        string docId;
        address owner;
        string materialUrl;
    }

    struct Product {
        string docId;
        address owner;
        string productUrl;
    }

    struct Transport {
        string docId;
        address owner;
        string transportUrl;
    }

    struct Retailer {
        string docId;
        address owner;
        string retailerUrl;
    }

    struct Consumer {
        string docId;
        address owner;
        string consumerUrl;
    }

    mapping(uint => RawMaterial) public rawMaterials;
    mapping(uint => Product) public products;
    mapping(uint => Transport) public transports;
    mapping(uint => Retailer) public retailers;
    mapping(uint => Consumer) public consumers;

    uint public rawMaterialCount;
    uint public productCount;
    uint public transportCount;
    uint public retailerCount;
    uint public consumerCount;

    function addRawMaterial(
        string memory _docId,
        string memory _materialUrl,
        address owner
    ) public {
        rawMaterials[rawMaterialCount] = RawMaterial(
            _docId,
            owner,
            _materialUrl
        );
        rawMaterialCount++;
    }

    function addProduct(
        string memory _docId,
        string memory _productUrl,
        address owner
    ) public {
        products[productCount] = Product(_docId, owner, _productUrl);
        productCount++;
    }

    function addTransport(
        string memory _docId,
        string memory _transportUrl,
        address owner
    ) public {
        transports[transportCount] = Transport(_docId, owner, _transportUrl);
        transportCount++;
    }

    function addRetailer(
        string memory _docId,
        string memory _retailerUrl,
        address owner
    ) public {
        retailers[retailerCount] = Retailer(_docId, owner, _retailerUrl);
        retailerCount++;
    }

    function addConsumer(
        string memory _docId,
        string memory _consumerUrl,
        address owner
    ) public {
        consumers[consumerCount] = Consumer(_docId, owner, _consumerUrl);
        consumerCount++;
    }

    // get raw material by owner
    function getRawMaterialByOwner(
        address owner
    ) public view returns (RawMaterial[] memory) {
        RawMaterial[] memory result = new RawMaterial[](rawMaterialCount);
        uint counter = 0;
        for (uint i = 0; i < rawMaterialCount; i++) {
            if (rawMaterials[i].owner == owner) {
                result[counter] = rawMaterials[i];
                counter++;
            }
        }
    }

    // get product by owner

    function getProductByOwner(
        address owner
    ) public view returns (Product[] memory) {
        Product[] memory result = new Product[](productCount);
        uint counter = 0;
        for (uint i = 0; i < productCount; i++) {
            if (products[i].owner == owner) {
                result[counter] = products[i];
                counter++;
            }
        }
    }

    // get transport by owner

    function getTransportByOwner(
        address owner
    ) public view returns (Transport[] memory) {
        Transport[] memory result = new Transport[](transportCount);
        uint counter = 0;
        for (uint i = 0; i < transportCount; i++) {
            if (transports[i].owner == owner) {
                result[counter] = transports[i];
                counter++;
            }
        }
    }

    // get retailer by owner

    function getRetailerByOwner(
        address owner
    ) public view returns (Retailer[] memory) {
        Retailer[] memory result = new Retailer[](retailerCount);
        uint counter = 0;
        for (uint i = 0; i < retailerCount; i++) {
            if (retailers[i].owner == owner) {
                result[counter] = retailers[i];
                counter++;
            }
        }
    }

    // get consumer by owner

    function getConsumerByOwner(
        address owner
    ) public view returns (Consumer[] memory) {
        Consumer[] memory result = new Consumer[](consumerCount);
        uint counter = 0;
        for (uint i = 0; i < consumerCount; i++) {
            if (consumers[i].owner == owner) {
                result[counter] = consumers[i];
                counter++;
            }
        }
    }

    // now trace from consumer to raw material by docID

    function traceByDocId(
        string memory docId
    )
        public
        view
        returns (
            RawMaterial[] memory,
            Product[] memory,
            Transport[] memory,
            Retailer[] memory,
            Consumer[] memory
        )
    {
        RawMaterial[] memory rawMaterial = new RawMaterial[](rawMaterialCount);
        Product[] memory product = new Product[](productCount);
        Transport[] memory transport = new Transport[](transportCount);
        Retailer[] memory retailer = new Retailer[](retailerCount);
        Consumer[] memory consumer = new Consumer[](consumerCount);
        uint counter = 0;
        for (uint i = 0; i < consumerCount; i++) {
            if (
                keccak256(abi.encodePacked(consumers[i].docId)) ==
                keccak256(abi.encodePacked(docId))
            ) {
                consumer[counter] = consumers[i];
                counter++;
            }
        }
        counter = 0;
        for (uint i = 0; i < retailerCount; i++) {
            if (
                keccak256(abi.encodePacked(retailers[i].docId)) ==
                keccak256(abi.encodePacked(docId))
            ) {
                retailer[counter] = retailers[i];
                counter++;
            }
        }
        counter = 0;
        for (uint i = 0; i < transportCount; i++) {
            if (
                keccak256(abi.encodePacked(transports[i].docId)) ==
                keccak256(abi.encodePacked(docId))
            ) {
                transport[counter] = transports[i];
                counter++;
            }
        }
        counter = 0;
        for (uint i = 0; i < productCount; i++) {
            if (
                keccak256(abi.encodePacked(products[i].docId)) ==
                keccak256(abi.encodePacked(docId))
            ) {
                product[counter] = products[i];
                counter++;
            }
        }
        counter = 0;
        for (uint i = 0; i < rawMaterialCount; i++) {
            if (
                keccak256(abi.encodePacked(rawMaterials[i].docId)) ==
                keccak256(abi.encodePacked(docId))
            ) {
                rawMaterial[counter] = rawMaterials[i];
                counter++;
            }
        }
        return (rawMaterial, product, transport, retailer, consumer);
    }
}
