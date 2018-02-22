command: "echo $(/usr/local/bin/chunkc tiling::query -D $(/usr/local/bin/chunkc tiling::query -m id)) $(/usr/local/bin/chunkc tiling::query -d id)"

refreshFrequency: 1000

render: (output) ->
  arr = output.trim().split /\s+/
  spaces = arr[0...-1]
  current = arr[arr.length-1]
  """
    <div>
      <ul>
        #{
          (spaces.map ((n) ->
            """
            <li id="space-#{n}" class=#{if n == current then "active" else ""}>
              #{n}
            </li>
            """
          )).join ""
        }
      </ul>
    </div>
  """

style: """
  height: 16px
  bottom: 5px
  left: 14px;
  font: 12px "Nitti Grotesk", sans-serif
  line-height: 18px
  color: #fff
  font-weight: bold

  ul
    list-style: none
    margin: 0
    padding: 0

  li
    display: inline-block
    width: 32px
    text-align: center
    background: #ffffff66

  li.active
    color: #000
    background: #fff
"""

update: (output, domEl) ->
  arr = output.trim().split /\s+/
  current = "space-" + arr[arr.length-1]
  if ($(domEl).find('li.active').id isnt current)
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find('li#' + current).addClass('active')

  $('#desktop1').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 1'"
  $('#desktop2').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 2'"
  $('#desktop3').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 3'"
  $('#desktop4').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 4'"
  $('#desktop5').on "click", => @run "/opt/local/bin/qes -k 'cmd + alt - 5'"
