# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  clipboard = new Clipboard('.btn-clipboard')
  clipboard.on 'success', (e)->
    alert(I18n.t('events.clipboarded'))
    e.clearSelection()

  $('#event_link').click ->
    this.select()

  $.getJSON window.location.pathname+'.json', (data)->
    data_max = Math.max.apply(null, data.chart.data)
    max      = data_max + Math.pow(10, data_max.toString().length-1)
    ctx      = document.getElementById('myChart')
    new Chart ctx,
      type: 'bar'
      data:
        labels: data.chart.labels
        datasets: [
          label: '票數'
          data: data.chart.data
          backgroundColor: [
            '#EF5350'

            '#42A5F5'

            '#26C6DA'
            '#7E57C2'
            '#5C6BC0'
            '#AB47BC'
            '#26A69A'
            '#66BB6A'
            '#9CCC65'
            '#EC407A'
            '#D4E157'
            '#FFCA28'
            '#FFA726'
            '#FF7043'
            '#8D6E63'
            '#29B6F6'
            '#78909C'
          ]
          borderColor: [
            '#D32F2F'
            '#1976D2'
            '#0097A7'
            '#512DA8'
            '#303F9F'
            '#7B1FA2'
            '#00796B'
            '#388E3C'
            '#689F38'
            '#C2185B'
            '#AFB42B'
            '#FFA000'
            '#F57C00'
            '#E64A19'
            '#5D4037'
            '#0288D1'
            '#455A64'
          ]
          borderWidth: 1
        ]
      options: scales: yAxes: [ { ticks: beginAtZero: true, max: max, stepSize: 1} ]

# 'rgba(239, 83, 80, 0.7)'
# 'rgba(236, 64, 122, 0.7)'
# 'rgba(171, 71, 188, 0.7)'
# 'rgba(126, 87, 194, 0.7)'
# 'rgba(92, 107, 192, 0.7)'
# 'rgba(66, 165, 245, 0.7)'
# 'rgba(41, 182, 246, 0.7)'
# 'rgba(38, 198, 218, 0.7)'
# 'rgba(38, 166, 154, 0.7)'
# 'rgba(102, 187, 106, 0.7)'
# 'rgba(156, 204, 101, 0.7)'
# 'rgba(212, 225, 87, 0.7)'

# 'rgba(255, 202, 40, 0.7)'
# 'rgba(255, 167, 38, 0.7)'
# 'rgba(255, 112, 67, 0.7)'
# 'rgba(141, 110, 99, 0.7)'
# 'rgba(120, 144, 156, 0.7)'
