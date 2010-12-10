/**
 * Litebox Plugin
 *
 * @version 0.2 (07/12/2009)
 * @requires jQuery v1.3.2+
 * @author Alex Weber <alexweber.com.br>
 * @copyright Copyright (c) 2009, Alex Weber
 * @license http://www.opensource.org/licenses/bsd-license.php
 *
 * Distributed under the terms of the new BSD License
 */

/**
 * Straightforward and totally simple lightbox implementation
 *
 * @example $("#myelement").litebox('litebox');
 * @desc When the element with id="myelement" is clicked, a litebox opens, populated with the content in element #litebox
 *
 * @example $("#myelement").litebox({
 *		target : 'mytarget'
 *		close: 'closeButton',
 *		overlayShowSpeed: 100,
 *		liteboxHideSpeed: 100
 *	});
 * @desc Same as above but with custom options
 *
 * @param litebox content element id
 * @param close litebox element id
 * @param overlay element id
 * @param overlay background color
 * @param overlay opacity
 * @param show overlay animation speed
 * @param hide overlay animation speed
 * @param show litebox animation speed
 * @param hide litebox animation speed
 *
 * @return jQuery Object
 * @type jQuery
 *
 * @name jQuery.fn.litebox
 * @cat Plugins/Forms
 */
(function($){
    $.fn.litebox = function(options) {
        // default options
        var settings = {
            target : 'litebox', // target id
            close : 'close', // close element id
            overlay : 'overlay', // overlay element id
            overlayBg : '222', // overlay bg color
            overlayOpacity : '0.8', // overlay opacity
            overlayShowSpeed : 300, // overlay show animation speed
            overlayHideSpeed : 900, // overlay hide animation speed
            liteboxShowSpeed : 450, // litebox show animation speed
            liteboxHideSpeed : 500 // litebox hide animation speed
        };

        // if an options object is passed, extend defaults, if not assume its the target element
        if(options){
            if(typeof options == 'object'){
                $.extend(settings, options);
            }else{
                settings.target = options;
            }
        }

        this.each(function (){
            // cache selectors and init some variables
            var t = $(this), tw, th, targetCache = $('#'+settings.target);
            // hide the target (just in case)
            targetCache.hide();
            // calculate target width and height
            tw = (targetCache.width() + parseInt(targetCache.css('paddingLeft').replace('px','')) + parseInt(targetCache.css('paddingRight').replace('px',''))) / 2;
            th = (targetCache.height() + parseInt(targetCache.css('paddingTop').replace('px','')) + parseInt(targetCache.css('paddingBottom').replace('px',''))) / 2;
            // store the litebox element's contents so we can remove it
            $.data(t.get(0), 'litebox', targetCache.html());
            // remove the element
            targetCache.remove();
            // release target cache
            targetCache = null;
            // bind click event
            t.click(function(){
                // init vars
                var overlay, left, top;
                // calculate window center position
                left = ($(window).width()/2) - tw;
                top = ($(window).height()/2) - th;
                // create html for the lightbox
                overlay = '<div id="'+settings.overlay+'" style="opacity:'+settings.overlayOpacity+';height: 100%;width: 100%;background: #'+settings.overlayBg+';display: none;position: fixed;top: 0;left: 0;"><div id="'+settings.target+'" style="position: absolute;left:'+left+'px;top:'+top+'px;">'+$.data(t.get(0), 'litebox')+'</div></div>';
                // append the overlay to the dom and show it
                $('body').append(overlay).find('#'+settings.overlay).find('#'+settings.target).hide().end().fadeIn(settings.overlayShowSpeed, function(){
                    // when its done show the litebox
                    $('#'+settings.target).slideDown(settings.liteboxShowSpeed);
                });
            });
            // bind close event
            $('#'+settings.target+' #'+settings.close).live('click', (function(){
                // start hiding the litebox
                $('#'+settings.target).slideUp(settings.liteboxHideSpeed);
                // start hiding the overlay
                $('#'+settings.overlay).fadeOut(settings.overlayHideSpeed, function(){
                    // when we're done remove everything
                    $(this).remove();
                });
            }));
        });
    // keep the chaining dream alive
    return this;
	};
})(jQuery);
