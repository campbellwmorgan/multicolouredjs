
/*
* MultiColoured.js
* Creates multi-coloured fonts
*
* github.com/campbellwmorgan/multicolouredjs
* @author Campbell Morgan 2014
* @licence Apache 2 - http://www.apache.org/licenses/LICENSE-2.0.html
 */

(function() {
  var __slice = [].slice;

  (function($) {
    return $.fn.multiColour = function() {
      var colours, defaults;
      colours = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      defaults = {
        colours: ['red', 'yellow', 'blue', 'green']
      };
      if (!colours.length) {
        colours = defaults.colours;
      }
      return this.each(function() {
        var $t, filterItem, getNextColour, i;
        i = 0;
        getNextColour = function() {
          if (i >= colours.length) {
            i = 0;
          }
          i++;
          return colours[i - 1];
        };
        filterItem = function(item) {
          if (!item.length) {
            return;
          }
          return item.contents().filter(function() {
            var colour, j, letter, node, replacement, _i, _len;
            if (this.nodeType !== 3) {
              return filterItem($(this));
            }
            replacement = '';
            for (j = _i = 0, _len = this.length; _i < _len; j = ++_i) {
              node = this[j];
              letter = this.textContent[j];
              colour = getNextColour();
              replacement += "<span style=\"color:" + colour + ";\">" + letter + "</span>";
            }
            return $(this).replaceWith(replacement);
          });
        };
        $t = $(this);
        return filterItem($t);
      });
    };
  })(jQuery);

}).call(this);
