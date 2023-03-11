import React, { useState, useEffect } from "react";
import Web3 from "web3";
import { MdDone } from "react-icons/md";
import { RxCross2 } from "react-icons/rx";
import "./admin.css";

const web3 = new Web3(
  new Web3.providers.HttpProvider(
    "https://goerli.infura.io/v3/6e5b42ef506040dbad31e2b8de73e014"
  )
);
const data = [
  [1, "Aditya Waskar", "adityawaskar03@gmail.com", "Supplier", true],
  [2, "Tanmay Jha", "tanmayJha08@gmail.com", "manufautre", false],
];

function Admin_component() {
  const [account, setAccount] = useState(null);
  const [balance, setBalance] = useState(null);

  useEffect(() => {
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
  }, []);

  async function getBalance() {
    if (account != null) {
      const Balance = await web3.eth.getBalance(account);
      const ethBalance = web3.utils.fromWei(Balance, "ether");
      setBalance(ethBalance);
    }
    // return etherBalance;
  }
  getBalance();
  return (
    <section className="admin_container">
      <div className="row">
        <div className="sr"> Sr No.</div>
        <div className="name">Name</div>
        <div className="role">Role</div>
        <div className="verification">Verification</div>
      </div>
      {data.map((d) => (
        <div className="row" key={d[0]}>
          <div className="sr">{d[0]}</div>
          <div className="name_email">
            <span>{d[1]}</span>
            <span>-{d[2]}</span>
          </div>
          <div className="role">{d[3]}</div>
          <div className="verification">
            {/* {data[4] == null ? (
              <div>
                <MdDone className="btn rightMark" />
                <RxCross2 className="btn wrongMark" />
              </div>
            ) : data[4] == true ? (
              <div className="verificatoin_value">Verified</div>
            ) : (
              <div className="verificatoin_value">Not Verified</div>
            )} */}
            {d[4] == true ? (
              <div className="verification_value">
                <MdDone className="btn rightMark" size={15} />
              </div>
            ) : (
              <div className="verification_value">
                <RxCross2 className="btn wrongMark" size={15} />
              </div>
            )}
          </div>
        </div>
      ))}
    </section>
  );
}

export default Admin_component;
