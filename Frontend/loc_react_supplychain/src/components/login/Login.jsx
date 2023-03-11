import React from "react";
import { useState, useEffect } from "react";
import MetamaskLogo from "./MetamaskLogo";
import "./login.css";
import toast, { Toaster } from "react-hot-toast";
// import { hospitalABI } from "../../abi";
// import { ethers } from "ethers";
import { Routes, Route, useNavigate } from "react-router-dom";
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

  // Sets up a new Ethereum provider and returns an interface for interacting with the smart contract
  // async function initializeProvider() {
  //   const provider = new ethers.providers.Web3Provider(window.ethereum);
  //   const signer = provider.getSigner();
  //   return new ethers.Contract(contractAddress, hospitalABI, signer);
  // }

  // Displays a prompt for the user to select which accounts to connect
  // async function requestAccount() {
  //   if (window.ethereum) {
  //     const account = await window.ethereum.request({
  //       method: "eth_requestAccounts",
  //     });
  //     setAccount(account[0]);

  //     let contract = await initializeProvider();
  //     console.log(account[0]);

  //     //check patient exists or not.
  //     let patient = await contract.PatientExists(account[0]);
  //     //check doctor exists or not.
  //     let doctor = await contract.DoctorExists(account[0]);

  //     // if patient exists than set role = patient and name = patient_name
  //     if (patient == true) {
  //       setPatientExist(true);
  //       let patientInformation = await contract.GetPatient(account[0]);
  //       setName(patientInformation[2]);
  //       console.log(patientInformation[2]);
  //       setRole("Patient");
  //     }
  //     // if doctor exists than set role = doctor and name = doctor_name
  //     else if (doctor == true) {
  //       setDoctorExist(true);
  //       let doctorInformation = await contract.GetDoctor(account[0]);
  //       console.log(doctorInformation);
  //       setName(doctorInformation[5].split(",")[0]);
  //       console.log(doctorInformation[2]);
  //       setRole("Doctor");
  //     }
  //     // if both patient and doctor not exists than set err message ID not register...
  //     else {
  //       setErrMsg("ID not register. Kindly contact to the admin.");
  //       if (doctor == false) {
  //         setDoctorExist(false);

  //         // After 3s err message gets disappear
  //         setTimeout(() => {
  //           setDoctorExist(null);
  //           setName("");
  //           setRole("");
  //         }, 3000);
  //       }
  //       if (patient == false) {
  //         setPatientExist(false);
  //         // After 3s err message gets disappear
  //         setTimeout(() => {
  //           setPatientExist(null);
  //           setName("");
  //           setRole("");
  //         }, 3000);
  //       }
  //     }
  //   }
  //   // if metamask not installed than set err msg
  //   else {
  //     setAccount("err");
  //     setErrMsg("Please install Metamask Extenstion!");
  //     setTimeout(() => {
  //       console.log("hei");
  //       setAccount("removeErr");
  //     }, 2000);
  //   }
  // }
  // // }

  // const patientLogin = async () => {
  //   if (patientExist == false || doctorExist == false) {
  //     setErrMsg("ID not register. Kindly contact to the admin.");
  //     if (patientExist == false) {
  //       setPatientExist(false);
  //       setTimeout(() => {
  //         setPatientExist(null);
  //         setName("");
  //         setRole("");
  //       }, 2000);
  //     } else if (doctorExist == false) {
  //       setDoctorExist(false);
  //       setTimeout(() => {
  //         setDoctorExist(null);
  //         setName("");
  //         setRole("");
  //       }, 2000);
  //     }
  //   } else {
  //     if (role == "Patient") {
  //       navigate("/patient_page/true");
  //     } else if (role == "Doctor") {
  //       navigate("/doctor_page");
  //     }
  //   }
  // };

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
                {name != "" ? (
                  <div className="row">
                    <span>Name :</span>
                    <span>{name}</span>
                  </div>
                ) : null}
                {role != "" ? (
                  <div className="row">
                    <span>Role :</span>
                    <span>{role}</span>
                  </div>
                ) : null}
              </div>
              <div className="loginBtn">
                <button onClick={login}>Login</button>
              </div>
            </div>
          ) : null}
        </div>
      </div>
      {account == "err" || patientExist == false ? (
        <div data-aos="slide-up" className="metamaskErrMsg">
          {errMsg}
        </div>
      ) : null}
    </section>
  );
};

export default Login;
