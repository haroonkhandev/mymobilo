var tns = function() {
    var t = window,
        Ai = t.requestAnimationFrame || t.webkitRequestAnimationFrame || t.mozRequestAnimationFrame || t.msRequestAnimationFrame || function(t) {
            return setTimeout(t, 16)
        },
        e = window,
        Ni = e.cancelAnimationFrame || e.mozCancelAnimationFrame || function(t) {
            clearTimeout(t)
        };

    function Li() {
        for (var t, e, n, i = arguments[0] || {}, a = 1, r = arguments.length; a < r; a++)
            if (null !== (t = arguments[a]))
                for (e in t) i !== (n = t[e]) && void 0 !== n && (i[e] = n);
        return i
    }

    function Bi(t) {
        return 0 <= ["true", "false"].indexOf(t) ? JSON.parse(t) : t
    }

    function Si(t, e, n, i) {
        if (i) try {
            t.setItem(e, n)
        } catch (t) {}
        return n
    }

    function Hi() {
        var t = document,
            e = t.body;
        return e || ((e = t.createElement("body")).fake = !0), e
    }
    var n = document.documentElement;

    function Oi(t) {
        var e = "";
        return t.fake && (e = n.style.overflow, t.style.background = "", t.style.overflow = n.style.overflow = "hidden", n.appendChild(t)), e
    }

    function Di(t, e) {
        t.fake && (t.remove(), n.style.overflow = e, n.offsetHeight)
    }

    function ki(t, e, n, i) {
        "insertRule" in t ? t.insertRule(e + "{" + n + "}", i) : t.addRule(e, n, i)
    }

    function Ri(t) {
        return ("insertRule" in t ? t.cssRules : t.rules).length
    }

    function Ii(t, e, n) {
        for (var i = 0, a = t.length; i < a; i++) e.call(n, t[i], i)
    }
    var i = "classList" in document.createElement("_"),
        Pi = i ? function(t, e) {
            return t.classList.contains(e)
        } : function(t, e) {
            return 0 <= t.className.indexOf(e)
        },
        zi = i ? function(t, e) {
            Pi(t, e) || t.classList.add(e)
        } : function(t, e) {
            Pi(t, e) || (t.className += " " + e)
        },
        Wi = i ? function(t, e) {
            Pi(t, e) && t.classList.remove(e)
        } : function(t, e) {
            Pi(t, e) && (t.className = t.className.replace(e, ""))
        };

    function qi(t, e) {
        return t.hasAttribute(e)
    }

    function Fi(t, e) {
        return t.getAttribute(e)
    }

    function r(t) {
        return void 0 !== t.item
    }

    function ji(t, e) {
        if (t = r(t) || t instanceof Array ? t : [t], "[object Object]" === Object.prototype.toString.call(e))
            for (var n = t.length; n--;)
                for (var i in e) t[n].setAttribute(i, e[i])
    }

    function Vi(t, e) {
        t = r(t) || t instanceof Array ? t : [t];
        for (var n = (e = e instanceof Array ? e : [e]).length, i = t.length; i--;)
            for (var a = n; a--;) t[i].removeAttribute(e[a])
    }

    function Gi(t) {
        for (var e = [], n = 0, i = t.length; n < i; n++) e.push(t[n]);
        return e
    }

    function Qi(t, e) {
        "none" !== t.style.display && (t.style.display = "none")
    }

    function Xi(t, e) {
        "none" === t.style.display && (t.style.display = "")
    }

    function Yi(t) {
        return "none" !== window.getComputedStyle(t).display
    }

    function Ki(e) {
        if ("string" == typeof e) {
            var n = [e],
                i = e.charAt(0).toUpperCase() + e.substr(1);
            ["Webkit", "Moz", "ms", "O"].forEach(function(t) {
                "ms" === t && "transform" !== e || n.push(t + i)
            }), e = n
        }
        for (var t = document.createElement("fakeelement"), a = (e.length, 0); a < e.length; a++) {
            var r = e[a];
            if (void 0 !== t.style[r]) return r
        }
        return !1
    }

    function Ji(t, e) {
        var n = !1;
        return /^Webkit/.test(t) ? n = "webkit" + e + "End" : /^O/.test(t) ? n = "o" + e + "End" : t && (n = e.toLowerCase() + "end"), n
    }
    var a = !1;
    try {
        var o = Object.defineProperty({}, "passive", {
            get: function() {
                a = !0
            }
        });
        window.addEventListener("test", null, o)
    } catch (t) {}
    var u = !!a && {
        passive: !0
    };

    function Ui(t, e, n) {
        for (var i in e) {
            var a = 0 <= ["touchstart", "touchmove"].indexOf(i) && !n && u;
            t.addEventListener(i, e[i], a)
        }
    }

    function _i(t, e) {
        for (var n in e) {
            var i = 0 <= ["touchstart", "touchmove"].indexOf(n) && u;
            t.removeEventListener(n, e[n], i)
        }
    }

    function Zi() {
        return {
            topics: {},
            on: function(t, e) {
                this.topics[t] = this.topics[t] || [], this.topics[t].push(e)
            },
            off: function(t, e) {
                if (this.topics[t])
                    for (var n = 0; n < this.topics[t].length; n++)
                        if (this.topics[t][n] === e) {
                            this.topics[t].splice(n, 1);
                            break
                        }
            },
            emit: function(e, n) {
                n.type = e, this.topics[e] && this.topics[e].forEach(function(t) {
                    t(n, e)
                })
            }
        }
    }
    Object.keys || (Object.keys = function(t) {
        var e = [];
        for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && e.push(n);
        return e
    }), "remove" in Element.prototype || (Element.prototype.remove = function() {
        this.parentNode && this.parentNode.removeChild(this)
    });
    var $i = function(H) {
        H = Li({
            container: ".slider",
            mode: "carousel",
            axis: "horizontal",
            items: 1,
            gutter: 0,
            edgePadding: 0,
            fixedWidth: !1,
            autoWidth: !1,
            viewportMax: !1,
            slideBy: 1,
            center: !1,
            controls: !0,
            controlsPosition: "top",
            controlsText: ["prev", "next"],
            controlsContainer: !1,
            prevButton: !1,
            nextButton: !1,
            nav: !0,
            navPosition: "top",
            navContainer: !1,
            navAsThumbnails: !1,
            arrowKeys: !1,
            speed: 300,
            autoplay: !1,
            autoplayPosition: "top",
            autoplayTimeout: 5e3,
            autoplayDirection: "forward",
            autoplayText: ["start", "stop"],
            autoplayHoverPause: !1,
            autoplayButton: !1,
            autoplayButtonOutput: !0,
            autoplayResetOnVisibility: !0,
            animateIn: "tns-fadeIn",
            animateOut: "tns-fadeOut",
            animateNormal: "tns-normal",
            animateDelay: !1,
            loop: !0,
            rewind: !1,
            autoHeight: !1,
            responsive: !1,
            lazyload: !1,
            lazyloadSelector: ".tns-lazy-img",
            touch: !0,
            mouseDrag: !1,
            swipeAngle: 15,
            nested: !1,
            preventActionWhenRunning: !1,
            preventScrollOnTouch: !1,
            freezable: !0,
            onInit: !1,
            useLocalStorage: !0,
            nonce: !1
        }, H || {});
        var O = document,
            m = window,
            a = {
                ENTER: 13,
                SPACE: 32,
                LEFT: 37,
                RIGHT: 39
            },
            e = {},
            n = H.useLocalStorage;
        if (n) {
            var t = navigator.userAgent,
                i = new Date;
            try {
                (e = m.localStorage) ? (e.setItem(i, i), n = e.getItem(i) == i, e.removeItem(i)) : n = !1, n || (e = {})
            } catch (t) {
                n = !1
            }
            n && (e.tnsApp && e.tnsApp !== t && ["tC", "tPL", "tMQ", "tTf", "t3D", "tTDu", "tTDe", "tADu", "tADe", "tTE", "tAE"].forEach(function(t) {
                e.removeItem(t)
            }), localStorage.tnsApp = t)
        }
        var y = e.tC ? Bi(e.tC) : Si(e, "tC", function() {
                var t = document,
                    e = Hi(),
                    n = Oi(e),
                    i = t.createElement("div"),
                    a = !1;
                e.appendChild(i);
                try {
                    for (var r, o = "(10px * 10)", u = ["calc" + o, "-moz-calc" + o, "-webkit-calc" + o], l = 0; l < 3; l++)
                        if (r = u[l], i.style.width = r, 100 === i.offsetWidth) {
                            a = r.replace(o, "");
                            break
                        }
                } catch (t) {}
                return e.fake ? Di(e, n) : i.remove(), a
            }(), n),
            g = e.tPL ? Bi(e.tPL) : Si(e, "tPL", function() {
                var t, e = document,
                    n = Hi(),
                    i = Oi(n),
                    a = e.createElement("div"),
                    r = e.createElement("div"),
                    o = "";
                a.className = "tns-t-subp2", r.className = "tns-t-ct";
                for (var u = 0; u < 70; u++) o += "<div></div>";
                return r.innerHTML = o, a.appendChild(r), n.appendChild(a), t = Math.abs(a.getBoundingClientRect().left - r.children[67].getBoundingClientRect().left) < 2, n.fake ? Di(n, i) : a.remove(), t
            }(), n),
            D = e.tMQ ? Bi(e.tMQ) : Si(e, "tMQ", function() {
                if (window.matchMedia || window.msMatchMedia) return !0;
                var t, e = document,
                    n = Hi(),
                    i = Oi(n),
                    a = e.createElement("div"),
                    r = e.createElement("style"),
                    o = "@media all and (min-width:1px){.tns-mq-test{position:absolute}}";
                return r.type = "text/css", a.className = "tns-mq-test", n.appendChild(r), n.appendChild(a), r.styleSheet ? r.styleSheet.cssText = o : r.appendChild(e.createTextNode(o)), t = window.getComputedStyle ? window.getComputedStyle(a).position : a.currentStyle.position, n.fake ? Di(n, i) : a.remove(), "absolute" === t
            }(), n),
            r = e.tTf ? Bi(e.tTf) : Si(e, "tTf", Ki("transform"), n),
            o = e.t3D ? Bi(e.t3D) : Si(e, "t3D", function(t) {
                if (!t) return !1;
                if (!window.getComputedStyle) return !1;
                var e, n = document,
                    i = Hi(),
                    a = Oi(i),
                    r = n.createElement("p"),
                    o = 9 < t.length ? "-" + t.slice(0, -9).toLowerCase() + "-" : "";
                return o += "transform", i.insertBefore(r, null), r.style[t] = "translate3d(1px,1px,1px)", e = window.getComputedStyle(r).getPropertyValue(o), i.fake ? Di(i, a) : r.remove(), void 0 !== e && 0 < e.length && "none" !== e
            }(r), n),
            x = e.tTDu ? Bi(e.tTDu) : Si(e, "tTDu", Ki("transitionDuration"), n),
            u = e.tTDe ? Bi(e.tTDe) : Si(e, "tTDe", Ki("transitionDelay"), n),
            b = e.tADu ? Bi(e.tADu) : Si(e, "tADu", Ki("animationDuration"), n),
            l = e.tADe ? Bi(e.tADe) : Si(e, "tADe", Ki("animationDelay"), n),
            s = e.tTE ? Bi(e.tTE) : Si(e, "tTE", Ji(x, "Transition"), n),
            c = e.tAE ? Bi(e.tAE) : Si(e, "tAE", Ji(b, "Animation"), n),
            f = m.console && "function" == typeof m.console.warn,
            d = ["container", "controlsContainer", "prevButton", "nextButton", "navContainer", "autoplayButton"],
            v = {};
        if (d.forEach(function(t) {
                if ("string" == typeof H[t]) {
                    var e = H[t],
                        n = O.querySelector(e);
                    if (v[t] = e, !n || !n.nodeName) return void(f && console.warn("Can't find", H[t]));
                    H[t] = n
                }
            }), !(H.container.children.length < 1)) {
            var k = H.responsive,
                R = H.nested,
                I = "carousel" === H.mode;
            if (k) {
                0 in k && (H = Li(H, k[0]), delete k[0]);
                var p = {};
                for (var h in k) {
                    var w = k[h];
                    w = "number" == typeof w ? {
                        items: w
                    } : w, p[h] = w
                }
                k = p, p = null
            }
            if (I || function t(e) {
                    for (var n in e) I || ("slideBy" === n && (e[n] = "page"), "edgePadding" === n && (e[n] = !1), "autoHeight" === n && (e[n] = !1)), "responsive" === n && t(e[n])
                }(H), !I) {
                H.axis = "horizontal", H.slideBy = "page", H.edgePadding = !1;
                var P = H.animateIn,
                    z = H.animateOut,
                    C = H.animateDelay,
                    W = H.animateNormal
            }
            var M, q, F = "horizontal" === H.axis,
                T = O.createElement("div"),
                j = O.createElement("div"),
                V = H.container,
                E = V.parentNode,
                A = V.outerHTML,
                G = V.children,
                Q = G.length,
                X = rn(),
                Y = !1;
            k && En(), I && (V.className += " tns-vpfix");
            var N, L, B, S, K, J, U, _, Z, $ = H.autoWidth,
                tt = sn("fixedWidth"),
                et = sn("edgePadding"),
                nt = sn("gutter"),
                it = un(),
                at = sn("center"),
                rt = $ ? 1 : Math.floor(sn("items")),
                ot = sn("slideBy"),
                ut = H.viewportMax || H.fixedWidthViewportWidth,
                lt = sn("arrowKeys"),
                st = sn("speed"),
                ct = H.rewind,
                ft = !ct && H.loop,
                dt = sn("autoHeight"),
                vt = sn("controls"),
                pt = sn("controlsText"),
                ht = sn("nav"),
                mt = sn("touch"),
                yt = sn("mouseDrag"),
                gt = sn("autoplay"),
                xt = sn("autoplayTimeout"),
                bt = sn("autoplayText"),
                wt = sn("autoplayHoverPause"),
                Ct = sn("autoplayResetOnVisibility"),
                Mt = (U = null, _ = sn("nonce"), Z = document.createElement("style"), U && Z.setAttribute("media", U), _ && Z.setAttribute("nonce", _), document.querySelector("head").appendChild(Z), Z.sheet ? Z.sheet : Z.styleSheet),
                Tt = H.lazyload,
                Et = H.lazyloadSelector,
                At = [],
                Nt = ft ? (K = function() {
                    {
                        if ($ || tt && !ut) return Q - 1;
                        var t = tt ? "fixedWidth" : "items",
                            e = [];
                        if ((tt || H[t] < Q) && e.push(H[t]), k)
                            for (var n in k) {
                                var i = k[n][t];
                                i && (tt || i < Q) && e.push(i)
                            }
                        return e.length || e.push(0), Math.ceil(tt ? ut / Math.min.apply(null, e) : Math.max.apply(null, e))
                    }
                }(), J = I ? Math.ceil((5 * K - Q) / 2) : 4 * K - Q, J = Math.max(K, J), ln("edgePadding") ? J + 1 : J) : 0,
                Lt = I ? Q + 2 * Nt : Q + Nt,
                Bt = !(!tt && !$ || ft),
                St = tt ? _n() : null,
                Ht = !I || !ft,
                Ot = F ? "left" : "top",
                Dt = "",
                kt = "",
                Rt = tt ? function() {
                    return at && !ft ? Q - 1 : Math.ceil(-St / (tt + nt))
                } : $ ? function() {
                    for (var t = 0; t < Lt; t++)
                        if (N[t] >= -St) return t
                } : function() {
                    return at && I && !ft ? Q - 1 : ft || I ? Math.max(0, Lt - Math.ceil(rt)) : Lt - 1
                },
                It = en(sn("startIndex")),
                Pt = It,
                zt = (tn(), 0),
                Wt = $ ? null : Rt(),
                qt = H.preventActionWhenRunning,
                Ft = H.swipeAngle,
                jt = !Ft || "?",
                Vt = !1,
                Gt = H.onInit,
                Qt = new Zi,
                Xt = " tns-slider tns-" + H.mode,
                Yt = V.id || (S = window.tnsId, window.tnsId = S ? S + 1 : 1, "tns" + window.tnsId),
                Kt = sn("disable"),
                Jt = !1,
                Ut = H.freezable,
                _t = !(!Ut || $) && Tn(),
                Zt = !1,
                $t = {
                    click: oi,
                    keydown: function(t) {
                        t = pi(t);
                        var e = [a.LEFT, a.RIGHT].indexOf(t.keyCode);
                        0 <= e && (0 === e ? we.disabled || oi(t, -1) : Ce.disabled || oi(t, 1))
                    }
                },
                te = {
                    click: function(t) {
                        if (Vt) {
                            if (qt) return;
                            ai()
                        }
                        var e = hi(t = pi(t));
                        for (; e !== Ae && !qi(e, "data-nav");) e = e.parentNode;
                        if (qi(e, "data-nav")) {
                            var n = Se = Number(Fi(e, "data-nav")),
                                i = tt || $ ? n * Q / Le : n * rt,
                                a = le ? n : Math.min(Math.ceil(i), Q - 1);
                            ri(a, t), He === n && (Pe && fi(), Se = -1)
                        }
                    },
                    keydown: function(t) {
                        t = pi(t);
                        var e = O.activeElement;
                        if (!qi(e, "data-nav")) return;
                        var n = [a.LEFT, a.RIGHT, a.ENTER, a.SPACE].indexOf(t.keyCode),
                            i = Number(Fi(e, "data-nav"));
                        0 <= n && (0 === n ? 0 < i && vi(Ee[i - 1]) : 1 === n ? i < Le - 1 && vi(Ee[i + 1]) : ri(Se = i, t))
                    }
                },
                ee = {
                    mouseover: function() {
                        Pe && (li(), ze = !0)
                    },
                    mouseout: function() {
                        ze && (ui(), ze = !1)
                    }
                },
                ne = {
                    visibilitychange: function() {
                        O.hidden ? Pe && (li(), qe = !0) : qe && (ui(), qe = !1)
                    }
                },
                ie = {
                    keydown: function(t) {
                        t = pi(t);
                        var e = [a.LEFT, a.RIGHT].indexOf(t.keyCode);
                        0 <= e && oi(t, 0 === e ? -1 : 1)
                    }
                },
                ae = {
                    touchstart: xi,
                    touchmove: bi,
                    touchend: wi,
                    touchcancel: wi
                },
                re = {
                    mousedown: xi,
                    mousemove: bi,
                    mouseup: wi,
                    mouseleave: wi
                },
                oe = ln("controls"),
                ue = ln("nav"),
                le = !!$ || H.navAsThumbnails,
                se = ln("autoplay"),
                ce = ln("touch"),
                fe = ln("mouseDrag"),
                de = "tns-slide-active",
                ve = "tns-slide-cloned",
                pe = "tns-complete",
                he = {
                    load: function(t) {
                        kn(hi(t))
                    },
                    error: function(t) {
                        e = hi(t), zi(e, "failed"), Rn(e);
                        var e
                    }
                },
                me = "force" === H.preventScrollOnTouch;
            if (oe) var ye, ge, xe = H.controlsContainer,
                be = H.controlsContainer ? H.controlsContainer.outerHTML : "",
                we = H.prevButton,
                Ce = H.nextButton,
                Me = H.prevButton ? H.prevButton.outerHTML : "",
                Te = H.nextButton ? H.nextButton.outerHTML : "";
            if (ue) var Ee, Ae = H.navContainer,
                Ne = H.navContainer ? H.navContainer.outerHTML : "",
                Le = $ ? Q : Mi(),
                Be = 0,
                Se = -1,
                He = an(),
                Oe = He,
                De = "tns-nav-active",
                ke = "Carousel Page ",
                Re = " (Current Slide)";
            if (se) var Ie, Pe, ze, We, qe, Fe = "forward" === H.autoplayDirection ? 1 : -1,
                je = H.autoplayButton,
                Ve = H.autoplayButton ? H.autoplayButton.outerHTML : "",
                Ge = ["<span class='tns-visually-hidden'>", " animation</span>"];
            if (ce || fe) var Qe, Xe, Ye = {},
                Ke = {},
                Je = !1,
                Ue = F ? function(t, e) {
                    return t.x - e.x
                } : function(t, e) {
                    return t.y - e.y
                };
            $ || $e(Kt || _t), r && (Ot = r, Dt = "translate", o ? (Dt += F ? "3d(" : "3d(0px, ", kt = F ? ", 0px, 0px)" : ", 0px)") : (Dt += F ? "X(" : "Y(", kt = ")")), I && (V.className = V.className.replace("tns-vpfix", "")),
                function() {
                    ln("gutter");
                    T.className = "tns-outer", j.className = "tns-inner", T.id = Yt + "-ow", j.id = Yt + "-iw", "" === V.id && (V.id = Yt);
                    Xt += g || $ ? " tns-subpixel" : " tns-no-subpixel", Xt += y ? " tns-calc" : " tns-no-calc", $ && (Xt += " tns-autowidth");
                    Xt += " tns-" + H.axis, V.className += Xt, I ? ((M = O.createElement("div")).id = Yt + "-mw", M.className = "tns-ovh", T.appendChild(M), M.appendChild(j)) : T.appendChild(j);
                    if (dt) {
                        var t = M || j;
                        t.className += " tns-ah"
                    }
                    if (E.insertBefore(T, V), j.appendChild(V), Ii(G, function(t, e) {
                            zi(t, "tns-item"), t.id || (t.id = Yt + "-item" + e), !I && W && zi(t, W), ji(t, {
                                "aria-hidden": "true",
                                tabindex: "-1"
                            })
                        }), Nt) {
                        for (var e = O.createDocumentFragment(), n = O.createDocumentFragment(), i = Nt; i--;) {
                            var a = i % Q,
                                r = G[a].cloneNode(!0);
                            if (zi(r, ve), Vi(r, "id"), n.insertBefore(r, n.firstChild), I) {
                                var o = G[Q - 1 - a].cloneNode(!0);
                                zi(o, ve), Vi(o, "id"), e.appendChild(o)
                            }
                        }
                        V.insertBefore(e, V.firstChild), V.appendChild(n), G = V.children
                    }
                }(),
                function() {
                    if (!I)
                        for (var t = It, e = It + Math.min(Q, rt); t < e; t++) {
                            var n = G[t];
                            n.style.left = 100 * (t - It) / rt + "%", zi(n, P), Wi(n, W)
                        }
                    F && (g || $ ? (ki(Mt, "#" + Yt + " > .tns-item", "font-size:" + m.getComputedStyle(G[0]).fontSize + ";", Ri(Mt)), ki(Mt, "#" + Yt, "font-size:0;", Ri(Mt))) : I && Ii(G, function(t, e) {
                        var n;
                        t.style.marginLeft = (n = e, y ? y + "(" + 100 * n + "% / " + Lt + ")" : 100 * n / Lt + "%")
                    }));
                    if (D) {
                        if (x) {
                            var i = M && H.autoHeight ? hn(H.speed) : "";
                            ki(Mt, "#" + Yt + "-mw", i, Ri(Mt))
                        }
                        i = cn(H.edgePadding, H.gutter, H.fixedWidth, H.speed, H.autoHeight), ki(Mt, "#" + Yt + "-iw", i, Ri(Mt)), I && (i = F && !$ ? "width:" + fn(H.fixedWidth, H.gutter, H.items) + ";" : "", x && (i += hn(st)), ki(Mt, "#" + Yt, i, Ri(Mt))), i = F && !$ ? dn(H.fixedWidth, H.gutter, H.items) : "", H.gutter && (i += vn(H.gutter)), I || (x && (i += hn(st)), b && (i += mn(st))), i && ki(Mt, "#" + Yt + " > .tns-item", i, Ri(Mt))
                    } else {
                        I && dt && (M.style[x] = st / 1e3 + "s"), j.style.cssText = cn(et, nt, tt, dt), I && F && !$ && (V.style.width = fn(tt, nt, rt));
                        var i = F && !$ ? dn(tt, nt, rt) : "";
                        nt && (i += vn(nt)), i && ki(Mt, "#" + Yt + " > .tns-item", i, Ri(Mt))
                    }
                    if (k && D)
                        for (var a in k) {
                            a = parseInt(a);
                            var r = k[a],
                                i = "",
                                o = "",
                                u = "",
                                l = "",
                                s = "",
                                c = $ ? null : sn("items", a),
                                f = sn("fixedWidth", a),
                                d = sn("speed", a),
                                v = sn("edgePadding", a),
                                p = sn("autoHeight", a),
                                h = sn("gutter", a);
                            x && M && sn("autoHeight", a) && "speed" in r && (o = "#" + Yt + "-mw{" + hn(d) + "}"), ("edgePadding" in r || "gutter" in r) && (u = "#" + Yt + "-iw{" + cn(v, h, f, d, p) + "}"), I && F && !$ && ("fixedWidth" in r || "items" in r || tt && "gutter" in r) && (l = "width:" + fn(f, h, c) + ";"), x && "speed" in r && (l += hn(d)), l && (l = "#" + Yt + "{" + l + "}"), ("fixedWidth" in r || tt && "gutter" in r || !I && "items" in r) && (s += dn(f, h, c)), "gutter" in r && (s += vn(h)), !I && "speed" in r && (x && (s += hn(d)), b && (s += mn(d))), s && (s = "#" + Yt + " > .tns-item{" + s + "}"), (i = o + u + l + s) && Mt.insertRule("@media (min-width: " + a / 16 + "em) {" + i + "}", Mt.cssRules.length)
                        }
                }(), yn();
            var _e = ft ? I ? function() {
                    var t = zt,
                        e = Wt;
                    t += ot, e -= ot, et ? (t += 1, e -= 1) : tt && (it + nt) % (tt + nt) && (e -= 1), Nt && (e < It ? It -= Q : It < t && (It += Q))
                } : function() {
                    if (Wt < It)
                        for (; zt + Q <= It;) It -= Q;
                    else if (It < zt)
                        for (; It <= Wt - Q;) It += Q
                } : function() {
                    It = Math.max(zt, Math.min(Wt, It))
                },
                Ze = I ? function() {
                    var e, n, i, a, t, r, o, u, l, s, c;
                    Jn(V, ""), x || !st ? (ti(), st && Yi(V) || ai()) : (e = V, n = Ot, i = Dt, a = kt, t = Zn(), r = st, o = ai, u = Math.min(r, 10), l = 0 <= t.indexOf("%") ? "%" : "px", t = t.replace(l, ""), s = Number(e.style[n].replace(i, "").replace(a, "").replace(l, "")), c = (t - s) / r * u, setTimeout(function t() {
                        r -= u, s += c, e.style[n] = i + s + l + a, 0 < r ? setTimeout(t, u) : o()
                    }, u)), F || Ci()
                } : function() {
                    At = [];
                    var t = {};
                    t[s] = t[c] = ai, _i(G[Pt], t), Ui(G[It], t), ei(Pt, P, z, !0), ei(It, W, P), s && c && st && Yi(V) || ai()
                };
            return {
                version: "2.9.4",
                getInfo: Ei,
                events: Qt,
                goTo: ri,
                play: function() {
                    gt && !Pe && (ci(), We = !1)
                },
                pause: function() {
                    Pe && (fi(), We = !0)
                },
                isOn: Y,
                updateSliderHeight: Fn,
                refresh: yn,
                destroy: function() {
                    if (Mt.disabled = !0, Mt.ownerNode && Mt.ownerNode.remove(), _i(m, {
                            resize: Cn
                        }), lt && _i(O, ie), xe && _i(xe, $t), Ae && _i(Ae, te), _i(V, ee), _i(V, ne), je && _i(je, {
                            click: di
                        }), gt && clearInterval(Ie), I && s) {
                        var t = {};
                        t[s] = ai, _i(V, t)
                    }
                    mt && _i(V, ae), yt && _i(V, re);
                    var r = [A, be, Me, Te, Ne, Ve];
                    for (var e in d.forEach(function(t, e) {
                            var n = "container" === t ? T : H[t];
                            if ("object" == typeof n && n) {
                                var i = !!n.previousElementSibling && n.previousElementSibling,
                                    a = n.parentNode;
                                n.outerHTML = r[e], H[t] = i ? i.nextElementSibling : a.firstElementChild
                            }
                        }), d = P = z = C = W = F = T = j = V = E = A = G = Q = q = X = $ = tt = et = nt = it = rt = ot = ut = lt = st = ct = ft = dt = Mt = Tt = N = At = Nt = Lt = Bt = St = Ht = Ot = Dt = kt = Rt = It = Pt = zt = Wt = Ft = jt = Vt = Gt = Qt = Xt = Yt = Kt = Jt = Ut = _t = Zt = $t = te = ee = ne = ie = ae = re = oe = ue = le = se = ce = fe = de = pe = he = L = vt = pt = xe = be = we = Ce = ye = ge = ht = Ae = Ne = Ee = Le = Be = Se = He = Oe = De = ke = Re = gt = xt = Fe = bt = wt = je = Ve = Ct = Ge = Ie = Pe = ze = We = qe = Ye = Ke = Qe = Je = Xe = Ue = mt = yt = null, this) "rebuild" !== e && (this[e] = null);
                    Y = !1
                },
                rebuild: function() {
                    return $i(Li(H, v))
                }
            }
        }

        function $e(t) {
            t && (vt = ht = mt = yt = lt = gt = wt = Ct = !1)
        }

        function tn() {
            for (var t = I ? It - Nt : It; t < 0;) t += Q;
            return t % Q + 1
        }

        function en(t) {
            return t = t ? Math.max(0, Math.min(ft ? Q - 1 : Q - rt, t)) : 0, I ? t + Nt : t
        }

        function nn(t) {
            for (null == t && (t = It), I && (t -= Nt); t < 0;) t += Q;
            return Math.floor(t % Q)
        }

        function an() {
            var t, e = nn();
            return t = le ? e : tt || $ ? Math.ceil((e + 1) * Le / Q - 1) : Math.floor(e / rt), !ft && I && It === Wt && (t = Le - 1), t
        }

        function rn() {
            return m.innerWidth || O.documentElement.clientWidth || O.body.clientWidth
        }

        function on(t) {
            return "top" === t ? "afterbegin" : "beforeend"
        }

        function un() {
            var t = et ? 2 * et - nt : 0;
            return function t(e) {
                if (null != e) {
                    var n, i, a = O.createElement("div");
                    return e.appendChild(a), i = (n = a.getBoundingClientRect()).right - n.left, a.remove(), i || t(e.parentNode)
                }
            }(E) - t
        }

        function ln(t) {
            if (H[t]) return !0;
            if (k)
                for (var e in k)
                    if (k[e][t]) return !0;
            return !1
        }

        function sn(t, e) {
            if (null == e && (e = X), "items" === t && tt) return Math.floor((it + nt) / (tt + nt)) || 1;
            var n = H[t];
            if (k)
                for (var i in k) e >= parseInt(i) && t in k[i] && (n = k[i][t]);
            return "slideBy" === t && "page" === n && (n = sn("items")), I || "slideBy" !== t && "items" !== t || (n = Math.floor(n)), n
        }

        function cn(t, e, n, i, a) {
            var r = "";
            if (void 0 !== t) {
                var o = t;
                e && (o -= e), r = F ? "margin: 0 " + o + "px 0 " + t + "px;" : "margin: " + t + "px 0 " + o + "px 0;"
            } else if (e && !n) {
                var u = "-" + e + "px";
                r = "margin: 0 " + (F ? u + " 0 0" : "0 " + u + " 0") + ";"
            }
            return !I && a && x && i && (r += hn(i)), r
        }

        function fn(t, e, n) {
            return t ? (t + e) * Lt + "px" : y ? y + "(" + 100 * Lt + "% / " + n + ")" : 100 * Lt / n + "%"
        }

        function dn(t, e, n) {
            var i;
            if (t) i = t + e + "px";
            else {
                I || (n = Math.floor(n));
                var a = I ? Lt : n;
                i = y ? y + "(100% / " + a + ")" : 100 / a + "%"
            }
            return i = "width:" + i, "inner" !== R ? i + ";" : i + " !important;"
        }

        function vn(t) {
            var e = "";
            !1 !== t && (e = (F ? "padding-" : "margin-") + (F ? "right" : "bottom") + ": " + t + "px;");
            return e
        }

        function pn(t, e) {
            var n = t.substring(0, t.length - e).toLowerCase();
            return n && (n = "-" + n + "-"), n
        }

        function hn(t) {
            return pn(x, 18) + "transition-duration:" + t / 1e3 + "s;"
        }

        function mn(t) {
            return pn(b, 17) + "animation-duration:" + t / 1e3 + "s;"
        }

        function yn() {
            if (ln("autoHeight") || $ || !F) {
                var t = V.querySelectorAll("img");
                Ii(t, function(t) {
                    var e = t.src;
                    Tt || (e && e.indexOf("data:image") < 0 ? (t.src = "", Ui(t, he), zi(t, "loading"), t.src = e) : kn(t))
                }), Ai(function() {
                    zn(Gi(t), function() {
                        L = !0
                    })
                }), ln("autoHeight") && (t = In(It, Math.min(It + rt - 1, Lt - 1))), Tt ? gn() : Ai(function() {
                    zn(Gi(t), gn)
                })
            } else I && $n(), bn(), wn()
        }

        function gn() {
            if ($ && 1 < Q) {
                var i = ft ? It : Q - 1;
                ! function t() {
                    var e = G[i].getBoundingClientRect().left,
                        n = G[i - 1].getBoundingClientRect().right;
                    Math.abs(e - n) <= 1 ? xn() : setTimeout(function() {
                        t()
                    }, 16)
                }()
            } else xn()
        }

        function xn() {
            F && !$ || (jn(), $ ? (St = _n(), Ut && (_t = Tn()), Wt = Rt(), $e(Kt || _t)) : Ci()), I && $n(), bn(), wn()
        }

        function bn() {
            if (Vn(), T.insertAdjacentHTML("afterbegin", '<div class="tns-liveregion tns-visually-hidden" aria-live="polite" aria-atomic="true">slide <span class="current">' + Hn() + "</span>  of " + Q + "</div>"), B = T.querySelector(".tns-liveregion .current"), se) {
                var t = gt ? "stop" : "start";
                je ? ji(je, {
                    "data-action": t
                }) : H.autoplayButtonOutput && (T.insertAdjacentHTML(on(H.autoplayPosition), '<button type="button" data-action="' + t + '">' + Ge[0] + t + Ge[1] + bt[0] + "</button>"), je = T.querySelector("[data-action]")), je && Ui(je, {
                    click: di
                }), gt && (ci(), wt && Ui(V, ee), Ct && Ui(V, ne))
            }
            if (ue) {
                if (Ae) ji(Ae, {
                    "aria-label": "Carousel Pagination"
                }), Ii(Ee = Ae.children, function(t, e) {
                    ji(t, {
                        "data-nav": e,
                        tabindex: "-1",
                        "aria-label": ke + (e + 1),
                        "aria-controls": Yt
                    })
                });
                else {
                    for (var e = "", n = le ? "" : 'style="display:none"', i = 0; i < Q; i++) e += '<button type="button" data-nav="' + i + '" tabindex="-1" aria-controls="' + Yt + '" ' + n + ' aria-label="' + ke + (i + 1) + '"></button>';
                    e = '<div class="tns-nav" aria-label="Carousel Pagination">' + e + "</div>", T.insertAdjacentHTML(on(H.navPosition), e), Ae = T.querySelector(".tns-nav"), Ee = Ae.children
                }
                if (Ti(), x) {
                    var a = x.substring(0, x.length - 18).toLowerCase(),
                        r = "transition: all " + st / 1e3 + "s";
                    a && (r = "-" + a + "-" + r), ki(Mt, "[aria-controls^=" + Yt + "-item]", r, Ri(Mt))
                }
                ji(Ee[He], {
                    "aria-label": ke + (He + 1) + Re
                }), Vi(Ee[He], "tabindex"), zi(Ee[He], De), Ui(Ae, te)
            }
            oe && (xe || we && Ce || (T.insertAdjacentHTML(on(H.controlsPosition), '<div class="tns-controls" aria-label="Carousel Navigation" tabindex="0"><button type="button" data-controls="prev" tabindex="-1" aria-controls="' + Yt + '">' + pt[0] + '</button><button type="button" data-controls="next" tabindex="-1" aria-controls="' + Yt + '">' + pt[1] + "</button></div>"), xe = T.querySelector(".tns-controls")), we && Ce || (we = xe.children[0], Ce = xe.children[1]), H.controlsContainer && ji(xe, {
                "aria-label": "Carousel Navigation",
                tabindex: "0"
            }), (H.controlsContainer || H.prevButton && H.nextButton) && ji([we, Ce], {
                "aria-controls": Yt,
                tabindex: "-1"
            }), (H.controlsContainer || H.prevButton && H.nextButton) && (ji(we, {
                "data-controls": "prev"
            }), ji(Ce, {
                "data-controls": "next"
            })), ye = Qn(we), ge = Qn(Ce), Kn(), xe ? Ui(xe, $t) : (Ui(we, $t), Ui(Ce, $t))), An()
        }

        function wn() {
            if (I && s) {
                var t = {};
                t[s] = ai, Ui(V, t)
            }
            mt && Ui(V, ae, H.preventScrollOnTouch), yt && Ui(V, re), lt && Ui(O, ie), "inner" === R ? Qt.on("outerResized", function() {
                Mn(), Qt.emit("innerLoaded", Ei())
            }) : (k || tt || $ || dt || !F) && Ui(m, {
                resize: Cn
            }), dt && ("outer" === R ? Qt.on("innerLoaded", Pn) : Kt || Pn()), Dn(), Kt ? Bn() : _t && Ln(), Qt.on("indexChanged", Wn), "inner" === R && Qt.emit("innerLoaded", Ei()), "function" == typeof Gt && Gt(Ei()), Y = !0
        }

        function Cn(t) {
            Ai(function() {
                Mn(pi(t))
            })
        }

        function Mn(t) {
            if (Y) {
                "outer" === R && Qt.emit("outerResized", Ei(t)), X = rn();
                var e, n = q,
                    i = !1;
                k && (En(), (e = n !== q) && Qt.emit("newBreakpointStart", Ei(t)));
                var a, r, o, u, l = rt,
                    s = Kt,
                    c = _t,
                    f = lt,
                    d = vt,
                    v = ht,
                    p = mt,
                    h = yt,
                    m = gt,
                    y = wt,
                    g = Ct,
                    x = It;
                if (e) {
                    var b = tt,
                        w = dt,
                        C = pt,
                        M = at,
                        T = bt;
                    if (!D) var E = nt,
                        A = et
                }
                if (lt = sn("arrowKeys"), vt = sn("controls"), ht = sn("nav"), mt = sn("touch"), at = sn("center"), yt = sn("mouseDrag"), gt = sn("autoplay"), wt = sn("autoplayHoverPause"), Ct = sn("autoplayResetOnVisibility"), e && (Kt = sn("disable"), tt = sn("fixedWidth"), st = sn("speed"), dt = sn("autoHeight"), pt = sn("controlsText"), bt = sn("autoplayText"), xt = sn("autoplayTimeout"), D || (et = sn("edgePadding"), nt = sn("gutter"))), $e(Kt), it = un(), F && !$ || Kt || (jn(), F || (Ci(), i = !0)), (tt || $) && (St = _n(), Wt = Rt()), (e || tt) && (rt = sn("items"), ot = sn("slideBy"), (r = rt !== l) && (tt || $ || (Wt = Rt()), _e())), e && Kt !== s && (Kt ? Bn() : function() {
                        if (!Jt) return;
                        if (Mt.disabled = !1, V.className += Xt, $n(), ft)
                            for (var t = Nt; t--;) I && Xi(G[t]), Xi(G[Lt - t - 1]);
                        if (!I)
                            for (var e = It, n = It + Q; e < n; e++) {
                                var i = G[e],
                                    a = e < It + rt ? P : W;
                                i.style.left = 100 * (e - It) / rt + "%", zi(i, a)
                            }
                        Nn(), Jt = !1
                    }()), Ut && (e || tt || $) && (_t = Tn()) !== c && (_t ? (ti(Zn(en(0))), Ln()) : (! function() {
                        if (!Zt) return;
                        et && D && (j.style.margin = "");
                        if (Nt)
                            for (var t = "tns-transparent", e = Nt; e--;) I && Wi(G[e], t), Wi(G[Lt - e - 1], t);
                        Nn(), Zt = !1
                    }(), i = !0)), $e(Kt || _t), gt || (wt = Ct = !1), lt !== f && (lt ? Ui(O, ie) : _i(O, ie)), vt !== d && (vt ? xe ? Xi(xe) : (we && Xi(we), Ce && Xi(Ce)) : xe ? Qi(xe) : (we && Qi(we), Ce && Qi(Ce))), ht !== v && (ht ? (Xi(Ae), Ti()) : Qi(Ae)), mt !== p && (mt ? Ui(V, ae, H.preventScrollOnTouch) : _i(V, ae)), yt !== h && (yt ? Ui(V, re) : _i(V, re)), gt !== m && (gt ? (je && Xi(je), Pe || We || ci()) : (je && Qi(je), Pe && fi())), wt !== y && (wt ? Ui(V, ee) : _i(V, ee)), Ct !== g && (Ct ? Ui(O, ne) : _i(O, ne)), e) {
                    if (tt === b && at === M || (i = !0), dt !== w && (dt || (j.style.height = "")), vt && pt !== C && (we.innerHTML = pt[0], Ce.innerHTML = pt[1]), je && bt !== T) {
                        var N = gt ? 1 : 0,
                            L = je.innerHTML,
                            B = L.length - T[N].length;
                        L.substring(B) === T[N] && (je.innerHTML = L.substring(0, B) + bt[N])
                    }
                } else at && (tt || $) && (i = !0);
                if ((r || tt && !$) && (Le = Mi(), Ti()), (a = It !== x) ? (Qt.emit("indexChanged", Ei()), i = !0) : r ? a || Wn() : (tt || $) && (Dn(), Vn(), Sn()), r && !I && function() {
                        for (var t = It + Math.min(Q, rt), e = Lt; e--;) {
                            var n = G[e];
                            It <= e && e < t ? (zi(n, "tns-moving"), n.style.left = 100 * (e - It) / rt + "%", zi(n, P), Wi(n, W)) : n.style.left && (n.style.left = "", zi(n, W), Wi(n, P)), Wi(n, z)
                        }
                        setTimeout(function() {
                            Ii(G, function(t) {
                                Wi(t, "tns-moving")
                            })
                        }, 300)
                    }(), !Kt && !_t) {
                    if (e && !D && (et === A && nt === E || (j.style.cssText = cn(et, nt, tt, st, dt)), F)) {
                        I && (V.style.width = fn(tt, nt, rt));
                        var S = dn(tt, nt, rt) + vn(nt);
                        u = Ri(o = Mt) - 1, "deleteRule" in o ? o.deleteRule(u) : o.removeRule(u), ki(Mt, "#" + Yt + " > .tns-item", S, Ri(Mt))
                    }
                    dt && Pn(), i && ($n(), Pt = It)
                }
                e && Qt.emit("newBreakpointEnd", Ei(t))
            }
        }

        function Tn() {
            if (!tt && !$) return Q <= (at ? rt - (rt - 1) / 2 : rt);
            var t = tt ? (tt + nt) * Q : N[Q],
                e = et ? it + 2 * et : it + nt;
            return at && (e -= tt ? (it - tt) / 2 : (it - (N[It + 1] - N[It] - nt)) / 2), t <= e
        }

        function En() {
            for (var t in q = 0, k)(t = parseInt(t)) <= X && (q = t)
        }

        function An() {
            !gt && je && Qi(je), !ht && Ae && Qi(Ae), vt || (xe ? Qi(xe) : (we && Qi(we), Ce && Qi(Ce)))
        }

        function Nn() {
            gt && je && Xi(je), ht && Ae && Xi(Ae), vt && (xe ? Xi(xe) : (we && Xi(we), Ce && Xi(Ce)))
        }

        function Ln() {
            if (!Zt) {
                if (et && (j.style.margin = "0px"), Nt)
                    for (var t = "tns-transparent", e = Nt; e--;) I && zi(G[e], t), zi(G[Lt - e - 1], t);
                An(), Zt = !0
            }
        }

        function Bn() {
            if (!Jt) {
                if (Mt.disabled = !0, V.className = V.className.replace(Xt.substring(1), ""), Vi(V, ["style"]), ft)
                    for (var t = Nt; t--;) I && Qi(G[t]), Qi(G[Lt - t - 1]);
                if (F && I || Vi(j, ["style"]), !I)
                    for (var e = It, n = It + Q; e < n; e++) {
                        var i = G[e];
                        Vi(i, ["style"]), Wi(i, P), Wi(i, W)
                    }
                An(), Jt = !0
            }
        }

        function Sn() {
            var t = Hn();
            B.innerHTML !== t && (B.innerHTML = t)
        }

        function Hn() {
            var t = On(),
                e = t[0] + 1,
                n = t[1] + 1;
            return e === n ? e + "" : e + " to " + n
        }

        function On(t) {
            null == t && (t = Zn());
            var n, i, a, r = It;
            if (at || et ? ($ || tt) && (i = -(parseFloat(t) + et), a = i + it + 2 * et) : $ && (i = N[It], a = i + it), $) N.forEach(function(t, e) {
                e < Lt && ((at || et) && t <= i + .5 && (r = e), .5 <= a - t && (n = e))
            });
            else {
                if (tt) {
                    var e = tt + nt;
                    at || et ? (r = Math.floor(i / e), n = Math.ceil(a / e - 1)) : n = r + Math.ceil(it / e) - 1
                } else if (at || et) {
                    var o = rt - 1;
                    if (at ? (r -= o / 2, n = It + o / 2) : n = It + o, et) {
                        var u = et * rt / it;
                        r -= u, n += u
                    }
                    r = Math.floor(r), n = Math.ceil(n)
                } else n = r + rt - 1;
                r = Math.max(r, 0), n = Math.min(n, Lt - 1)
            }
            return [r, n]
        }

        function Dn() {
            if (Tt && !Kt) {
                var t = On();
                t.push(Et), In.apply(null, t).forEach(function(t) {
                    if (!Pi(t, pe)) {
                        var e = {};
                        e[s] = function(t) {
                            t.stopPropagation()
                        }, Ui(t, e), Ui(t, he), t.src = Fi(t, "data-src");
                        var n = Fi(t, "data-srcset");
                        n && (t.srcset = n), zi(t, "loading")
                    }
                })
            }
        }

        function kn(t) {
            zi(t, "loaded"), Rn(t)
        }

        function Rn(t) {
            zi(t, pe), Wi(t, "loading"), _i(t, he)
        }

        function In(t, e, n) {
            var i = [];
            for (n || (n = "img"); t <= e;) Ii(G[t].querySelectorAll(n), function(t) {
                i.push(t)
            }), t++;
            return i
        }

        function Pn() {
            var t = In.apply(null, On());
            Ai(function() {
                zn(t, Fn)
            })
        }

        function zn(n, t) {
            return L ? t() : (n.forEach(function(t, e) {
                !Tt && t.complete && Rn(t), Pi(t, pe) && n.splice(e, 1)
            }), n.length ? void Ai(function() {
                zn(n, t)
            }) : t())
        }

        function Wn() {
            Dn(), Vn(), Sn(), Kn(),
                function() {
                    if (ht && (He = 0 <= Se ? Se : an(), Se = -1, He !== Oe)) {
                        var t = Ee[Oe],
                            e = Ee[He];
                        ji(t, {
                            tabindex: "-1",
                            "aria-label": ke + (Oe + 1)
                        }), Wi(t, De), ji(e, {
                            "aria-label": ke + (He + 1) + Re
                        }), Vi(e, "tabindex"), zi(e, De), Oe = He
                    }
                }()
        }

        function qn(t, e) {
            for (var n = [], i = t, a = Math.min(t + e, Lt); i < a; i++) n.push(G[i].offsetHeight);
            return Math.max.apply(null, n)
        }

        function Fn() {
            var t = dt ? qn(It, rt) : qn(Nt, Q),
                e = M || j;
            e.style.height !== t && (e.style.height = t + "px")
        }

        function jn() {
            N = [0];
            var n = F ? "left" : "top",
                i = F ? "right" : "bottom",
                a = G[0].getBoundingClientRect()[n];
            Ii(G, function(t, e) {
                e && N.push(t.getBoundingClientRect()[n] - a), e === Lt - 1 && N.push(t.getBoundingClientRect()[i] - a)
            })
        }

        function Vn() {
            var t = On(),
                n = t[0],
                i = t[1];
            Ii(G, function(t, e) {
                n <= e && e <= i ? qi(t, "aria-hidden") && (Vi(t, ["aria-hidden", "tabindex"]), zi(t, de)) : qi(t, "aria-hidden") || (ji(t, {
                    "aria-hidden": "true",
                    tabindex: "-1"
                }), Wi(t, de))
            })
        }

        function Gn(t) {
            return t.nodeName.toLowerCase()
        }

        function Qn(t) {
            return "button" === Gn(t)
        }

        function Xn(t) {
            return "true" === t.getAttribute("aria-disabled")
        }

        function Yn(t, e, n) {
            t ? e.disabled = n : e.setAttribute("aria-disabled", n.toString())
        }

        function Kn() {
            if (vt && !ct && !ft) {
                var t = ye ? we.disabled : Xn(we),
                    e = ge ? Ce.disabled : Xn(Ce),
                    n = It <= zt,
                    i = !ct && Wt <= It;
                n && !t && Yn(ye, we, !0), !n && t && Yn(ye, we, !1), i && !e && Yn(ge, Ce, !0), !i && e && Yn(ge, Ce, !1)
            }
        }

        function Jn(t, e) {
            x && (t.style[x] = e)
        }

        function Un(t) {
            return null == t && (t = It), $ ? (it - (et ? nt : 0) - (N[t + 1] - N[t] - nt)) / 2 : tt ? (it - tt) / 2 : (rt - 1) / 2
        }

        function _n() {
            var t = it + (et ? nt : 0) - (tt ? (tt + nt) * Lt : N[Lt]);
            return at && !ft && (t = tt ? -(tt + nt) * (Lt - 1) - Un() : Un(Lt - 1) - N[Lt - 1]), 0 < t && (t = 0), t
        }

        function Zn(t) {
            var e;
            if (null == t && (t = It), F && !$)
                if (tt) e = -(tt + nt) * t, at && (e += Un());
                else {
                    var n = r ? Lt : rt;
                    at && (t -= Un()), e = 100 * -t / n
                } else e = -N[t], at && $ && (e += Un());
            return Bt && (e = Math.max(e, St)), e += !F || $ || tt ? "px" : "%"
        }

        function $n(t) {
            Jn(V, "0s"), ti(t)
        }

        function ti(t) {
            null == t && (t = Zn()), V.style[Ot] = Dt + t + kt
        }

        function ei(t, e, n, i) {
            var a = t + rt;
            ft || (a = Math.min(a, Lt));
            for (var r = t; r < a; r++) {
                var o = G[r];
                i || (o.style.left = 100 * (r - It) / rt + "%"), C && u && (o.style[u] = o.style[l] = C * (r - t) / 1e3 + "s"), Wi(o, e), zi(o, n), i && At.push(o)
            }
        }

        function ni(t, e) {
            Ht && _e(), (It !== Pt || e) && (Qt.emit("indexChanged", Ei()), Qt.emit("transitionStart", Ei()), dt && Pn(), Pe && t && 0 <= ["click", "keydown"].indexOf(t.type) && fi(), Vt = !0, Ze())
        }

        function ii(t) {
            return t.toLowerCase().replace(/-/g, "")
        }

        function ai(t) {
            if (I || Vt) {
                if (Qt.emit("transitionEnd", Ei(t)), !I && 0 < At.length)
                    for (var e = 0; e < At.length; e++) {
                        var n = At[e];
                        n.style.left = "", l && u && (n.style[l] = "", n.style[u] = ""), Wi(n, z), zi(n, W)
                    }
                if (!t || !I && t.target.parentNode === V || t.target === V && ii(t.propertyName) === ii(Ot)) {
                    if (!Ht) {
                        var i = It;
                        _e(), It !== i && (Qt.emit("indexChanged", Ei()), $n())
                    }
                    "inner" === R && Qt.emit("innerLoaded", Ei()), Vt = !1, Pt = It
                }
            }
        }

        function ri(t, e) {
            if (!_t)
                if ("prev" === t) oi(e, -1);
                else if ("next" === t) oi(e, 1);
            else {
                if (Vt) {
                    if (qt) return;
                    ai()
                }
                var n = nn(),
                    i = 0;
                if ("first" === t ? i = -n : "last" === t ? i = I ? Q - rt - n : Q - 1 - n : ("number" != typeof t && (t = parseInt(t)), isNaN(t) || (e || (t = Math.max(0, Math.min(Q - 1, t))), i = t - n)), !I && i && Math.abs(i) < rt) {
                    var a = 0 < i ? 1 : -1;
                    i += zt <= It + i - Q ? Q * a : 2 * Q * a * -1
                }
                It += i, I && ft && (It < zt && (It += Q), Wt < It && (It -= Q)), nn(It) !== nn(Pt) && ni(e)
            }
        }

        function oi(t, e) {
            if (Vt) {
                if (qt) return;
                ai()
            }
            var n;
            if (!e) {
                for (var i = hi(t = pi(t)); i !== xe && [we, Ce].indexOf(i) < 0;) i = i.parentNode;
                var a = [we, Ce].indexOf(i);
                0 <= a && (n = !0, e = 0 === a ? -1 : 1)
            }
            if (ct) {
                if (It === zt && -1 === e) return void ri("last", t);
                if (It === Wt && 1 === e) return void ri("first", t)
            }
            e && (It += ot * e, $ && (It = Math.floor(It)), ni(n || t && "keydown" === t.type ? t : null))
        }

        function ui() {
            Ie = setInterval(function() {
                oi(null, Fe)
            }, xt), Pe = !0
        }

        function li() {
            clearInterval(Ie), Pe = !1
        }

        function si(t, e) {
            ji(je, {
                "data-action": t
            }), je.innerHTML = Ge[0] + t + Ge[1] + e
        }

        function ci() {
            ui(), je && si("stop", bt[1])
        }

        function fi() {
            li(), je && si("start", bt[0])
        }

        function di() {
            Pe ? (fi(), We = !0) : (ci(), We = !1)
        }

        function vi(t) {
            t.focus()
        }

        function pi(t) {
            return mi(t = t || m.event) ? t.changedTouches[0] : t
        }

        function hi(t) {
            return t.target || m.event.srcElement
        }

        function mi(t) {
            return 0 <= t.type.indexOf("touch")
        }

        function yi(t) {
            t.preventDefault ? t.preventDefault() : t.returnValue = !1
        }

        function gi() {
            return a = Ke.y - Ye.y, r = Ke.x - Ye.x, t = Math.atan2(a, r) * (180 / Math.PI), e = Ft, n = !1, i = Math.abs(90 - Math.abs(t)), 90 - e <= i ? n = "horizontal" : i <= e && (n = "vertical"), n === H.axis;
            var t, e, n, i, a, r
        }

        function xi(t) {
            if (Vt) {
                if (qt) return;
                ai()
            }
            gt && Pe && li(), Je = !0, Xe && (Ni(Xe), Xe = null);
            var e = pi(t);
            Qt.emit(mi(t) ? "touchStart" : "dragStart", Ei(t)), !mi(t) && 0 <= ["img", "a"].indexOf(Gn(hi(t))) && yi(t), Ke.x = Ye.x = e.clientX, Ke.y = Ye.y = e.clientY, I && (Qe = parseFloat(V.style[Ot].replace(Dt, "")), Jn(V, "0s"))
        }

        function bi(t) {
            if (Je) {
                var e = pi(t);
                Ke.x = e.clientX, Ke.y = e.clientY, I ? Xe || (Xe = Ai(function() {
                    ! function t(e) {
                        if (!jt) return void(Je = !1);
                        Ni(Xe);
                        Je && (Xe = Ai(function() {
                            t(e)
                        }));
                        "?" === jt && (jt = gi());
                        if (jt) {
                            !me && mi(e) && (me = !0);
                            try {
                                e.type && Qt.emit(mi(e) ? "touchMove" : "dragMove", Ei(e))
                            } catch (t) {}
                            var n = Qe,
                                i = Ue(Ke, Ye);
                            if (!F || tt || $) n += i, n += "px";
                            else {
                                var a = r ? i * rt * 100 / ((it + nt) * Lt) : 100 * i / (it + nt);
                                n += a, n += "%"
                            }
                            V.style[Ot] = Dt + n + kt
                        }
                    }(t)
                })) : ("?" === jt && (jt = gi()), jt && (me = !0)), ("boolean" != typeof t.cancelable || t.cancelable) && me && t.preventDefault()
            }
        }

        function wi(i) {
            if (Je) {
                Xe && (Ni(Xe), Xe = null), I && Jn(V, ""), Je = !1;
                var t = pi(i);
                Ke.x = t.clientX, Ke.y = t.clientY;
                var a = Ue(Ke, Ye);
                if (Math.abs(a)) {
                    if (!mi(i)) {
                        var n = hi(i);
                        Ui(n, {
                            click: function t(e) {
                                yi(e), _i(n, {
                                    click: t
                                })
                            }
                        })
                    }
                    I ? Xe = Ai(function() {
                        if (F && !$) {
                            var t = -a * rt / (it + nt);
                            t = 0 < a ? Math.floor(t) : Math.ceil(t), It += t
                        } else {
                            var e = -(Qe + a);
                            if (e <= 0) It = zt;
                            else if (e >= N[Lt - 1]) It = Wt;
                            else
                                for (var n = 0; n < Lt && e >= N[n];) e > N[It = n] && a < 0 && (It += 1), n++
                        }
                        ni(i, a), Qt.emit(mi(i) ? "touchEnd" : "dragEnd", Ei(i))
                    }) : jt && oi(i, 0 < a ? -1 : 1)
                }
            }
            "auto" === H.preventScrollOnTouch && (me = !1), Ft && (jt = "?"), gt && !Pe && ui()
        }

        function Ci() {
            (M || j).style.height = N[It + rt] - N[It] + "px"
        }

        function Mi() {
            var t = tt ? (tt + nt) * Q / it : Q / rt;
            return Math.min(Math.ceil(t), Q)
        }

        function Ti() {
            if (ht && !le && Le !== Be) {
                var t = Be,
                    e = Le,
                    n = Xi;
                for (Le < Be && (t = Le, e = Be, n = Qi); t < e;) n(Ee[t]), t++;
                Be = Le
            }
        }

        function Ei(t) {
            return {
                container: V,
                slideItems: G,
                navContainer: Ae,
                navItems: Ee,
                controlsContainer: xe,
                hasControls: oe,
                prevButton: we,
                nextButton: Ce,
                items: rt,
                slideBy: ot,
                cloneCount: Nt,
                slideCount: Q,
                slideCountNew: Lt,
                index: It,
                indexCached: Pt,
                displayIndex: tn(),
                navCurrentIndex: He,
                navCurrentIndexCached: Oe,
                pages: Le,
                pagesCached: Be,
                sheet: Mt,
                isOn: Y,
                event: t || {}
            }
        }
        f && console.warn("No slides found in", H.container)
    };
    return $i
}();
//# sourceMappingURL=../sourcemaps/tiny-slider.js.map