! function(e, t) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define(t) : e.Sweetalert2 = t()
}(this, function() {
    "use strict";

    function e() {
        if (void 0 === arguments[0]) return console.error("SweetAlert2 expects at least 1 attribute!"), !1;
        var e = l({}, U);
        switch (typeof arguments[0]) {
            case "string":
                e.title = arguments[0], e.text = arguments[1] || "", e.type = arguments[2] || "";
                break;
            case "object":
                l(e, arguments[0]), e.extraParams = arguments[0].extraParams, "email" === e.input && null === e.inputValidator && (e.inputValidator = function(e) {
                    return new Promise(function(t, n) {
                        var o = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                        o.test(e) ? t() : n("Invalid email address")
                    })
                });
                break;
            default:
                return console.error('SweetAlert2: Unexpected type of argument! Expected "string" or "object", got ' + typeof arguments[0]), !1
        }
        W(e);
        var n = f();
        return new Promise(function(o, i) {
            function a(t, n) {
                for (var o = C(e.focusCancel), r = 0; r < o.length; r++) {
                    t += n, t === o.length ? t = 0 : -1 === t && (t = o.length - 1);
                    var i = o[t];
                    if (q(i)) return i.focus()
                }
            }

            function s(n) {
                var o = n || window.event,
                    r = o.keyCode || o.which;
                if (-1 !== [9, 13, 32, 27].indexOf(r)) {
                    for (var s = o.target || o.srcElement, l = C(e.focusCancel), c = -1, u = 0; u < l.length; u++)
                        if (s === l[u]) {
                            c = u;
                            break
                        }
                    9 === r ? (o.shiftKey ? a(c, -1) : a(c, 1), H(o)) : 13 === r || 32 === r ? -1 === c && (e.focusCancel ? N(M, o) : N(L, o)) : 27 === r && e.allowEscapeKey === !0 && (t.closeModal(e.onClose), i("esc"))
                }
            }
            e.timer && (n.timeout = setTimeout(function() {
                t.closeModal(e.onClose), i("timer")
            }, e.timer));
            var l = function() {
                    switch (e.input) {
                        case "select":
                            return B(n, r.select);
                        case "radio":
                            return n.querySelector("." + r.radio + " input:checked") || n.querySelector("." + r.radio + " input:first-child");
                        case "checkbox":
                            return n.querySelector("#" + r.checkbox);
                        case "textarea":
                            return B(n, r.textarea);
                        default:
                            return B(n, r.input)
                    }
                },
                u = function() {
                    var t = l();
                    switch (e.input) {
                        case "checkbox":
                            return t.checked ? 1 : 0;
                        case "radio":
                            return t.checked ? t.value : null;
                        case "file":
                            return t.files.length ? t.files[0] : null;
                        default:
                            return e.inputAutoTrim ? t.value.trim() : t.value
                    }
                };
            e.input && setTimeout(function() {
                var e = l();
                e && x(e)
            }, 0);
            var p, f = function(n) {
                    e.showLoaderOnConfirm && t.showLoading(), e.preConfirm ? e.preConfirm(n, e.extraParams).then(function(r) {
                        t.closeModal(e.onClose), o(r || n)
                    }, function(e) {
                        t.hideLoading(), e && t.showValidationError(e)
                    }) : (t.closeModal(e.onClose), o(n))
                },
                h = function(n) {
                    var o = n || window.event,
                        r = o.target || o.srcElement,
                        a = g(),
                        s = b(),
                        l = a === r || a.contains(r),
                        d = s === r || s.contains(r);
                    switch (o.type) {
                        case "mouseover":
                        case "mouseup":
                            e.buttonsStyling && (l ? a.style.backgroundColor = c(e.confirmButtonColor, -.1) : d && (s.style.backgroundColor = c(e.cancelButtonColor, -.1)));
                            break;
                        case "mouseout":
                            e.buttonsStyling && (l ? a.style.backgroundColor = e.confirmButtonColor : d && (s.style.backgroundColor = e.cancelButtonColor));
                            break;
                        case "mousedown":
                            e.buttonsStyling && (l ? a.style.backgroundColor = c(e.confirmButtonColor, -.2) : d && (s.style.backgroundColor = c(e.cancelButtonColor, -.2)));
                            break;
                        case "click":
                            if (l && t.isVisible())
                                if (e.input) {
                                    var p = u();
                                    e.inputValidator ? (t.disableInput(), e.inputValidator(p, e.extraParams).then(function() {
                                        t.enableInput(), f(p)
                                    }, function(e) {
                                        t.enableInput(), e && t.showValidationError(e)
                                    })) : f(p)
                                } else f(!0);
                            else d && t.isVisible() && (t.closeModal(e.onClose), i("cancel"))
                    }
                },
                k = n.querySelectorAll("button");
            for (p = 0; p < k.length; p++) k[p].onclick = h, k[p].onmouseover = h, k[p].onmouseout = h, k[p].onmousedown = h;
            w().onclick = function() {
                t.closeModal(e.onClose), i("close")
            }, m().onclick = function() {
                e.allowOutsideClick && (t.closeModal(e.onClose), i("overlay"))
            };
            var L = g(),
                M = b();
            e.reverseButtons ? L.parentNode.insertBefore(M, L) : L.parentNode.insertBefore(L, M), d.previousWindowKeyDown = window.onkeydown, window.onkeydown = s, e.buttonsStyling && (L.style.borderLeftColor = e.confirmButtonColor, L.style.borderRightColor = e.confirmButtonColor), t.showLoading = t.enableLoading = function() {
                A(v()), A(L, "inline-block"), S(L, "loading"), S(n, "loading"), L.disabled = !0, M.disabled = !0
            }, t.hideLoading = t.disableLoading = function() {
                e.showConfirmButton || (P(L), e.showCancelButton || P(v())), E(L, "loading"), E(n, "loading"), L.disabled = !1, M.disabled = !1
            }, t.enableButtons = function() {
                L.disabled = !1, M.disabled = !1
            }, t.disableButtons = function() {
                L.disabled = !0, M.disabled = !0
            }, t.enableConfirmButton = function() {
                L.disabled = !1
            }, t.disableConfirmButton = function() {
                L.disabled = !0
            }, t.enableInput = function() {
                var e = l();
                if ("radio" === e.type)
                    for (var t = e.parentNode.parentNode, n = t.querySelectorAll("input"), o = 0; o < n.length; o++) n[o].disabled = !1;
                else e.disabled = !1
            }, t.disableInput = function() {
                var e = l();
                if ("radio" === e.type)
                    for (var t = e.parentNode.parentNode, n = t.querySelectorAll("input"), o = 0; o < n.length; o++) n[o].disabled = !0;
                else e.disabled = !0
            }, t.showValidationError = function(e) {
                var t = n.querySelector("." + r.validationerror);
                t.innerHTML = e, A(t);
                var o = l();
                x(o), S(o, "error")
            }, t.resetValidationError = function() {
                var e = n.querySelector("." + r.validationerror);
                P(e);
                var t = l();
                t && E(t, "error")
            }, t.getProgressSteps = function() {
                return e.progressSteps
            }, t.setProgressSteps = function(t) {
                e.progressSteps = t, W(e)
            }, t.showProgressSteps = function() {
                A(y())
            }, t.hideProgressSteps = function() {
                P(y())
            }, t.enableButtons(), t.hideLoading(), t.resetValidationError();
            var T, O = ["input", "select", "radio", "checkbox", "textarea"];
            for (p = 0; p < O.length; p++) {
                var V = r[O[p]];
                for (T = B(n, V); T.attributes.length > 0;) T.removeAttribute(T.attributes[0].name);
                for (var D in e.inputAttributes) T.setAttribute(D, e.inputAttributes[D]);
                T.className = V, e.inputClass && S(T, e.inputClass), P(T)
            }
            var I;
            switch (e.input) {
                case "text":
                case "email":
                case "password":
                case "file":
                case "number":
                case "tel":
                case "range":
                    T = B(n, r.input), T.value = e.inputValue, T.placeholder = e.inputPlaceholder, T.type = e.input, A(T);
                    break;
                case "select":
                    var j = B(n, r.select);
                    if (j.innerHTML = "", e.inputPlaceholder) {
                        var K = document.createElement("option");
                        K.innerHTML = e.inputPlaceholder, K.value = "", K.disabled = !0, K.selected = !0, j.appendChild(K)
                    }
                    I = function(t) {
                        for (var n in t) {
                            var o = document.createElement("option");
                            o.value = n, o.innerHTML = t[n], e.inputValue === n && (o.selected = !0), j.appendChild(o)
                        }
                        A(j), j.focus()
                    };
                    break;
                case "radio":
                    var U = B(n, r.radio);
                    U.innerHTML = "", I = function(t) {
                        for (var n in t) {
                            var o = 1,
                                i = document.createElement("input"),
                                a = document.createElement("label"),
                                s = document.createElement("span");
                            i.type = "radio", i.name = r.radio, i.value = n, i.id = r.radio + "-" + o++, e.inputValue === n && (i.checked = !0), s.innerHTML = t[n], a.appendChild(i), a.appendChild(s), a["for"] = i.id, U.appendChild(a)
                        }
                        A(U);
                        var l = U.querySelectorAll("input");
                        l.length && l[0].focus()
                    };
                    break;
                case "checkbox":
                    var Z = B(n, r.checkbox),
                        $ = n.querySelector("#" + r.checkbox);
                    $.value = 1, $.checked = Boolean(e.inputValue);
                    var F = Z.getElementsByTagName("span");
                    F.length && Z.removeChild(F[0]), F = document.createElement("span"), F.innerHTML = e.inputPlaceholder, Z.appendChild(F), A(Z);
                    break;
                case "textarea":
                    var J = B(n, r.textarea);
                    J.value = e.inputValue, J.placeholder = e.inputPlaceholder, A(J);
                    break;
                case null:
                    break;
                default:
                    console.error('SweetAlert2: Unexpected type of input! Expected "text" or "email" or "password", "select", "checkbox", "textarea" or "file", got "' + e.input + '"')
            }
            "select" !== e.input && "radio" !== e.input || (e.inputOptions instanceof Promise ? (t.showLoading(), e.inputOptions.then(function(e) {
                t.hideLoading(), I(e)
            })) : "object" == typeof e.inputOptions ? I(e.inputOptions) : console.error("SweetAlert2: Unexpected type of inputOptions! Expected object or Promise, got " + typeof e.inputOptions)), R(), z(e.animation, e.onOpen), a(-1, 1)
        })
    }

    function t() {
        var n = arguments,
            o = f();
        return null === o && (t.init(), o = f()), t.isVisible() && t.close(), e.apply(this, n)
    }
    var n = "swal2-",
        o = function(e) {
            var t = {};
            for (var o in e) t[e[o]] = n + e[o];
            return t
        },
        r = o(["container", "modal", "overlay", "close", "content", "spacer", "confirm", "cancel", "icon", "image", "input", "select", "radio", "checkbox", "textarea", "validationerror", "progresssteps", "activeprogressstep", "progresscircle", "progressline"]),
        i = o(["success", "warning", "info", "question", "error"]),
        a = {
            title: "",
            text: "",
            html: "",
            type: null,
            customClass: "",
            animation: !0,
            allowOutsideClick: !0,
            allowEscapeKey: !0,
            showConfirmButton: !0,
            showCancelButton: !1,
            preConfirm: null,
            confirmButtonText: "OK",
            confirmButtonColor: "#3085d6",
            confirmButtonClass: null,
            cancelButtonText: "Cancel",
            cancelButtonColor: "#aaa",
            cancelButtonClass: null,
            buttonsStyling: !0,
            reverseButtons: !1,
            focusCancel: !1,
            showCloseButton: !1,
            showLoaderOnConfirm: !1,
            imageUrl: null,
            imageWidth: null,
            imageHeight: null,
            imageClass: null,
            timer: null,
            width: 500,
            padding: 20,
            background: "#fff",
            input: null,
            inputPlaceholder: "",
            inputValue: "",
            inputOptions: {},
            inputAutoTrim: !0,
            inputClass: null,
            inputAttributes: {},
            inputValidator: null,
            progressSteps: [],
            currentProgressStep: 0,
            progressStepsDistance: "40px",
            onOpen: null,
            onClose: null
        },
        s = '<div class="' + r.overlay + '" tabIndex="-1"></div><div class="' + r.modal + '" style="display: none" tabIndex="-1"><ul class="' + r.progresssteps + '"></ul><div class="' + r.icon + " " + i.error + '"><span class="x-mark"><span class="line left"></span><span class="line right"></span></span></div><div class="' + r.icon + " " + i.question + '">?</div><div class="' + r.icon + " " + i.warning + '">!</div><div class="' + r.icon + " " + i.info + '">i</div><div class="' + r.icon + " " + i.success + '"><span class="line tip"></span> <span class="line long"></span><div class="placeholder"></div> <div class="fix"></div></div><img class="' + r.image + '"><h2></h2><div class="' + r.content + '"></div><input class="' + r.input + '"><select class="' + r.select + '"></select><div class="' + r.radio + '"></div><label for="' + r.checkbox + '" class="' + r.checkbox + '"><input type="checkbox" id="' + r.checkbox + '"></label><textarea class="' + r.textarea + '"></textarea><div class="' + r.validationerror + '"></div><hr class="' + r.spacer + '"><button type="button" class="' + r.confirm + '">OK</button><button type="button" class="' + r.cancel + '">Cancel</button><span class="' + r.close + '">&times;</span></div>',
        l = function(e, t) {
            for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n]);
            return e
        },
        c = function(e, t) {
            e = String(e).replace(/[^0-9a-f]/gi, ""), e.length < 6 && (e = e[0] + e[0] + e[1] + e[1] + e[2] + e[2]), t = t || 0;
            for (var n = "#", o = 0; 3 > o; o++) {
                var r = parseInt(e.substr(2 * o, 2), 16);
                r = Math.round(Math.min(Math.max(0, r + r * t), 255)).toString(16), n += ("00" + r).substr(r.length)
            }
            return n
        },
        u = function(e) {
            return "function" == typeof e
        },
        d = {
            previousWindowKeyDown: null,
            previousActiveElement: null
        },
        p = function(e) {
            return document.querySelector("." + e)
        },
        f = function() {
            return p(r.modal)
        },
        m = function() {
            return p(r.overlay)
        },
        h = function() {
            var e = f();
            return e.querySelectorAll("." + r.icon)
        },
        v = function() {
            return p(r.spacer)
        },
        y = function() {
            return p(r.progresssteps)
        },
        g = function() {
            return p(r.confirm)
        },
        b = function() {
            return p(r.cancel)
        },
        w = function() {
            return p(r.close)
        },
        C = function(e) {
            var t = [g(), b()];
            return e && t.reverse(), t.concat(Array.prototype.slice.call(f().querySelectorAll("button:not([class^=" + n + "]), input:not([type=hidden]), textarea, select")))
        },
        k = function(e, t) {
            return e.classList.contains(t)
        },
        x = function(e) {
            e.focus();
            var t = e.value;
            e.value = "", e.value = t
        },
        S = function(e, t) {
            if (e && t) {
                var n = t.split(/\s+/);
                n.forEach(function(t) {
                    e.classList.add(t)
                })
            }
        },
        E = function(e, t) {
            if (e && t) {
                var n = t.split(/\s+/);
                n.forEach(function(t) {
                    e.classList.remove(t)
                })
            }
        },
        B = function(e, t) {
            for (var n = 0; n < e.childNodes.length; n++)
                if (k(e.childNodes[n], t)) return e.childNodes[n]
        },
        A = function(e, t) {
            t || (t = "block"), e.style.opacity = "", e.style.display = t
        },
        P = function(e) {
            e.style.opacity = "", e.style.display = "none"
        },
        L = function(e) {
            for (; e.firstChild;) e.removeChild(e.firstChild)
        },
        q = function(e) {
            return e.offsetWidth || e.offsetHeight || e.getClientRects().length
        },
        M = function(e, t) {
            e.style.removeProperty ? e.style.removeProperty(t) : e.style.removeAttribute(t)
        },
        T = function(e) {
            var t = e.style.display;
            e.style.left = "-9999px", e.style.display = "block";
            var n = e.clientHeight;
            return e.style.left = "", e.style.display = t, "-" + parseInt(n / 2, 10) + "px"
        },
        O = function(e, t) {
            if (+e.style.opacity < 1) {
                t = t || 16, e.style.opacity = 0, e.style.display = "block";
                var n = +new Date,
                    o = function() {
                        var r = +e.style.opacity + (new Date - n) / 100;
                        e.style.opacity = r > 1 ? 1 : r, n = +new Date, +e.style.opacity < 1 && setTimeout(o, t)
                    };
                o()
            }
        },
        V = function(e, t) {
            if (+e.style.opacity > 0) {
                t = t || 16;
                var n = e.style.opacity,
                    o = +new Date,
                    r = function() {
                        var i = new Date - o,
                            a = +e.style.opacity - i / (100 * n);
                        e.style.opacity = a, o = +new Date, +e.style.opacity > 0 ? setTimeout(r, t) : P(e)
                    };
                r()
            }
        },
        N = function(e) {
            if ("function" == typeof MouseEvent) {
                var t = new MouseEvent("click", {
                    view: window,
                    bubbles: !1,
                    cancelable: !0
                });
                e.dispatchEvent(t)
            } else if (document.createEvent) {
                var n = document.createEvent("MouseEvents");
                n.initEvent("click", !1, !1), e.dispatchEvent(n)
            } else document.createEventObject ? e.fireEvent("onclick") : "function" == typeof e.onclick && e.onclick()
        },
        H = function(e) {
            "function" == typeof e.stopPropagation ? (e.stopPropagation(), e.preventDefault()) : window.event && window.event.hasOwnProperty("cancelBubble") && (window.event.cancelBubble = !0)
        },
        D = function() {
            var e = document.createElement("div"),
                t = {
                    WebkitAnimation: "webkitAnimationEnd",
                    OAnimation: "oAnimationEnd oanimationend",
                    msAnimation: "MSAnimationEnd",
                    animation: "animationend"
                };
            for (var n in t)
                if (t.hasOwnProperty(n) && void 0 !== e.style[n]) return t[n];
            return !1
        }(),
        I = function() {
            var e = f();
            window.onkeydown = d.previousWindowKeyDown, d.previousActiveElement && d.previousActiveElement.focus && d.previousActiveElement.focus(), clearTimeout(e.timeout)
        },
        j = function(e) {
            var t = n + "mediaquery-" + Math.random().toString(36).substring(2, 7),
                o = document.getElementsByTagName("head")[0],
                r = document.createElement("style");
            return r.type = "text/css", r.id = t, r.innerHTML = e, o.appendChild(r), t
        },
        K = function(e) {
            if (!e) return !1;
            var t = document.getElementsByTagName("head")[0],
                n = document.getElementById(e);
            n && t.removeChild(n)
        },
        U = l({}, a),
        W = function(e) {
            var t = f();
            for (var n in e) a.hasOwnProperty(n) || "extraParams" === n || console.warn('SweetAlert2: Unknown parameter "' + n + '"');
            e.width = e.width.toString();
            var o, s = e.width.match(/^(\d+)(px|%)?$/);
            if (s ? (o = "px", s[2] && (o = s[2]), s = parseInt(s[1], 10), t.style.width = s + o, t.style.marginLeft = -s / 2 + o) : console.warn('SweetAlert2: Invalid width parameter, usage examples: "400px", "50%", or just 500 which equals to "500px"'), t.style.padding = e.padding + "px", t.style.background = e.background, "px" === o) {
                var l = 5,
                    c = s + s * (l / 100) * 2,
                    u = j("@media screen and (max-width: " + c + "px) {." + r.modal + " {width: auto !important;left: " + l + "% !important;right: " + l + "% !important;margin-left: 0 !important;}}");
                t.setAttribute("data-mediaquery-id", u)
            }
            var d = t.querySelector("h2"),
                p = t.querySelector("." + r.content),
                m = g(),
                w = b(),
                C = t.querySelector("." + r.close);
            d.innerHTML = e.title.split("\n").join("<br>");
            var k;
            if (e.text || e.html) {
                if ("object" == typeof e.html)
                    if (p.innerHTML = "", 0 in e.html)
                        for (k = 0; k in e.html; k++) p.appendChild(e.html[k].cloneNode(!0));
                    else p.appendChild(e.html.cloneNode(!0));
                else p.innerHTML = e.html || e.text.split("\n").join("<br>");
                A(p)
            } else P(p);
            e.showCloseButton ? A(C) : P(C), t.className = r.modal, e.customClass && S(t, e.customClass);
            var x = y();
            e.currentProgressStep = parseInt(e.currentProgressStep, 10), e.progressSteps.length ? (A(x), L(x), e.currentProgressStep >= e.progressSteps.length && console.warn("SweetAlert2: Invalid currentProgressStep parameter, it should be less than progressSteps.length (currentProgressStep like JS arrays starts from 0)"), e.progressSteps.forEach(function(t, n) {
                var o = document.createElement("li");
                if (S(o, r.progresscircle), o.innerHTML = t, n === e.currentProgressStep && S(o, r.activeprogressstep), x.appendChild(o), n !== e.progressSteps.length - 1) {
                    var i = document.createElement("li");
                    S(i, r.progressline), i.style.width = e.progressStepsDistance, x.appendChild(i)
                }
            })) : P(x);
            var B = h();
            for (k = 0; k < B.length; k++) P(B[k]);
            if (e.type) {
                var q = !1;
                for (var T in i)
                    if (e.type === T) {
                        q = !0;
                        break
                    }
                if (!q) return console.error("SweetAlert2: Unknown alert type: " + e.type), !1;
                var O = t.querySelector("." + r.icon + "." + i[e.type]);
                switch (A(O), e.type) {
                    case "success":
                        S(O, "animate"), S(O.querySelector(".tip"), "animate-success-tip"), S(O.querySelector(".long"), "animate-success-long");
                        break;
                    case "error":
                        S(O, "animate-error-icon"), S(O.querySelector(".x-mark"), "animate-x-mark");
                        break;
                    case "warning":
                        S(O, "pulse-warning")
                }
            }
            var V = t.querySelector("." + r.image);
            e.imageUrl ? (V.setAttribute("src", e.imageUrl), A(V), e.imageWidth ? V.setAttribute("width", e.imageWidth) : V.removeAttribute("width"), e.imageHeight ? V.setAttribute("height", e.imageHeight) : V.removeAttribute("height"), V.className = r.image, e.imageClass && S(V, e.imageClass)) : P(V), e.showCancelButton ? w.style.display = "inline-block" : P(w), e.showConfirmButton ? M(m, "display") : P(m);
            var N = v();
            e.showConfirmButton || e.showCancelButton ? A(N) : P(N), m.innerHTML = e.confirmButtonText, w.innerHTML = e.cancelButtonText, e.buttonsStyling && (m.style.backgroundColor = e.confirmButtonColor, w.style.backgroundColor = e.cancelButtonColor), m.className = r.confirm, S(m, e.confirmButtonClass), w.className = r.cancel, S(w, e.cancelButtonClass), e.buttonsStyling ? (S(m, "styled"), S(w, "styled")) : (E(m, "styled"), E(w, "styled"), m.style.backgroundColor = m.style.borderLeftColor = m.style.borderRightColor = "", w.style.backgroundColor = w.style.borderLeftColor = w.style.borderRightColor = ""), e.animation === !0 ? E(t, "no-animation") : S(t, "no-animation")
        },
        z = function(e, t) {
            var n = f();
            e ? (O(m(), 10), S(n, "show-swal2"), E(n, "hide-swal2")) : A(m()), A(n), d.previousActiveElement = document.activeElement, null !== t && "function" == typeof t && t.call(this, n)
        },
        R = function() {
            var e = f();
            null !== e && (e.style.marginTop = T(e))
        };
    return t.isVisible = function() {
            var e = f();
            return q(e)
        }, t.queue = function(e, n) {
            var o;
            return n && (o = {
                fork: function(e) {
                    n = e, this.next = e[0]
                },
                repeatCurrent: function() {
                    n.unshift(this.current), this.next = this.current
                },
                insert: function(e) {
                    n.unshift(e), this.next = this.state
                },
                terminate: function() {
                    n = [], this.next = ""
                }
            }), new Promise(function(r, i) {
                ! function a(s, l) {
                    var c = null;
                    u(e) ? n && n.length > 0 ? (o.current = n[0], o.next = n.length > 1 ? n[1] : "", o.alertNumber = s, n.shift(), c = e(o)) : c = e(s) : s < e.length && (c = e[s]), c ? t(c).then(function() {
                        a(s + 1, l)
                    }, function(e) {
                        i(e)
                    }) : r()
                }(0)
            })
        }, t.close = t.closeModal = function(e) {
            var t = f();
            E(t, "show-swal2"), S(t, "hide-swal2");
            var n = t.querySelector("." + r.icon + "." + i.success);
            E(n, "animate"), E(n.querySelector(".tip"), "animate-success-tip"), E(n.querySelector(".long"), "animate-success-long");
            var o = t.querySelector("." + r.icon + "." + i.error);
            E(o, "animate-error-icon"), E(o.querySelector(".x-mark"), "animate-x-mark");
            var a = t.querySelector("." + r.icon + "." + i.warning);
            E(a, "pulse-warning"), I();
            var s = t.getAttribute("data-mediaquery-id");
            D && !k(t, "no-animation") ? t.addEventListener(D, function l() {
                t.removeEventListener(D, l), k(t, "hide-swal2") && (P(t), V(m(), 0)), K(s)
            }) : (P(t), P(m()), K(s)), null !== e && "function" == typeof e && e.call(this, t)
        }, t.clickConfirm = function() {
            g().click()
        }, t.clickCancel = function() {
            b().click()
        }, t.init = function() {
            if ("undefined" == typeof document) return void console.log("SweetAlert2 requires document to initialize");
            if (!document.getElementsByClassName(r.container).length) {
                var e = document.createElement("div");
                e.className = r.container, e.innerHTML = s, document.body.appendChild(e);
                var n = f(),
                    o = B(n, r.input),
                    i = B(n, r.select),
                    a = n.querySelector("#" + r.checkbox),
                    l = B(n, r.textarea),
                    c = B(n, r.image);
                o.oninput = function() {
                    t.resetValidationError()
                }, o.onkeyup = function(e) {
                    e.stopPropagation(), 13 === e.keyCode && t.clickConfirm()
                }, i.onchange = function() {
                    t.resetValidationError()
                }, a.onchange = function() {
                    t.resetValidationError()
                }, l.oninput = function() {
                    t.resetValidationError()
                }, c.onload = c.onerror = R, window.addEventListener("resize", R, !1)
            }
        }, t.setDefaults = function(e) {
            if (!e) throw new Error("userParams is required");
            if ("object" != typeof e) throw new Error("userParams has to be a object");
            l(U, e)
        }, t.resetDefaults = function() {
            U = l({}, a)
        }, t.version = "4.2.8", window.sweetAlert = window.swal = t,
        function() {
            "complete" === document.readyState || "interactive" === document.readyState && document.body ? t.init() : document.addEventListener("DOMContentLoaded", function e() {
                document.removeEventListener("DOMContentLoaded", e, !1), t.init()
            }, !1)
        }(), "function" == typeof Promise ? Promise.prototype.done = Promise.prototype.done || function() {
            return this["catch"](function() {})
        } : console.warn("SweetAlert2: Please inlude Promise polyfill BEFORE including sweetalert2.js if IE10+ support needed."), t
});