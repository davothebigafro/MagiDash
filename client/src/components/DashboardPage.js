import React, { useEffect, useState } from "react";
import Axios from "axios";

function DashboardPage() {
  const [dashboardList, setDashboardList] = useState([]);

  useEffect(() => {
    Axios.get("http://localhost:3001/dashboards/")
      .catch((error) => {
        // https://axios-http.com/docs/handling_errors
        if (error.response) {
          // The request was made and the server responded with a status code
          // that falls out of the range of 2xx
          console.log(error.response.data);
          console.log(error.response.status);
          console.log(error.response.headers);
        } else if (error.request) {
          // The request was made but no response was received
          console.log(error.request);
        } else {
          // Something happened in setting up the request that triggered an Error
          console.log("Error", error.message);
        }
        console.log(error.config);
      })
      .then((response) => {
        setDashboardList(response.data);
      });
  });

  return (
    <div className="dashboard_page">
      <h1>Dashboards</h1>
      {dashboardList.map((dashboard) => {
        return (
          <div className="dashboard">
            <h1>{dashboard.title}</h1>
            <p>Created at: {dashboard.createdAt}</p>
          </div>
        );
      })}
    </div>
  );
}

export default DashboardPage;
