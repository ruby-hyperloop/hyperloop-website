semantic.home = {};

// ready event
semantic.home.ready = function() {

  var
    $themeDropdown = $('.theme.dropdown'),
    $header        = $('.masthead'),
    $ui            = $header.find('h1 b'),
    $phrase        = $header.find('h1 span'),
    $download      = $header.find('.download'),
    $library       = $header.find('.library'),
    $version       = $header.find('.version'),
    handler
  ;

  handler = {
    endAnimation: function() {
      $header
        .addClass('stopped')
      ;
    },
    changeLogo: function() {
      var
        $logo = $('.following .logo'),
        $nextSide = $logo.find('.'+ $(this).data('site') +'.side'),
        directions = [
          'up',
          'left',
          'down',
          'right'
        ],
        direction = directions[Math.floor(Math.random() * directions.length)]
      ;
      if($nextSide.size() > 0) {
        clearTimeout(handler.timer);
        handler.timer = setTimeout(function() {
          $logo
            .shape('set next side', $nextSide)
            .shape('flip ' +  direction)
          ;
        }, 50);
      }
    },
    returnLogo: function() {
      var
        $logo = $('.following .logo'),
        $nextSide = $logo.find('.learn.side')
      ;
      clearTimeout(handler.timer);
      handler.timer = setTimeout(function() {
        $logo
          .shape('set next side', $nextSide)
          .shape('flip over')
        ;
      }, 500);

    }
  };

  $('.logo.shape')
    .shape({
      duration: 400
    })
  ;

  if($(window).width() > 768) {
    $('body')
      .visibility({
        offset: -1,
        once: false,
        continuous: false,
        onTopPassed: function() {
          $('.following.bar')
            .removeClass('dark')
            .addClass('light fixed')
            .find('.menu')
              .removeClass('inverted')
          ;
          requestAnimationFrame(function() {
            $('.following .additional.item')
              .transition('scale in', 750)
            ;
          });
        },
        onTopPassedReverse: function() {
          $('.following.bar')
            .removeClass('light fixed')
            .addClass('dark')
            .find('.menu')
              .addClass('inverted')
              .find('.additional.item')
                .transition('hide')
          ;
        }
      })
    ;
    $('.vertical.stripe').eq(0)
      .visibility({
        offset: 70,
        once: false,
        onTopPassed: function() {
          /*
          $('.following.bar')
            .addClass('animated')
          ;
          */
        }
      })
    ;
   $('.vertical.stripe').eq(0)
      .visibility({
        offset: 70,
        once: false,
        onTopPassed: function() {
          $('.following.bar')
            .addClass('animated dark')
          ;
        },
        onTopPassedReverse: function() {
          $('.following.bar')
            .removeClass('animated dark')
            .addClass('light')
          ;
        }
      })
    ;
  }

  $('.additional.item')
    .popup({
      delay: {
        show: 200,
        hide: 50
      },
      position: 'bottom center'
    })
  ;

  $('.following.bar .network')
    .find('.item')
      .on('mouseenter', handler.changeLogo)
      .on('mouseleave', handler.returnLogo)
  ;

  $('.email.stripe form')
    .form({
      email: {
        identifier : 'email',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter an e-mail'
          },
          {
            type   : 'email',
            prompt : 'Please enter a valid e-mail address'
          }
        ]
      }
    })
  ;

  $('.masthead')
    .visibility({
      onBottomPassed : handler.endAnimation
    })
  ;

  $themeDropdown
    .dropdown('setting', 'transition', 'drop')
    .dropdown('setting', 'duration', 350)
    .dropdown('setting', 'action', 'activate')
  ;

  if(window.Transifex !== undefined) {
    window.Transifex.live.onTranslatePage(function(countryCode){
      var fullName = $('.language.dropdown .item[data-value=' + countryCode + ']').eq(0).text();
      $('.language.dropdown > .text').html(fullName);
    });
  }

  $('.ui.sidebar')
    .sidebar('setting', 'transition', 'overlay')
  ;

};


// attach ready event
$(document)
  .ready(semantic.home.ready)
;