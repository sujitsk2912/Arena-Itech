document.addEventListener("DOMContentLoaded", function () {
  const countryLabels = ["Italy", "France", "Spain", "USA", "Argentina"];
  const productionData = [55, 49, 44, 24, 15];
  const doughnutColors = [
    "#b91d47",
    "#00aba9",
    "#2b5797",
    "#e8c3b9",
    "#1e7145",
  ];

  new Chart("doughnut-chart", {
    type: "doughnut",
    data: {
      labels: countryLabels,
      datasets: [
        {
          data: productionData,
          backgroundColor: doughnutColors,
        },
      ],
    },
    options: {
      title: {
        display: true,
        text: "World Wide Wine Production 2018",
      },
    },
  });
});
