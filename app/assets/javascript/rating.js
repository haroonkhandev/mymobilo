document.addEventListener('DOMContentLoaded', () => {
  function updateProgressChart(averageRating) {
    const progressChart = document.querySelector("#progressChart");

    if (progressChart) {
      const chartOptions = {
        series: [averageRating * 20],
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

      if (progressChart.chart) {
        progressChart.chart.destroy();
      }

      const chart = new ApexCharts(progressChart, chartOptions);
      chart.render();
      progressChart.chart = chart;
    }
  }

  function updateStars(userRating) {
    document.querySelectorAll('.rating-star i').forEach(starIcon => {
      const starRating = parseInt(starIcon.parentElement.getAttribute('data-rating'), 10);
      if (starRating <= userRating) {
        starIcon.classList.add('text-warning');
        starIcon.classList.remove('text-muted');
      } else {
        starIcon.classList.add('text-muted');
        starIcon.classList.remove('text-warning');
      }
    });
  }

  function updateAverageRating(averageRating) {
    const averageRatingElement = document.getElementById('averageRating');
    if (averageRatingElement) {
      averageRatingElement.textContent = `Average Rating: ${averageRating} / 5`;
    }
  }

  const progressChart = document.querySelector("#progressChart");
  if (progressChart) {
    const initialRating = parseFloat(progressChart.getAttribute("data-rating")) || 0;
    updateProgressChart(initialRating);
    updateStars(initialRating);
  }

  document.querySelectorAll('.rating-star').forEach(star => {
    star.addEventListener('click', event => {
      event.preventDefault();

      const rating = star.getAttribute('data-rating');
      const shopId = star.getAttribute('data-shop-id');

      fetch(`/shopkeeper_shops/${shopId}/rate`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: `rating=${rating}&shopkeeper_shop_id=${shopId}`
      })
      .then(response => response.json())
      .then(data => {
        if (data.average_rating !== undefined) {
          updateProgressChart(data.average_rating);
          updateStars(data.rating);
          updateAverageRating(data.average_rating);
        } else {
          console.error('Error: ', data.error);
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });
});