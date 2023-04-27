<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #container{
    width: 400px;
    height: 400px;
    border: 2px solid red ;
  }
</style>

<script>
  let chart05={
    init:function () {
      $('#get_btn').click(function (){
        let year=$('#sel1').val();
        chart05.getdata(year);
      });
    },
      getdata:function (year){
        $.ajax({
          url:'/chart05',
          data:{'year':year},
          success:function (result){
            chart05.display1(result);
            chart05.display2(result);
          }
        });
    },
      display1:function (result){
        // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
        Highcharts.chart('c1', {
          chart: {
            type: 'spline'
          },
          title: {
            text: 'Monthly Average Temperature'
          },
          xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            accessibility: {
              description: 'Months of the year'
            }
          },
          yAxis: {
            title: {
              text: 'Temperature'
            },
            labels: {
              formatter: function () {
                return this.value + '°';
              }
            }
          },
          tooltip: {
            crosshairs: true,
            shared: true
          },
          plotOptions: {
            spline: {
              marker: {
                radius: 4,
                lineColor: '#666666',
                lineWidth: 1
              }
            }
          },
          series: [{
            name: 'Tokyo',
            marker: {
              symbol: 'square'
            },
            data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
              y: 26.4,
              marker: {
                symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
              },
              accessibility: {
                description: 'Sunny symbol, this is the warmest point in the chart.'
              }
            }, 22.8, 17.5, 12.1, 7.6]
          }]
        });

      },
      display2:function (result){
        Highcharts.chart('c2', {
          chart: {
            type: 'column',
            options3d: {
              enabled: true,
              alpha: 10,
              beta: 25,
              depth: 70
            }
          },
          title: {
            text: 'External trade in goods by country, Norway 2021',
            align: 'left'
          },
          subtitle: {
            text: 'Source: ' +
                    '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                    'target="_blank">SSB</a>',
            align: 'left'
          },
          plotOptions: {
            column: {
              depth: 25
            }
          },
          xAxis: {
            categories: ['Belgium', 'China', 'Denmark', 'Fiji', 'Germany', 'Netherlands', 'Russia',
              'Sweden', 'Turkey', 'United States', 'Unspecified', 'Vietnam'],
            labels: {
              skew3d: true,
              style: {
                fontSize: '16px'
              }
            }
          },
          yAxis: {
            title: {
              text: 'NOK (million)',
              margin: 20
            }
          },
          tooltip: {
            valueSuffix: ' MNOK'
          },
          series: [{
            name: 'Total imports',
            data: [16076, 112688, 39452, 0, 94352,
              30495, 21813, 95908, 11596, 53771, null, 8270]
          }]
        });
    }
  };

  $(function(){
    chart05.init();

  })
</script>



<div class="col-sm-8 text-left">
  <div class="container" >
    <h3>chart05</h3>
    <div class="row">
    <div class="form-group col-sm-2" >
      <label for="sel1">Year:</label>
      <select class="form-control" id="sel1">
        <c:forEach begin="2010" end="2020" var="year">
          <option value="${year}">${year}</option>
        </c:forEach>
      </select>
      <button id="get_btn"> GET</button>

    </div>

    </div>
    <div class="row">
      <div id="c1" class="col-sm-4"> </div>
      <div id="c2" class="col-sm-4"> </div>
      <div id="c3" class="col-sm-4"> </div>
    </div>
  </div>
</div>