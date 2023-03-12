import React, { useState, useEffect } from "react";
import Web3 from "web3";
import { MdDone } from "react-icons/md";
import { RxCross2 } from "react-icons/rx";
import { ABI } from "../abi";
import toast, { Toaster } from "react-hot-toast";
import { useParams } from "react-router-dom";
let i;

console.log();
const web3 = new Web3(
  new Web3.providers.HttpProvider(process.env.REACT_APP_INFURA_HTTPURL)
);
const private_key = process.env.REACT_APP_WALLET_PRIVATE_ADDRESS;
const contarct_address = process.env.REACT_APP_CONTRACT_ADDRESS;

const account1 = web3.eth.accounts.privateKeyToAccount("0x" + private_key);
web3.eth.accounts.wallet.add(account1);

function FetchInfo() {
  let { role, value } = useParams();
  const [account, setAccount] = useState(null);
  const [balance, setBalance] = useState(null);
  const [allUser, setAllUser] = useState([]);
  const [load, setLoad] = useState(false);
  const [consumer, setConsumer] = useState([]);
  const [retailer, setRetailer] = useState([]);
  const [distributer, setdistributer] = useState([]);
  const [manufacturer, setManufacturer] = useState([]);
  const [supplier, setSupplier] = useState([]);

  const getInfo = async () => {
    const contract = new web3.eth.Contract(ABI, contarct_address);
    if (role.toLowerCase() == "consumer") {
      const _consumer = await contract.methods.getConsumer(value).call();
      setConsumer(_consumer);
      console.log(_consumer);
      const _retailer = await contract.methods
        .getRetailerByOwner(_consumer[0])
        .call();
      setRetailer(_retailer);
      console.log();
      const _distributer = await contract.methods
        .getTransportByOwner(_retailer[0])
        .call();
      setdistributer(_distributer);
      console.log();
      const _manu = await contract.methods
        .getProductByOwner("0x1C1362A46a50Ba121f47e205e774ABDeC90C540f")
        .call();
      setdistributer(_manu);
      console.log(_manu);
      const _supplier = await contract.methods
        .getRetailerByOwner("0x1C1362A46a50Ba121f47e205e774ABDeC90C540f")
        .call();
      setdistributer(_supplier);
      console.log(_supplier);
    }
    if (role.toLowerCase() == "reatailer") {
      const _retailer = await contract.methods.getRetailerByOwner(value).call();
      setRetailer(_retailer);
      console.log();
      const _distributer = await contract.methods
        .getTransportByOwner(_retailer[0])
        .call();
      setdistributer(_distributer);
      console.log();
      const _manu = await contract.methods
        .getProductByOwner(_distributer[0])
        .call();
      setdistributer(_manu);
      console.log(_manu);
      const _supplier = await contract.methods.getRetailerByOwner(_manu).call();
      setdistributer(_supplier);
      console.log(_supplier);
    }
    if (role.toLowerCase() == "distributer") {
      const _distributer = await contract.methods
        .getTransportByOwner(value)
        .call();
      setdistributer(_distributer);
      console.log();
      const _manu = await contract.methods
        .getProductByOwner(_distributer[0])
        .call();
      setdistributer(_manu);
      console.log(_manu);
      const _supplier = await contract.methods
        .getRetailerByOwner(_manu[0])
        .call();
      setdistributer(_supplier);
      console.log(_supplier);
    }
    if (role.toLowerCase() == "manufactere") {
      const _manu = await contract.methods.getProductByOwner(value).call();
      setdistributer(_manu);
      console.log(_manu);
      const _supplier = await contract.methods
        .getRetailerByOwner("0x1C1362A46a50Ba121f47e205e774ABDeC90C540f")
        .call();
      setdistributer(_supplier);
      console.log(_supplier);
    }
    if (role.toLowerCase() == "supplier") {
      const _supplier = await contract.methods.getRetailerByOwner(value).call();
      setdistributer(_supplier);
      console.log(_supplier);
    }
  };

  useEffect(() => {
    i = 0;
    async function connectWallet() {
      if (window.ethereum) {
        try {
          const accounts = await window.ethereum.enable();
          // Do something with the selected account
          setAccount(accounts[0]);
        } catch (error) {
          console.error(error);
        }
      } else {
        console.error("No ethereum provider found");
      }
    }
    connectWallet();
    getInfo();
  }, []);

  const verifyUser = async (address) => {
    setLoad(true);
    const contract = new web3.eth.Contract(ABI, contarct_address, {
      gas: 230000,
    });
    const toastId = toast.loading("Loading...");
    contract.methods
      .VerifySuppler(address)
      .send({ from: account })
      .on("confirmation", async (conformatinNo, receipt) => {
        console.log(receipt);
        getAllUsers();
        toast.dismiss(toastId);
        setLoad(false);
      });
  };

  const getAllUsers = async () => {
    const contract = new web3.eth.Contract(ABI, contarct_address);

    const users = await contract.methods.GetAllSuppler().call();
    setAllUser(users);
  };
  return (
    <section className="fetch_informatin_container" data-aos="zoom-in">
      <div>{supplier}</div>
      <div>{manufacturer}</div>
      <div>{distributer}</div>
      <div>{retailer}</div>
      <div>{consumer}</div>
    </section>
  );
}

export default FetchInfo;
