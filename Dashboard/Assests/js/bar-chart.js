document.addEventListener("DOMContentLoaded", function () {
  new Chart(document.getElementById("bar-chart"), {
    type: "bar",
    data: {
      labels: [
        "Jan",
        "Fab",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: [
            "#3e95cd",
            "#8e5ea2",
            "#3cba9f",
            "#e8c3b9",
            "#c45850",
            "#3e95cd",
            "#8e5ea2",
            "#3cba9f",
            "#e8c3b9",
            "#c45850",
            "#e8c3b9",
            "#c45850",
          ],
          data: [24, 30, 28, 25, 45, 30, 50, 26, 25, 30, 39, 25],
        },
      ],
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: "Predicted world population (millions) in 2050",
      },
    },
  });
});
