import React from "react";
import { useState, useEffect } from "react";
import MetamaskLogo from "./MetamaskLogo";
import "./login.css";
import toast, { Toaster } from "react-hot-toast";
import { useNavigate } from "react-router-dom";
import connectToInfura from "../connection";
import { SiBlockchaindotcom } from "react-icons/si";
// const contractAddress = process.env.REACT_APP_CONTRACT_ADDRESS;

const Login = () => {
  const [account, setAccount] = useState("");
  const [errMsg, setErrMsg] = useState(null);
  const [patientExist, setPatientExist] = useState(null);
  const [doctorExist, setDoctorExist] = useState(null);
  const [name, setName] = useState("");
  const [role, setRole] = useState("");
  const navigate = useNavigate();

  const [web3, setWeb3] = useState(null);

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
      toast.error("Install metamask extenstion");
    }
  }

  const login = () => {
    navigate("/admin");
  };

  useEffect(() => {
    const getWeb3 = async () => {
      const web3Instance = await connectToInfura();
      setWeb3(web3Instance);
    };
    getWeb3();
  }, []);

  return (
    <section className="mainPatientContainer">
      <Toaster position="bottom-center" toastOptions={{ duration: 4000 }} />
      <h1 className="projectTitle" data-aos="fade-down">
        <SiBlockchaindotcom />
        LUXURY GOODS SUPPLY CHAIN MANAGEMENT USING BLOCKCHAIN
      </h1>
      <div className="patientLoginContainer" data-aos="slide-left">
        <div className="patientLoginSubContainer" data-aos="fade">
          <div className="MetamaskLogoContainer">
            <MetamaskLogo />
            <div className="metamaskName">Metamask</div>
          </div>
          <button className="connectButton" onClick={() => connectWallet()}>
            Connect With Metamask
          </button>
          {account && account != "err" && account != "removeErr" ? (
            <div className="loingInfo" data-aos="slide-up">
              <div className="wallentInformation">
                <div className="row">
                  <span>Wallet ID :</span>
                  <span className="accountNo">{account}</span>
                </div>
              </div>
              <div className="loginBtn">
                <button onClick={login}>Login</button>
              </div>
            </div>
          ) : null}
        </div>
      </div>
    </section>
  );
};

export default Login;
