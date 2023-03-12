export const ABI = [
  {
    inputs: [
      {
        internalType: "string",
        name: "_productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "_distributorAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "_manufactureAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "_productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "_productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
    ],
    name: "AddDistributor",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_manufactureAddress",
        type: "address",
      },
      {
        internalType: "string",
        name: "_productToken",
        type: "string",
      },
    ],
    name: "AddManufacture",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_materialName",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialType",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialOwnerAddress",
        type: "string",
      },
    ],
    name: "AddMaterial",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "_retailerAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "_distributorAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "_productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "_productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
    ],
    name: "AddRetailers",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_address",
        type: "address",
      },
      {
        internalType: "string",
        name: "_name",
        type: "string",
      },
      {
        internalType: "string",
        name: "_location",
        type: "string",
      },
      {
        internalType: "string",
        name: "_contact",
        type: "string",
      },
      {
        internalType: "string",
        name: "_email",
        type: "string",
      },
      {
        internalType: "string",
        name: "_role",
        type: "string",
      },
    ],
    name: "AddSuppler",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "_customerAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "_retailerAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "_productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "_productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
    ],
    name: "giveToCustomer",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_distributorAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    name: "reduceQuantityFromDistributor",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_retailerAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "_productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    name: "reduceQuantityFromRetailer",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_manufactureAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "_rawMaterialAddress",
        type: "address",
      },
      {
        internalType: "string",
        name: "_rawMaterialId",
        type: "string",
      },
    ],
    name: "TransferToManuFacture",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_address",
        type: "address",
      },
    ],
    name: "VerifySuppler",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_address",
        type: "address",
      },
    ],
    name: "CheckisVerified",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "customer",
    outputs: [
      {
        internalType: "string",
        name: "productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "customerAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "retailerAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "customerCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "distributor",
    outputs: [
      {
        internalType: "string",
        name: "productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "distributorAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "manufactureAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "distributorCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_manufactureAddress",
        type: "address",
      },
    ],
    name: "GetAllManufactureGoods",
    outputs: [
      {
        components: [
          {
            internalType: "address",
            name: "manufactureAddress",
            type: "address",
          },
          {
            internalType: "address",
            name: "rawMaterialAddress",
            type: "address",
          },
          {
            internalType: "string",
            name: "rawMaterialId",
            type: "string",
          },
        ],
        internalType: "struct SuppyChain.TransferRawToManufacture[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "GetAllSuppler",
    outputs: [
      {
        components: [
          {
            internalType: "address",
            name: "supplerAddress",
            type: "address",
          },
          {
            internalType: "string",
            name: "supplerName",
            type: "string",
          },
          {
            internalType: "string",
            name: "supplerLocation",
            type: "string",
          },
          {
            internalType: "string",
            name: "supplerContact",
            type: "string",
          },
          {
            internalType: "string",
            name: "supplerEmail",
            type: "string",
          },
          {
            internalType: "string",
            name: "role",
            type: "string",
          },
          {
            internalType: "bool",
            name: "isSuppler",
            type: "bool",
          },
        ],
        internalType: "struct SuppyChain.NewSuppler[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_distributorAddress",
        type: "address",
      },
    ],
    name: "GetDistributor",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "productToken",
            type: "string",
          },
          {
            internalType: "address",
            name: "distributorAddress",
            type: "address",
          },
          {
            internalType: "address",
            name: "manufactureAddress",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "productQuantity",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "productDate",
            type: "string",
          },
          {
            internalType: "string",
            name: "productLocation",
            type: "string",
          },
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
        ],
        internalType: "struct SuppyChain.Distributor[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_manufactureAddress",
        type: "address",
      },
    ],
    name: "GetProductToken",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "productToken",
            type: "string",
          },
          {
            internalType: "address",
            name: "manufactureAddress",
            type: "address",
          },
        ],
        internalType: "struct SuppyChain.Manufacture[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_materialOwnerAddress",
        type: "string",
      },
    ],
    name: "GetRawMaterial",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "materialName",
            type: "string",
          },
          {
            internalType: "string",
            name: "materialId",
            type: "string",
          },
          {
            internalType: "string",
            name: "materialType",
            type: "string",
          },
          {
            internalType: "string",
            name: "materialLocation",
            type: "string",
          },
          {
            internalType: "string",
            name: "materialDate",
            type: "string",
          },
          {
            internalType: "string",
            name: "materialOwnerAddress",
            type: "string",
          },
        ],
        internalType: "struct SuppyChain.RawMaterial[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_retailerAddress",
        type: "address",
      },
    ],
    name: "GetRetailers",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "productToken",
            type: "string",
          },
          {
            internalType: "address",
            name: "retailerAddress",
            type: "address",
          },
          {
            internalType: "address",
            name: "distributorAddress",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "productQuantity",
            type: "uint256",
          },
          {
            internalType: "string",
            name: "productDate",
            type: "string",
          },
          {
            internalType: "string",
            name: "productLocation",
            type: "string",
          },
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
        ],
        internalType: "struct SuppyChain.Retailers[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_address",
        type: "address",
      },
    ],
    name: "isSuppler",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "_address",
        type: "address",
      },
    ],
    name: "isVerified",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "manufacture",
    outputs: [
      {
        internalType: "string",
        name: "productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "manufactureAddress",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "manufactureCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "owner",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "rawMaterial",
    outputs: [
      {
        internalType: "string",
        name: "materialName",
        type: "string",
      },
      {
        internalType: "string",
        name: "materialId",
        type: "string",
      },
      {
        internalType: "string",
        name: "materialType",
        type: "string",
      },
      {
        internalType: "string",
        name: "materialLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "materialDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "materialOwnerAddress",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "rawMaterialCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "retailers",
    outputs: [
      {
        internalType: "string",
        name: "productToken",
        type: "string",
      },
      {
        internalType: "address",
        name: "retailerAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "distributorAddress",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "productQuantity",
        type: "uint256",
      },
      {
        internalType: "string",
        name: "productDate",
        type: "string",
      },
      {
        internalType: "string",
        name: "productLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "retailersCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "suppler",
    outputs: [
      {
        internalType: "address",
        name: "supplerAddress",
        type: "address",
      },
      {
        internalType: "string",
        name: "supplerName",
        type: "string",
      },
      {
        internalType: "string",
        name: "supplerLocation",
        type: "string",
      },
      {
        internalType: "string",
        name: "supplerContact",
        type: "string",
      },
      {
        internalType: "string",
        name: "supplerEmail",
        type: "string",
      },
      {
        internalType: "string",
        name: "role",
        type: "string",
      },
      {
        internalType: "bool",
        name: "isSuppler",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "supplerAccts",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "supplerCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "transferRawToManufacture",
    outputs: [
      {
        internalType: "address",
        name: "manufactureAddress",
        type: "address",
      },
      {
        internalType: "address",
        name: "rawMaterialAddress",
        type: "address",
      },
      {
        internalType: "string",
        name: "rawMaterialId",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "transferRawToManufactureCount",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];
