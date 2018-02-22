command: "sh ./scripts/getActiveApp.sh"

refreshFrequency: 1000

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./assets/colors.css">
    <link rel="stylesheet" type="text/css" href="./assets/fontawesome-all.min.css">
    <div class="activeApp"></div>
  """

style: """
  width: 100%
  position: absolute
  margin: 0 auto
  margin: 2px 0 0 14px
  text-align: left
  font: 13px "Nitti Grotesk Bold", sans-serif
  color: #fff
"""

update: (output, domEl) ->
  $(domEl).find('.activeApp').html(output);
