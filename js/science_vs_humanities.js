google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Decade', 'Science', 'Humanities'],
          ['1850',  2691,      15],
          ['1860',  3030,      37],
          ['1870',  4872,      20],
          ['1880',  5406,      34],
          ['1890',  7365,      52],
          ['1900',  9014,      85],
          ['1910',  9910,      86],
          ['1920',  16845,     207],
          ['1930',  25363,     471],
          ['1940',  19819,     597],
          ['1950',  27030,     1124],
          ['1960',  26903,     1792],
          ['1970',  24203,     2586],
          ['1980',  28612,     2910],
          ['1990',  29183,     1973],
          ['2000',  44683,     1927]
        ]);

        var options = {
          title: 'Number of Science vs. Humanities articles in The New York Times',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div_science'));

        chart.draw(data, options);
      }