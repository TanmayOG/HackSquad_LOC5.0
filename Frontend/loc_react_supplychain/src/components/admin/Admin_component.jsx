import React, { useState, useEffect } from "react";
import Web3 from "web3";
import { MdDone } from "react-icons/md";
import { RxCross2 } from "react-icons/rx";
import "./admin.css";
import { ABI } from "../abi";
import toast, { Toaster } from "react-hot-toast";
let i;

console.log();
const web3 = new Web3(
  new Web3.providers.HttpProvider(process.env.REACT_APP_INFURA_HTTPURL)
);
const private_key = process.env.REACT_APP_WALLET_PRIVATE_ADDRESS;
const contarct_address = process.env.REACT_APP_CONTRACT_ADDRESS;

const account1 = web3.eth.accounts.privateKeyToAccount("0x" + private_key);
web3.eth.accounts.wallet.add(account1);

function Admin_component() {
  const [account, setAccount] = useState(null);
  const [balance, setBalance] = useState(null);
  const [allUser, setAllUser] = useState([]);
  const [load, setLoad] = useState(false);

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
    getAllUsers();
  }, []);

  async function getBalance() {
    if (account != null) {
      const Balance = await web3.eth.getBalance(account);
      const ethBalance = web3.utils.fromWei(Balance, "ether");
      setBalance(ethBalance);
    }
  }

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
  let data = [
    [0, "Tanmay Jha", "", "", "abc@gmail.com", "Retailer", true],
    [
      1,
      "Aditya Waskar",
      "",
      "",
      "abc2@gmail.com",
      "Mnufacturer",
      false,
    ],
    [3, "Himanshu Upadhyay", "", "", "abc3@gmail.com", "Retailer", false],
  ];
  const getAllUsers = async () => {
    const contract = new web3.eth.Contract(ABI, contarct_address);

    const users = await contract.methods.GetAllSuppler().call();
    setAllUser(users);
  };
  return (
    <section className="admin_container" data-aos="zoom-in">
      <div
        className="glass"
        style={load ? { zIndex: "999999" } : { zIndex: "-1" }}
      ></div>
      <Toaster position="bottom-center" />
      <b>
        <div className="row">
          <div className="sr"> Sr No.</div>
          <div className="name">Name</div>
          <div className="role">Role</div>
          <div className="verification">Verification</div>
        </div>
      </b>
      <div style={{ display: "none" }}>{(i = 1)}</div>
      {data.map((d) => (
        <div className="row row_values" key={d[0]}>
          <div className="sr">{i++}</div>
          <div className="name_email">
            <span>{d[1]}</span>
            <span>-{d[4]}</span>
          </div>
          <div className="role">{d[5]}</div>
          <div className="verification">
            {d[6] == true ? (
              <div
                className="verification_value"
                onClick={() => verifyUser(d[0])}
              >
                <MdDone className="btn rightMark" size={25} />
              </div>
            ) : (
              <div
                className="verification_value"
                onClick={() => verifyUser(d[0])}
              >
                <RxCross2 className="btn wrongMark" size={25} />
              </div>
            )}
          </div>
        </div>
      ))}
    </section>
  );
}

export default Admin_component;
