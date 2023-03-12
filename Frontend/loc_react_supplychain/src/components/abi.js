export const ABI = [
  {
    inputs: [
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_consumerUrl",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "addConsumer",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_productUrl",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "addProduct",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_materialUrl",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "addRawMaterial",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_retailerUrl",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "addRetailer",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "_docId",
        type: "string",
      },
      {
        internalType: "string",
        name: "_transportUrl",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "addTransport",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [],
    name: "consumerCount",
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
    name: "consumers",
    outputs: [
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "string",
        name: "consumerUrl",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "getConsumerByOwner",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "consumerUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Consumer[]",
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
        name: "owner",
        type: "address",
      },
    ],
    name: "getProductByOwner",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "productUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Product[]",
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
        name: "owner",
        type: "address",
      },
    ],
    name: "getRawMaterialByOwner",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "materialUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.RawMaterial[]",
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
        name: "owner",
        type: "address",
      },
    ],
    name: "getRetailerByOwner",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "retailerUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Retailer[]",
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
        name: "owner",
        type: "address",
      },
    ],
    name: "getTransportByOwner",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "transportUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Transport[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "productCount",
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
    name: "products",
    outputs: [
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "string",
        name: "productUrl",
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
    name: "rawMaterials",
    outputs: [
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "string",
        name: "materialUrl",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "retailerCount",
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
        name: "docId",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "string",
        name: "retailerUrl",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
    ],
    name: "traceByDocId",
    outputs: [
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "materialUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.RawMaterial[]",
        name: "",
        type: "tuple[]",
      },
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "productUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Product[]",
        name: "",
        type: "tuple[]",
      },
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "transportUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Transport[]",
        name: "",
        type: "tuple[]",
      },
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "retailerUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Retailer[]",
        name: "",
        type: "tuple[]",
      },
      {
        components: [
          {
            internalType: "string",
            name: "docId",
            type: "string",
          },
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "string",
            name: "consumerUrl",
            type: "string",
          },
        ],
        internalType: "struct ChainManagement.Consumer[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "transportCount",
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
    name: "transports",
    outputs: [
      {
        internalType: "string",
        name: "docId",
        type: "string",
      },
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "string",
        name: "transportUrl",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];
