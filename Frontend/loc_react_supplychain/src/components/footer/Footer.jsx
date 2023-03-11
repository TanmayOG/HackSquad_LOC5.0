import React from "react";
import { AiFillHeart } from "react-icons/ai";
import "./footer.css";

const Footer = () => {
  return (
    <footer>
      <div className="footer_content">
        <h3>LUXURY GOODS SUPPLY CHAIN MANAGEMENT USING BLOCKCHAIN</h3>
        <p>
          Blockchain can enhance the supply chain management of luxury goods by
          providing secure, transparent, and efficient tracking of products from
          production to delivery.
        </p>

        <div className="footer_bottom">
          <p>
            &copy; copyright &copy;2023 All rights reserved | Made by with{" "}
            <AiFillHeart /> by
            <span> #hacksquad</span>
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
