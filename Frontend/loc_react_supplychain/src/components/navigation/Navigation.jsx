import React, { useState } from "react";
import "./nav.css";
import { CgProfile } from "react-icons/cg";
import { VscSignOut } from "react-icons/vsc";
import { SiBlockchaindotcom } from "react-icons/si";

const Navigation = () => {
  const [profileActive, setProfileActive] = useState(false);
  return (
    <nav>
      <span className="title">
        <SiBlockchaindotcom size={40} className="logo" />
        Luxury goods Supply Chain Management using Blockchain
      </span>
      {/* <div className="menu">
        <div
          className="userInfo"
          onClick={() => setProfileActive(!profileActive)}
        >
          <div className="userPhoto">
            <img src={"/img/user.svg"} alt="user" />
          </div>
          <span className="user_email">abc@gmail.com</span>
          <ul className="active">
            <li>
              <CgProfile className="profileLogo" />
              <a href="#">MY PROFILE </a>
            </li>
            <li>
              <VscSignOut className="profileLogo" />
              <a href="#">LOG OUT</a>
            </li>
          </ul>
        </div>
      </div> */}
      <hr />
    </nav>
  );
};

export default Navigation;
