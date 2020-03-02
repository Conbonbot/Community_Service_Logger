{"filter":false,"title":"HourDistributionChart.js","tooltip":"/app/assets/javascripts/HourDistributionChart.js","undoManager":{"mark":56,"position":56,"stack":[[{"start":{"row":0,"column":0},"end":{"row":35,"column":0},"action":"insert","lines":["// Set new default font family and font color to mimic Bootstrap's default styling","Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,\"Segoe UI\",Roboto,\"Helvetica Neue\",Arial,sans-serif';","Chart.defaults.global.defaultFontColor = '#858796';","","// Pie Chart Example","var ctx = document.getElementById(\"myPieChart\");","var myPieChart = new Chart(ctx, {","  type: 'doughnut',","  data: {","    labels: [\"Direct\", \"Referral\", \"Social\"],","    datasets: [{","      data: [55, 30, 15],","      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],","      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],","      hoverBorderColor: \"rgba(234, 236, 244, 1)\",","    }],","  },","  options: {","    maintainAspectRatio: false,","    tooltips: {","      backgroundColor: \"rgb(255,255,255)\",","      bodyFontColor: \"#858796\",","      borderColor: '#dddfeb',","      borderWidth: 1,","      xPadding: 15,","      yPadding: 15,","      displayColors: false,","      caretPadding: 10,","    },","    legend: {","      display: false","    },","    cutoutPercentage: 80,","  },","});",""],"id":1}],[{"start":{"row":9,"column":19},"end":{"row":9,"column":20},"action":"remove","lines":["t"],"id":2},{"start":{"row":9,"column":18},"end":{"row":9,"column":19},"action":"remove","lines":["c"]},{"start":{"row":9,"column":17},"end":{"row":9,"column":18},"action":"remove","lines":["e"]},{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"remove","lines":["r"]},{"start":{"row":9,"column":15},"end":{"row":9,"column":16},"action":"remove","lines":["i"]},{"start":{"row":9,"column":14},"end":{"row":9,"column":15},"action":"remove","lines":["D"]}],[{"start":{"row":9,"column":14},"end":{"row":9,"column":15},"action":"insert","lines":["F"],"id":3},{"start":{"row":9,"column":15},"end":{"row":9,"column":16},"action":"insert","lines":["r"]},{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"insert","lines":["s"]}],[{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"remove","lines":["s"],"id":4}],[{"start":{"row":9,"column":16},"end":{"row":9,"column":17},"action":"insert","lines":["e"],"id":5},{"start":{"row":9,"column":17},"end":{"row":9,"column":18},"action":"insert","lines":["s"]},{"start":{"row":9,"column":18},"end":{"row":9,"column":19},"action":"insert","lines":["h"]},{"start":{"row":9,"column":19},"end":{"row":9,"column":20},"action":"insert","lines":["m"]},{"start":{"row":9,"column":20},"end":{"row":9,"column":21},"action":"insert","lines":["a"]},{"start":{"row":9,"column":21},"end":{"row":9,"column":22},"action":"insert","lines":["n"]}],[{"start":{"row":9,"column":21},"end":{"row":9,"column":22},"action":"remove","lines":["n"],"id":6},{"start":{"row":9,"column":20},"end":{"row":9,"column":21},"action":"remove","lines":["a"]}],[{"start":{"row":9,"column":20},"end":{"row":9,"column":21},"action":"insert","lines":["e"],"id":7},{"start":{"row":9,"column":21},"end":{"row":9,"column":22},"action":"insert","lines":["n"]}],[{"start":{"row":9,"column":33},"end":{"row":9,"column":34},"action":"remove","lines":["l"],"id":8},{"start":{"row":9,"column":32},"end":{"row":9,"column":33},"action":"remove","lines":["a"]},{"start":{"row":9,"column":31},"end":{"row":9,"column":32},"action":"remove","lines":["r"]},{"start":{"row":9,"column":30},"end":{"row":9,"column":31},"action":"remove","lines":["r"]},{"start":{"row":9,"column":29},"end":{"row":9,"column":30},"action":"remove","lines":["e"]},{"start":{"row":9,"column":28},"end":{"row":9,"column":29},"action":"remove","lines":["f"]},{"start":{"row":9,"column":27},"end":{"row":9,"column":28},"action":"remove","lines":["e"]},{"start":{"row":9,"column":26},"end":{"row":9,"column":27},"action":"remove","lines":["R"]}],[{"start":{"row":9,"column":26},"end":{"row":9,"column":27},"action":"insert","lines":["S"],"id":9},{"start":{"row":9,"column":27},"end":{"row":9,"column":28},"action":"insert","lines":["o"]},{"start":{"row":9,"column":28},"end":{"row":9,"column":29},"action":"insert","lines":["p"]},{"start":{"row":9,"column":29},"end":{"row":9,"column":30},"action":"insert","lines":["h"]}],[{"start":{"row":9,"column":26},"end":{"row":9,"column":30},"action":"remove","lines":["Soph"],"id":10},{"start":{"row":9,"column":26},"end":{"row":9,"column":36},"action":"insert","lines":["Sophomores"]}],[{"start":{"row":9,"column":45},"end":{"row":9,"column":46},"action":"remove","lines":["l"],"id":11},{"start":{"row":9,"column":44},"end":{"row":9,"column":45},"action":"remove","lines":["a"]},{"start":{"row":9,"column":43},"end":{"row":9,"column":44},"action":"remove","lines":["i"]},{"start":{"row":9,"column":42},"end":{"row":9,"column":43},"action":"remove","lines":["c"]},{"start":{"row":9,"column":41},"end":{"row":9,"column":42},"action":"remove","lines":["o"]},{"start":{"row":9,"column":40},"end":{"row":9,"column":41},"action":"remove","lines":["S"]}],[{"start":{"row":9,"column":40},"end":{"row":9,"column":41},"action":"insert","lines":["J"],"id":12},{"start":{"row":9,"column":41},"end":{"row":9,"column":42},"action":"insert","lines":["u"]},{"start":{"row":9,"column":42},"end":{"row":9,"column":43},"action":"insert","lines":["n"]},{"start":{"row":9,"column":43},"end":{"row":9,"column":44},"action":"insert","lines":["i"]},{"start":{"row":9,"column":44},"end":{"row":9,"column":45},"action":"insert","lines":["o"]},{"start":{"row":9,"column":45},"end":{"row":9,"column":46},"action":"insert","lines":["r"]},{"start":{"row":9,"column":46},"end":{"row":9,"column":47},"action":"insert","lines":["s"]}],[{"start":{"row":9,"column":48},"end":{"row":9,"column":49},"action":"insert","lines":[","],"id":13}],[{"start":{"row":9,"column":49},"end":{"row":9,"column":50},"action":"insert","lines":[" "],"id":14}],[{"start":{"row":9,"column":50},"end":{"row":9,"column":52},"action":"insert","lines":["\"\""],"id":15}],[{"start":{"row":9,"column":51},"end":{"row":9,"column":52},"action":"insert","lines":["S"],"id":16},{"start":{"row":9,"column":52},"end":{"row":9,"column":53},"action":"insert","lines":["e"]},{"start":{"row":9,"column":53},"end":{"row":9,"column":54},"action":"insert","lines":["n"]},{"start":{"row":9,"column":54},"end":{"row":9,"column":55},"action":"insert","lines":["i"]},{"start":{"row":9,"column":55},"end":{"row":9,"column":56},"action":"insert","lines":["o"]},{"start":{"row":9,"column":56},"end":{"row":9,"column":57},"action":"insert","lines":["r"]},{"start":{"row":9,"column":57},"end":{"row":9,"column":58},"action":"insert","lines":["s"]}],[{"start":{"row":11,"column":23},"end":{"row":11,"column":24},"action":"remove","lines":["]"],"id":17},{"start":{"row":11,"column":22},"end":{"row":11,"column":23},"action":"remove","lines":["5"]},{"start":{"row":11,"column":21},"end":{"row":11,"column":22},"action":"remove","lines":["1"]},{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"remove","lines":[" "]},{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"remove","lines":[","]},{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"remove","lines":["0"]},{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"remove","lines":["3"]},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"remove","lines":[" "]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":[","]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["5"]},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"remove","lines":["5"]},{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"remove","lines":["["]}],[{"start":{"row":17,"column":12},"end":{"row":17,"column":13},"action":"insert","lines":["t"],"id":18},{"start":{"row":17,"column":13},"end":{"row":17,"column":14},"action":"insert","lines":["h"]},{"start":{"row":17,"column":14},"end":{"row":17,"column":15},"action":"insert","lines":["a"]}],[{"start":{"row":17,"column":14},"end":{"row":17,"column":15},"action":"remove","lines":["a"],"id":19},{"start":{"row":17,"column":13},"end":{"row":17,"column":14},"action":"remove","lines":["h"]},{"start":{"row":17,"column":12},"end":{"row":17,"column":13},"action":"remove","lines":["t"]}],[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["t"],"id":20},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["h"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["a"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["t"]}],[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":["t"],"id":21},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["a"]}],[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["i"],"id":22},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["s"]}],[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":["s"],"id":23},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["i"]},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"remove","lines":["h"]},{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"remove","lines":["t"]}],[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["h"],"id":24},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["o"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["u"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["r"]},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["s"]}],[{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"remove","lines":["e"],"id":25},{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"remove","lines":["l"]},{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"remove","lines":["p"]},{"start":{"row":4,"column":16},"end":{"row":4,"column":17},"action":"remove","lines":["m"]},{"start":{"row":4,"column":15},"end":{"row":4,"column":16},"action":"remove","lines":["a"]},{"start":{"row":4,"column":14},"end":{"row":4,"column":15},"action":"remove","lines":["x"]},{"start":{"row":4,"column":13},"end":{"row":4,"column":14},"action":"remove","lines":["E"]},{"start":{"row":4,"column":12},"end":{"row":4,"column":13},"action":"remove","lines":[" "]},{"start":{"row":4,"column":11},"end":{"row":4,"column":12},"action":"remove","lines":["t"]},{"start":{"row":4,"column":10},"end":{"row":4,"column":11},"action":"remove","lines":["r"]},{"start":{"row":4,"column":9},"end":{"row":4,"column":10},"action":"remove","lines":["a"]},{"start":{"row":4,"column":8},"end":{"row":4,"column":9},"action":"remove","lines":["h"]},{"start":{"row":4,"column":7},"end":{"row":4,"column":8},"action":"remove","lines":["C"]},{"start":{"row":4,"column":6},"end":{"row":4,"column":7},"action":"remove","lines":[" "]},{"start":{"row":4,"column":5},"end":{"row":4,"column":6},"action":"remove","lines":["e"]},{"start":{"row":4,"column":4},"end":{"row":4,"column":5},"action":"remove","lines":["i"]},{"start":{"row":4,"column":3},"end":{"row":4,"column":4},"action":"remove","lines":["P"]},{"start":{"row":4,"column":2},"end":{"row":4,"column":3},"action":"remove","lines":[" "]},{"start":{"row":4,"column":1},"end":{"row":4,"column":2},"action":"remove","lines":["/"]},{"start":{"row":4,"column":0},"end":{"row":4,"column":1},"action":"remove","lines":["/"]}],[{"start":{"row":4,"column":0},"end":{"row":4,"column":1},"action":"insert","lines":["v"],"id":26},{"start":{"row":4,"column":1},"end":{"row":4,"column":2},"action":"insert","lines":["a"]},{"start":{"row":4,"column":2},"end":{"row":4,"column":3},"action":"insert","lines":["r"]}],[{"start":{"row":4,"column":3},"end":{"row":4,"column":4},"action":"insert","lines":[" "],"id":27},{"start":{"row":4,"column":4},"end":{"row":4,"column":5},"action":"insert","lines":["h"]},{"start":{"row":4,"column":5},"end":{"row":4,"column":6},"action":"insert","lines":["o"]},{"start":{"row":4,"column":6},"end":{"row":4,"column":7},"action":"insert","lines":["u"]},{"start":{"row":4,"column":7},"end":{"row":4,"column":8},"action":"insert","lines":["r"]}],[{"start":{"row":4,"column":8},"end":{"row":4,"column":9},"action":"insert","lines":["s"],"id":28}],[{"start":{"row":4,"column":9},"end":{"row":4,"column":10},"action":"insert","lines":[" "],"id":29},{"start":{"row":4,"column":10},"end":{"row":4,"column":11},"action":"insert","lines":["="]}],[{"start":{"row":4,"column":11},"end":{"row":4,"column":12},"action":"insert","lines":[" "],"id":30},{"start":{"row":4,"column":12},"end":{"row":4,"column":13},"action":"insert","lines":["g"]},{"start":{"row":4,"column":13},"end":{"row":4,"column":14},"action":"insert","lines":["o"]},{"start":{"row":4,"column":14},"end":{"row":4,"column":15},"action":"insert","lines":["n"]},{"start":{"row":4,"column":15},"end":{"row":4,"column":16},"action":"insert","lines":["."]}],[{"start":{"row":4,"column":16},"end":{"row":4,"column":17},"action":"insert","lines":["d"],"id":31},{"start":{"row":4,"column":17},"end":{"row":4,"column":18},"action":"insert","lines":["i"]},{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"insert","lines":["e"]},{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"insert","lines":["s"]}],[{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"remove","lines":["s"],"id":32},{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"remove","lines":["e"]}],[{"start":{"row":4,"column":18},"end":{"row":4,"column":19},"action":"insert","lines":["s"],"id":33},{"start":{"row":4,"column":19},"end":{"row":4,"column":20},"action":"insert","lines":["t"]},{"start":{"row":4,"column":20},"end":{"row":4,"column":21},"action":"insert","lines":["r"]},{"start":{"row":4,"column":21},"end":{"row":4,"column":22},"action":"insert","lines":["i"]},{"start":{"row":4,"column":22},"end":{"row":4,"column":23},"action":"insert","lines":["b"]},{"start":{"row":4,"column":23},"end":{"row":4,"column":24},"action":"insert","lines":["u"]},{"start":{"row":4,"column":24},"end":{"row":4,"column":25},"action":"insert","lines":["t"]}],[{"start":{"row":4,"column":25},"end":{"row":4,"column":26},"action":"insert","lines":["i"],"id":34},{"start":{"row":4,"column":26},"end":{"row":4,"column":27},"action":"insert","lines":["o"]},{"start":{"row":4,"column":27},"end":{"row":4,"column":28},"action":"insert","lines":["n"]},{"start":{"row":4,"column":28},"end":{"row":4,"column":29},"action":"insert","lines":[";"]}],[{"start":{"row":4,"column":29},"end":{"row":5,"column":0},"action":"insert","lines":["",""],"id":35},{"start":{"row":5,"column":0},"end":{"row":5,"column":1},"action":"insert","lines":["d"]},{"start":{"row":5,"column":1},"end":{"row":5,"column":2},"action":"insert","lines":["e"]},{"start":{"row":5,"column":2},"end":{"row":5,"column":3},"action":"insert","lines":["b"]},{"start":{"row":5,"column":3},"end":{"row":5,"column":4},"action":"insert","lines":["u"]},{"start":{"row":5,"column":4},"end":{"row":5,"column":5},"action":"insert","lines":["g"]},{"start":{"row":5,"column":5},"end":{"row":5,"column":6},"action":"insert","lines":["g"]},{"start":{"row":5,"column":6},"end":{"row":5,"column":7},"action":"insert","lines":["e"]},{"start":{"row":5,"column":7},"end":{"row":5,"column":8},"action":"insert","lines":["r"]}],[{"start":{"row":5,"column":7},"end":{"row":5,"column":8},"action":"remove","lines":["r"],"id":36},{"start":{"row":5,"column":6},"end":{"row":5,"column":7},"action":"remove","lines":["e"]},{"start":{"row":5,"column":5},"end":{"row":5,"column":6},"action":"remove","lines":["g"]},{"start":{"row":5,"column":4},"end":{"row":5,"column":5},"action":"remove","lines":["g"]},{"start":{"row":5,"column":3},"end":{"row":5,"column":4},"action":"remove","lines":["u"]},{"start":{"row":5,"column":2},"end":{"row":5,"column":3},"action":"remove","lines":["b"]},{"start":{"row":5,"column":1},"end":{"row":5,"column":2},"action":"remove","lines":["e"]},{"start":{"row":5,"column":0},"end":{"row":5,"column":1},"action":"remove","lines":["d"]},{"start":{"row":4,"column":29},"end":{"row":5,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":12,"column":55},"end":{"row":12,"column":56},"action":"insert","lines":["."],"id":37}],[{"start":{"row":12,"column":55},"end":{"row":12,"column":56},"action":"remove","lines":["."],"id":38}],[{"start":{"row":12,"column":55},"end":{"row":12,"column":56},"action":"insert","lines":[","],"id":39}],[{"start":{"row":12,"column":56},"end":{"row":12,"column":57},"action":"insert","lines":[" "],"id":40}],[{"start":{"row":12,"column":57},"end":{"row":12,"column":59},"action":"insert","lines":["''"],"id":41}],[{"start":{"row":12,"column":58},"end":{"row":12,"column":59},"action":"insert","lines":["@"],"id":42},{"start":{"row":12,"column":59},"end":{"row":12,"column":60},"action":"insert","lines":["#"]}],[{"start":{"row":12,"column":59},"end":{"row":12,"column":60},"action":"remove","lines":["#"],"id":43},{"start":{"row":12,"column":58},"end":{"row":12,"column":59},"action":"remove","lines":["@"]}],[{"start":{"row":12,"column":58},"end":{"row":12,"column":59},"action":"insert","lines":["#"],"id":44},{"start":{"row":12,"column":59},"end":{"row":12,"column":60},"action":"insert","lines":["5"]}],[{"start":{"row":12,"column":60},"end":{"row":12,"column":61},"action":"insert","lines":["d"],"id":45},{"start":{"row":12,"column":61},"end":{"row":12,"column":62},"action":"insert","lines":["9"]},{"start":{"row":12,"column":62},"end":{"row":12,"column":63},"action":"insert","lines":["8"]},{"start":{"row":12,"column":63},"end":{"row":12,"column":64},"action":"insert","lines":["2"]}],[{"start":{"row":12,"column":63},"end":{"row":12,"column":64},"action":"remove","lines":["2"],"id":46}],[{"start":{"row":12,"column":63},"end":{"row":12,"column":64},"action":"insert","lines":["f"],"id":47},{"start":{"row":12,"column":64},"end":{"row":12,"column":65},"action":"insert","lines":["2"]}],[{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"remove","lines":["s"],"id":48},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":["r"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["u"]},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"remove","lines":["o"]},{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"remove","lines":["h"]}],[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["g"],"id":49},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["o"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["n"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["."]}],[{"start":{"row":11,"column":16},"end":{"row":11,"column":28},"action":"insert","lines":["distribution"],"id":50}],[{"start":{"row":11,"column":27},"end":{"row":11,"column":28},"action":"remove","lines":["n"],"id":51},{"start":{"row":11,"column":26},"end":{"row":11,"column":27},"action":"remove","lines":["o"]},{"start":{"row":11,"column":25},"end":{"row":11,"column":26},"action":"remove","lines":["i"]},{"start":{"row":11,"column":24},"end":{"row":11,"column":25},"action":"remove","lines":["t"]},{"start":{"row":11,"column":23},"end":{"row":11,"column":24},"action":"remove","lines":["u"]},{"start":{"row":11,"column":22},"end":{"row":11,"column":23},"action":"remove","lines":["b"]},{"start":{"row":11,"column":21},"end":{"row":11,"column":22},"action":"remove","lines":["i"]},{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"remove","lines":["r"]},{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"remove","lines":["t"]},{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"remove","lines":["s"]},{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"remove","lines":["i"]},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"remove","lines":["d"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"remove","lines":["."]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["n"]},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"remove","lines":["o"]},{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"remove","lines":["g"]}],[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":["h"],"id":52},{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["o"]},{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["u"]},{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["r"]},{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["s"]}],[{"start":{"row":5,"column":44},"end":{"row":5,"column":45},"action":"remove","lines":["t"],"id":57},{"start":{"row":5,"column":43},"end":{"row":5,"column":44},"action":"remove","lines":["r"]},{"start":{"row":5,"column":42},"end":{"row":5,"column":43},"action":"remove","lines":["a"]},{"start":{"row":5,"column":41},"end":{"row":5,"column":42},"action":"remove","lines":["h"]},{"start":{"row":5,"column":40},"end":{"row":5,"column":41},"action":"remove","lines":["C"]},{"start":{"row":5,"column":39},"end":{"row":5,"column":40},"action":"remove","lines":["e"]},{"start":{"row":5,"column":38},"end":{"row":5,"column":39},"action":"remove","lines":["i"]},{"start":{"row":5,"column":37},"end":{"row":5,"column":38},"action":"remove","lines":["P"]},{"start":{"row":5,"column":36},"end":{"row":5,"column":37},"action":"remove","lines":["y"]},{"start":{"row":5,"column":35},"end":{"row":5,"column":36},"action":"remove","lines":["m"]}],[{"start":{"row":5,"column":35},"end":{"row":5,"column":36},"action":"insert","lines":["H"],"id":58},{"start":{"row":5,"column":36},"end":{"row":5,"column":37},"action":"insert","lines":["o"]},{"start":{"row":5,"column":37},"end":{"row":5,"column":38},"action":"insert","lines":["u"]},{"start":{"row":5,"column":38},"end":{"row":5,"column":39},"action":"insert","lines":["r"]},{"start":{"row":5,"column":39},"end":{"row":5,"column":40},"action":"insert","lines":["D"]}],[{"start":{"row":5,"column":35},"end":{"row":5,"column":40},"action":"remove","lines":["HourD"],"id":59},{"start":{"row":5,"column":35},"end":{"row":5,"column":56},"action":"insert","lines":["HourDistributionChart"]}],[{"start":{"row":2,"column":51},"end":{"row":3,"column":0},"action":"insert","lines":["",""],"id":60}],[{"start":{"row":3,"column":0},"end":{"row":26,"column":1},"action":"insert","lines":["function number_format(number, decimals, dec_point, thousands_sep) {","  // *     example: number_format(1234.56, 2, ',', ' ');","  // *     return: '1 234,56'","  number = (number + '').replace(',', '').replace(' ', '');","  var n = !isFinite(+number) ? 0 : +number,","    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),","    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,","    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,","    s = '',","    toFixedFix = function(n, prec) {","      var k = Math.pow(10, prec);","      return '' + Math.round(n * k) / k;","    };","  // Fix for IE parseFloat(0.55).toFixed(0) = 0;","  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');","  if (s[0].length > 3) {","    s[0] = s[0].replace(/\\B(?=(?:\\d{3})+(?!\\d))/g, sep);","  }","  if ((s[1] || '').length < prec) {","    s[1] = s[1] || '';","    s[1] += new Array(prec - s[1].length + 1).join('0');","  }","  return s.join(dec);","}"],"id":61}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":19,"column":56},"end":{"row":19,"column":56},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1582835599256,"hash":"a677fbc8b44deaabc7adb467a3c128acb14fbd9b"}