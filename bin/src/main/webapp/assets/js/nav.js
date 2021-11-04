var lastScrollTop = 0,

    delta = 15;

  $(window).scroll(function(event) {

    var st = $(this).scrollTop();

    if (Math.abs(lastScrollTop - st) <= delta) return;

    if ((st > lastScrollTop) && (lastScrollTop > 0)) {

      $("header").css({

        "top": "-43px"

      });

    } else {

      $("header").css({

        "top": "0"

      });

    }

    lastScrollTop = st;

  });
