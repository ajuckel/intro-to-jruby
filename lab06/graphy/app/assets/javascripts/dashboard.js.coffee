$ = jQuery
dataUrlFor = (id) ->
  "../results/" + id
$ ->
  $("#weeks").tabs()

$ ->
  $("form.edit_user_action_item").each (index, form) ->
    $(form).bind "ajax:success", (event, data, status, xhr) ->
      userId = "1"
      $.ajax
        url: dataUrlFor(userId)
        method: "GET"
        dataType: "json"
        success: (series) ->
          data = []
          i = 0

          while i < series.length
            data.push
              label: series[i].metric
              data: series[i].ratings
            i++
          options =
            legend:
              show: true
              container: $("#user-plot-legend-" + userId)

            xaxis:
              min: 1
              max: 8

            yaxis:
              min: -3
              max: 3
              
          plot = $.plot($("#user-plot-" + userId), data, options)

$ ->
  $(".user-plot").each (index, div) ->
    userId = $(div).data("user")
    $.ajax
      url: dataUrlFor($(div).data("user"))
      method: "GET"
      dataType: "json"
      success: (series) ->
        data = []
        i = 0

        while i < series.length
          data.push
            label: series[i].metric
            data: series[i].ratings
          i++
        options =
          legend:
            show: true
            container: $("#user-plot-legend-" + userId)

          xaxis:
            min: 1
            max: 8

          yaxis:
            min: -3
            max: 3

        plot = $.plot($(div), data, options)
