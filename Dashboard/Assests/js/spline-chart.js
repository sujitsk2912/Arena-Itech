document.addEventListener("DOMContentLoaded", function () {
  const xValues = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];

  new Chart("spline-chart", {
    type: "line",
    data: {
      labels: xValues,
      datasets: [
        {
          data: [860, 1140, 1060, 1060, 1070, 1110, 1330, 2210, 7830, 2478],
          borderColor: "red",
          backgroundColor: "rgba(255, 0, 0, 0.2)",
          fill: true,
        },
        {
          data: [300, 700, 2000, 5000, 6000, 4000, 2000, 1000, 200, 100],
          borderColor: "blue",
          backgroundColor: "rgba(0, 0, 255, 0.2)",
          fill: true,
        },
      ],
    },
    options: {
      legend: { display: false },
    },
  });
});
