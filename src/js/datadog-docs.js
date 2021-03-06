(function () {

    var DD_docs = {};

    DD_docs.metricsGuidePage = function () {
        $('.lang-tab').click(function (e) {
            var el = $(this);
            var lang = el.attr('lang');
            $('.' + lang + '-lang-tab').tab('show');
        });
    };

    DD_docs.apiPage = function () {

        // When language buttons are clicked, show all the code snippets
        // from that language.
        $('.lang-btn').click(function (e) {
            var el = $(this);

            // Find the element currently in the view port
            var scrollElement;
            $('div.int-anchor').each( function() {
              if ($(this).offset().top >= window.scrollY) {
                scrollElement = $(this);
                return false;
              }
            });

            // Highlight the active button.
            $('.lang-btn').removeClass('active');
            el.addClass('active');

            // Show this language's code blocks and language-specific elements
            var lang = el.attr('lang');
            $('.code-block').hide();
            $('.code-block-' + lang).fadeIn();
            $('.lang-specific').hide();
            $('.lang-specific-' + lang).fadeIn();

            // Scroll to the element that was in the viewport (ie retain location).
            $('html, body').scrollTop(scrollElement.offset().top);

            // Add the language selection to the current URL.
            if (history.pushState) {
                url = window.location.href.replace(window.location.hash, '').replace(window.location.search, '');
                history.pushState(null, null, url + '?lang=' + lang + window.location.hash)
            }
        });

    };

    // Export to global scope.
    window.DD_docs = DD_docs;

    // var language = navigator.languages ? navigator.languages[0] : (navigator.language || navigator.userLanguage)
    // var noOverride = window.location.href.indexOf("overridelang") == -1;
    // if (noOverride) {
    //     if (language.indexOf('ja') > -1 && window.location.pathname.indexOf('/ja/') != 0) {
    //         document.location.href = '/ja' + window.location.pathname;
    //     } else if (language.indexOf('ja') == -1 && window.location.pathname.indexOf('/ja/') == 0) {
    //         document.location.href = window.location.pathname.substring(3);
    //     }
    // }


})();


$(document).ready(function() {

    var header;
    var subheading;
    var subsubheading;

    var toc = window.Datadog.toc;
    var tocdepth = window.Datadog.tocdepth;

    headings = {

        'init': function(){

            $('#tipue_search_input').tipuesearch();

            this.h1s = $('.main h1');
            this.h2s = $('.main h2');
            this.h3s = $('.main h3');
            this.h4s = $('.main h4');
            this.listHeadings();
            this.setHeadings();

        },
        'listHeadings': function() {
            //console.log('h1s', this.h1s.length);
            // console.log('h2s', this.h2s.length);
            // console.log('h3s', this.h3s.length);
            // console.log('h4s', this.h4s.length);
        },
        'setHeadings': function(){
            header = '';
            subheading = '';
            subsubheading = '';

            if(this.h2s.length && this.h3s.length && this.h4s.length) {
                header = 'h2';
                subheading = 'h3';
                subsubheading = 'h4';
            } else {
                if(this.h2s.length > 0 && this.h3s.length == 0 && this.h4s.length == 0) {
                    header = 'h2';
                } else if(this.h2s.length > 0 && this.h3s.length > 0) {
                    header = 'h2';
                    subheading = 'h3';
                } else if(this.h2s.length == 0 && this.h3s.length > 0) {
                    header = 'h3';
                    if(this.h4s.length) {
                        subheading = 'h4';
                    }
                } else if(this.h2s.length == 0 && this.h3s.length == 0 && this.h4s.length > 0) {
                    header = 'h4';
                    if(this.h5s.length) {
                        subheading = 'h5';
                    }
                }
            }

            if(parseInt(tocdepth) == 1){
                subheading = '';
            }

            if(header !== '') {
                this.initToc(header, subheading, subsubheading);
            }

        },
        'initToc': function(header, subheading, subsubheading) {

            this.header = header;
            this.subheading = subheading;
            this.subsubheading = subsubheading;

            // console.log(header);
            // console.log(subheading);

            if(this.header.length > 0 || this.subheading.length > 0) {
                $('body').tocible({
                    heading: this.header, //[selector], the first level heading
                    subheading: this.subheading, //[selector], the second level heading
                    subsubheading: this.subsubheading,
                    reference: '#toc-box', //[selector], reference element for horizontal positioning
                    title: 'Table of Contents', //[selector or string], title of the menu
                    hash: false, //[boolean], setting true will enable URL hashing on click
                    //offsetTop: 300, //[number], spacing/margin above the menu
                    speed: 10, //[number or string ('slow' & 'fast')], duration of the animation when jumping to the clicked content
                    collapsible: false, //[boolean], enabling true will auto collapse sub level heading not being scrolled into
                    maxWidth: null //[number], set max-width of the navigation menu
                });
            }
        }
    }

    $('table').each(function() {
        if(!$(this).hasClass('table')) {
            $(this).addClass('table');
        }
    });

    $('h2, h3, h4, h5').each(function() {
        var id = $(this).attr('id') || '';
        var iconfa = '<i class="fa fa-link" aria-hidden="true"></i>';
        var iconglyph = '<span class="glyphicon glyphicon-link" aria-hidden="true"></span>';
        var markup = '<a class="header-link" href="#'+id+'">'+iconglyph+'</a>';
        if(!$(this).hasClass('linked-header')) {
            $(this).addClass('linked-header');
            $(this).prepend(markup);
        }
    });

    if(toc) {
        console.log(toc);
        headings.init();
    }

});

// Allow language selection via URL GET parameter.
$(window).load(function() {
    if (s = window.location.search.match(/lang=[^&]+/gi)) {
        lang = s[0].replace(/lang=/gi, '');
        $('div[lang="' + lang + '"]').click();
    }
});
