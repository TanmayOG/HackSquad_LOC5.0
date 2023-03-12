import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Login from "./components/login/Login";
import FetchInfo from "./components/fetchInformation/FetchInfo";

const root = ReactDOM.createRoot(document.getElementById("root"));
const createRoute = createBrowserRouter([
  {
    path: "/",
    element: <Login />,
  },
  {
    path: "/admin",
    element: <App />,
  },
  {
    path: "/:role/:value",
    element: <FetchInfo />,
  },
]);
root.render(
  <React.StrictMode>
    {/* <App /> */}
    <RouterProvider router={createRoute} />
  </React.StrictMode>
);
