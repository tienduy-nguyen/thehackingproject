(() => {
  'use strict';
  var e = {
      460: () => {
        var e = document.getElementById('rbw'),
          t = 0,
          n =
            (document.getElementsByTagName('html')[0],
            'ontouchstart' in window ? 'touchend' : 'click'),
          o = ['remove', 'add'],
          d = [
            'Add more contrast',
            'Remove additional contrast',
            'Inverted mode',
            'Normal mode',
          ];
        function r(e, t, d) {
          var r = document.getElementsByTagName('html')[0],
            a = document.getElementById(e),
            i = a.firstChild,
            m = !1;
          a.addEventListener(
            n,
            function () {
              var e = Number((m = !m));
              (i.data = t[e]), r.classList[o[e]](d);
            },
            !1
          );
        }
        !(function () {
          var e = document.createElement('div');
          (e.id = 'contrast'), (e.innerText = d[0]);
          var t = document.createElement('div');
          (t.id = 'invmode'),
            (t.innerText = d[2]),
            document.body.appendChild(e),
            document.body.appendChild(t);
        })(),
          (function n() {
            var o = 'hsl(' + t + ', 80%, 60%)',
              d = t + 5;
            (t = d > 360 ? 0 : d), (e.style.color = o), setTimeout(n, 40);
          })(),
          r('contrast', [d[0], d[1]], 'contrast'),
          r('invmode', [d[2], d[3]], 'inverted');
      },
    },
    t = {};
  function n(o) {
    if (t[o]) return t[o].exports;
    var d = (t[o] = {
      exports: {},
    });
    return e[o](d, d.exports, n), d.exports;
  }
  (n.p = ''),
    (() => {
      n(460);
      n.p;
    })();
})();
