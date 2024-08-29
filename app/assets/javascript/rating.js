document.addEventListener('DOMContentLoaded', () => {
  // Function to update the progress chart
  function updateProgressChart(averageRating) {
    const progressChart = document.querySelector("#progressChart");

    if (progressChart) {
      // Initialize the chart options
      const chartOptions = {
        series: [averageRating * 20], // Convert rating to percentage (e.g., 4.5 becomes 90)
        chart: {
          height: 350,
          type: "radialBar",
          toolbar: { show: false },
        },
        colors: [window.theme.primary, window.theme.warning],
        plotOptions: {
          radialBar: {
            startAngle: -135,
            endAngle: 225,
            hollow: {
              margin: 0,
              size: "70%",
              background: window.theme.white,
              dropShadow: {
                enabled: true,
                top: 3,
                left: 0,
                blur: 4,
                opacity: 0.24,
              },
            },
            track: {
              background: window.theme.white,
              strokeWidth: "67%",
              margin: 0,
              dropShadow: {
                enabled: true,
                top: -3,
                left: 0,
                blur: 4,
                opacity: 0.35,
              },
            },
            dataLabels: {
              showOn: "always",
              name: { show: false },
              value: {
                formatter: function (value) {
                  return parseInt(value) + "%";
                },
                color: window.theme.dark,
                fontSize: "48px",
                fontWeight: "700",
                show: true,
              },
            },
          },
        },
        fill: {
          type: "gradient",
          gradient: {
            shade: "dark",
            type: "horizontal",
            shadeIntensity: 0.5,
            gradientToColors: [window.theme.warning],
            inverseColors: false,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 100],
          },
        },
        stroke: { lineCap: "round" },
      };

      // Destroy the existing chart if it exists
      if (progressChart.chart) {
        progressChart.chart.destroy();
      }

      // Render the new chart
      const chart = new ApexCharts(progressChart, chartOptions);
      chart.render();
      progressChart.chart = chart; // Store reference to the chart
    }
  }

  // Initialize the chart on page load with default rating of 100%
  const initialRating = parseFloat(document.querySelector("#progressChart").getAttribute("data-rating")) || 5;
  updateProgressChart(initialRating);

  // Add event listeners to rating stars
  document.querySelectorAll('.rating-star').forEach(star => {
    star.addEventListener('click', event => {
      event.preventDefault();

      // Get the rating value and shop ID
      const rating = star.getAttribute('data-rating');
      const shopId = star.getAttribute('data-shop-id');

      // Send the AJAX request
      fetch(`/shopkeeper_shops/${shopId}/rate`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: `rating=${rating}&shopkeeper_shop_id=${shopId}`
      })
      .then(response => {
        if (response.ok) {
          return response.json(); // Expecting JSON response with the new rating
        } else {
          throw new Error('Network response was not ok.');
        }
      })
      .then(data => {
        // Update the progress chart with new rating
        updateProgressChart(data.average_rating);
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });
});