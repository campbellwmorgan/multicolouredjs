###
* MultiColoured.js
* Creates multi-coloured fonts
*
* github.com/campbellwmorgan/multicolouredjs
* @author Campbell Morgan 2014
* @licence Apache 2 - http://www.apache.org/licenses/LICENSE-2.0.html
###
( ($) ->
  $.fn.multiColour = (colours...)->
    defaults =
      # specify array of colours
      colours: ['red', 'yellow', 'blue', 'green']

    colours = defaults.colours unless colours.length

    return @each ->

      i = 0
      getNextColour = ->
        i = 0 if i >= colours.length
        i++
        colours[(i - 1)]

      # replaces each text
      # node with spans and specified colours
      filterItem = (item) ->
        # ignore if doesnt exist
        return unless item.length
        item.contents()
          .filter ->
            return filterItem $(@) unless @nodeType is 3
            # this is a text node
            replacement = ''
            for node, j in @
              letter = @textContent[j]
              colour = getNextColour()
              replacement+=
                "<span style=\"color:#{colour};\">#{letter}</span>"
            # replace
            $(@).replaceWith(replacement)


      $t = $(@)
      # filter node's immediate text items
      filterItem $t

)(jQuery)
