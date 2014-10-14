google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Decade', 'Science', 'Humanities'],
          ['1850',  516/2691*100,      3/15*100],
          ['1860',  381/3030*100,      2/37*100],
          ['1870',  401/4872*100,      6/20*100],
          ['1880',  341/5406*100,      1/34*100],
          ['1890',  426/7365*100,      3/52*100],
          ['1900',  588/9014*100,      3/85*100],
          ['1910',  493/9910*100,      5/86*100],
          ['1920',  772/16845*100,      6/207*100],
          ['1930',  772/25363*100,      14/471*100],
          ['1940',  484/19819*100,      17/597*100],
          ['1950',  1114/27031*100,      49/1124*100],
          ['1960',  1473/26901*100,      80/1792*100],
          ['1970',  980/24203*100,      88/2586*100],
          ['1990',  0/28935*100,      0/1965*100],
          ['2000',  0/28935*100,      0/1965*100]
        ]);

        var options = {
          title: 'Percentage of Science vs. Humanities articles on the front page of The New York Times',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_percentage_div'));

        chart.draw(data, options);
      }
