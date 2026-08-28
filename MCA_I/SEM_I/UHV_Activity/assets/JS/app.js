/* ============================================================
   APP.JS – Login logic + Session persistence + Slide engine
   ============================================================ */

(function () {
  "use strict";

  /* ===== CREDENTIALS ===== */
  const VALID_EMAIL    = "harshtech417@gmail.com";
  const VALID_PASSWORD = "harsh1";
  const SESSION_KEY    = "uhv_logged_in";

  /* ===== STORAGE HELPER (localStorage with sessionStorage fallback) ===== */
  var store = (function () {
    try {
      localStorage.setItem("__test__", "1");
      localStorage.removeItem("__test__");
      return localStorage;
    } catch (e) {
      return sessionStorage;
    }
  })();

  /* ===== DOM REFS – LOGIN ===== */
  var loginPage  = document.getElementById("loginPage");
  var loginForm  = document.getElementById("loginForm");
  var emailInput = document.getElementById("email");
  var pwdInput   = document.getElementById("password");
  var errorMsg   = document.getElementById("errorMsg");
  var loginBtn   = document.getElementById("loginBtn");
  var btnLoader  = document.getElementById("btnLoader");
  var btnText    = loginBtn.querySelector(".btn-text");
  var togglePwd  = document.getElementById("togglePwd");

  /* ===== DOM REFS – PRESENTATION ===== */
  var pptPage    = document.getElementById("pptPage");
  var logoutBtn  = document.getElementById("logoutBtn");
  var slides     = document.querySelectorAll(".slide");
  var slideStage = document.getElementById("slideStage");
  var prevBtn    = document.getElementById("prevBtn");
  var nextBtn    = document.getElementById("nextBtn");
  var slideCounter = document.getElementById("slideCounter");
  var dotsWrap   = document.getElementById("dotsWrap");

  var TOTAL      = slides.length;
  var current    = 0;
  var isAnimating = false;

  /* ===================================================
     SHOW / HIDE HELPERS
  =================================================== */
  function showLogin() {
    pptPage.style.display  = "none";
    loginPage.style.display = "";
    loginPage.style.opacity = "1";
    loginPage.style.transition = "";
  }

  function showPPT(animate) {
    loginPage.style.display = "none";
    pptPage.style.display   = "flex";
    if (animate) {
      pptPage.style.opacity = "0";
      pptPage.style.transition = "opacity .4s ease";
      requestAnimationFrame(function () {
        requestAnimationFrame(function () {
          pptPage.style.opacity = "1";
        });
      });
    } else {
      pptPage.style.opacity = "1";
      pptPage.style.transition = "";
    }
  }

  /* ===================================================
     SECTION 1: SESSION RESTORE (runs immediately on load)
  =================================================== */
  if (store.getItem(SESSION_KEY) === "true") {
    showPPT(false);   /* already logged in — skip login instantly */
  } else {
    showLogin();
  }
  updateUI();

  /* ===================================================
     SECTION 2: LOGIN
  =================================================== */

  /* Toggle password visibility */
  togglePwd.addEventListener("click", function () {
    var isText = pwdInput.type === "text";
    pwdInput.type = isText ? "password" : "text";
    togglePwd.innerHTML = isText ? "&#128065;" : "&#128064;";
  });

  /* Form submit */
  loginForm.addEventListener("submit", function (e) {
    e.preventDefault();
    clearError();

    var email = emailInput.value.trim();
    var pwd   = pwdInput.value;

    if (!email) { showError("Please enter your email."); emailInput.focus(); return; }
    if (!pwd)   { showError("Please enter your password."); pwdInput.focus(); return; }

    setLoading(true);
    setTimeout(function () {
      if (email === VALID_EMAIL && pwd === VALID_PASSWORD) {
        store.setItem(SESSION_KEY, "true");
        loginPage.style.opacity    = "0";
        loginPage.style.transition = "opacity .35s ease";
        setTimeout(function () {
          showPPT(true);
        }, 350);
      } else {
        setLoading(false);
        showError("Incorrect email or password. Please try again.");
        pwdInput.value = "";
        pwdInput.focus();
        loginBtn.classList.add("shake");
        setTimeout(function () { loginBtn.classList.remove("shake"); }, 500);
      }
    }, 800);
  });

  function showError(msg) {
    errorMsg.textContent   = msg;
    errorMsg.style.display = "block";
  }

  function clearError() {
    errorMsg.textContent   = "";
    errorMsg.style.display = "none";
  }

  function setLoading(on) {
    btnText.textContent = on ? "Signing in\u2026" : "Sign In";
    btnLoader.classList.toggle("hidden", !on);
    loginBtn.disabled = on;
  }

  /* ===================================================
     SECTION 3: PRESENTATION – SLIDE SYSTEM
  =================================================== */

  /* Build progress dots */
  for (var i = 0; i < TOTAL; i++) {
    (function (idx) {
      var dot = document.createElement("button");
      dot.classList.add("dot");
      dot.setAttribute("aria-label", "Go to slide " + (idx + 1));
      dot.dataset.index = idx;
      dot.addEventListener("click", function () { goTo(idx); });
      dotsWrap.appendChild(dot);
    })(i);
  }

  function updateUI() {
    slideCounter.textContent = (current + 1) + " / " + TOTAL;
    var dots = dotsWrap.querySelectorAll(".dot");
    dots.forEach(function (d, i) {
      d.classList.toggle("active", i === current);
    });
    prevBtn.disabled = (current === 0);
    nextBtn.disabled = (current === TOTAL - 1);
  }

  function goTo(index, direction) {
    if (isAnimating) return;
    if (index < 0 || index >= TOTAL || index === current) return;

    isAnimating = true;
    var dir = (direction !== undefined) ? direction : (index > current ? 1 : -1);

    var outSlide = slides[current];
    var inSlide  = slides[index];

    /* Pause any videos in the outgoing slide */
    var videos = outSlide.querySelectorAll("video");
    videos.forEach(function (v) {
      v.pause();
    });
    var videoContainers = outSlide.querySelectorAll(".video-container");
    videoContainers.forEach(function (c) {
      c.classList.remove("playing");
    });

    /* Position incoming slide off-screen instantly */
    inSlide.style.transition = "none";
    inSlide.style.transform  = dir > 0 ? "translateX(100%)" : "translateX(-100%)";
    inSlide.style.opacity    = "0";
    inSlide.style.display    = "flex";
    inSlide.classList.remove("active");

    void inSlide.offsetWidth; /* force reflow */

    /* Animate out current */
    outSlide.style.transition = "transform .42s cubic-bezier(.4,0,.2,1), opacity .42s ease";
    outSlide.style.transform  = dir > 0 ? "translateX(-100%)" : "translateX(100%)";
    outSlide.style.opacity    = "0";

    /* Animate in next */
    inSlide.style.transition  = "transform .42s cubic-bezier(.4,0,.2,1), opacity .42s ease";
    inSlide.style.transform   = "translateX(0)";
    inSlide.style.opacity     = "1";
    inSlide.classList.add("active");

    current = index;
    updateUI();

    setTimeout(function () {
      outSlide.classList.remove("active");
      outSlide.style.display    = "";
      outSlide.style.transform  = "";
      outSlide.style.opacity    = "";
      outSlide.style.transition = "";
      inSlide.style.transform   = "";
      inSlide.style.opacity     = "";
      inSlide.style.transition  = "";
      isAnimating = false;
    }, 460);
  }

  prevBtn.addEventListener("click", function () { goTo(current - 1, -1); });
  nextBtn.addEventListener("click", function () { goTo(current + 1,  1); });

  /* ===================================================
     SECTION 4: KEYBOARD NAVIGATION
  =================================================== */
  document.addEventListener("keydown", function (e) {
    if (pptPage.style.display === "none") return;
    if (e.key === "ArrowRight" || e.key === "ArrowDown" || e.key === " ") {
      e.preventDefault(); goTo(current + 1, 1);
    } else if (e.key === "ArrowLeft" || e.key === "ArrowUp") {
      e.preventDefault(); goTo(current - 1, -1);
    }
  });

  /* ===================================================
     SECTION 5: TOUCH / SWIPE SUPPORT
  =================================================== */
  var touchStartX = 0, touchStartY = 0, isDragging = false;

  slideStage.addEventListener("touchstart", function (e) {
    touchStartX = e.touches[0].clientX;
    touchStartY = e.touches[0].clientY;
    isDragging  = true;
  }, { passive: true });

  slideStage.addEventListener("touchmove", function (e) {
    if (!isDragging) return;
    var dx = e.touches[0].clientX - touchStartX;
    var dy = e.touches[0].clientY - touchStartY;
    if (Math.abs(dx) > Math.abs(dy)) e.preventDefault();
  }, { passive: false });

  slideStage.addEventListener("touchend", function (e) {
    if (!isDragging) return;
    isDragging = false;
    var dx = e.changedTouches[0].clientX - touchStartX;
    var dy = e.changedTouches[0].clientY - touchStartY;
    if (Math.abs(dx) > 50 && Math.abs(dx) > Math.abs(dy)) {
      if (dx < 0) goTo(current + 1,  1);
      else        goTo(current - 1, -1);
    }
  }, { passive: true });

  /* Mouse drag */
  var mouseStartX = 0, isDraggingMouse = false;

  slideStage.addEventListener("mousedown",  function (e) { mouseStartX = e.clientX; isDraggingMouse = true; });
  slideStage.addEventListener("mousemove",  function (e) { if (isDraggingMouse) e.preventDefault(); });
  slideStage.addEventListener("mouseleave", function ()  { isDraggingMouse = false; });
  slideStage.addEventListener("mouseup",    function (e) {
    if (!isDraggingMouse) return;
    isDraggingMouse = false;
    var dx = e.clientX - mouseStartX;
    if (Math.abs(dx) > 60) {
      if (dx < 0) goTo(current + 1,  1);
      else        goTo(current - 1, -1);
    }
  });

  /* ===================================================
     SECTION 6: LOGOUT
  =================================================== */
  logoutBtn.addEventListener("click", function () {
    store.removeItem(SESSION_KEY);
    pptPage.style.opacity    = "0";
    pptPage.style.transition = "opacity .35s ease";
    setTimeout(function () {
      /* Reset slides */
      slides.forEach(function (s, i) {
        s.classList.remove("active");
        s.style.transform  = "";
        s.style.opacity    = "";
        s.style.transition = "";
        s.style.display    = "";
        if (i === 0) s.classList.add("active");
      });
      current     = 0;
      isAnimating = false;
      updateUI();

      /* Reset form */
      loginForm.reset();
      clearError();
      setLoading(false);

      showLogin();
    }, 350);
  });
  var slideLogoutBtn = document.getElementById("slideLogoutBtn");
  if (slideLogoutBtn) {
    slideLogoutBtn.addEventListener("click", function () {
      logoutBtn.click();
    });
  }

  /* ===================================================
     SECTION 7: SHAKE ANIMATION (injected CSS)
  =================================================== */
  var styleEl = document.createElement("style");
  styleEl.textContent =
    "@keyframes shake{" +
    "0%,100%{transform:translateX(0)}" +
    "20%{transform:translateX(-6px)}" +
    "40%{transform:translateX(6px)}" +
    "60%{transform:translateX(-4px)}" +
    "80%{transform:translateX(4px)}}" +
    ".shake{animation:shake .45s ease!important;}";
  document.head.appendChild(styleEl);

  /* ===================================================
     SECTION 8: VIDEO CONTROLS
  =================================================== */
  var thankVideo = document.getElementById("thankVideo");
  var videoPlayBtn = document.getElementById("videoPlayBtn");
  var thankVideoContainer = document.getElementById("thankVideoContainer");

  if (thankVideo && videoPlayBtn && thankVideoContainer) {
    function enterFullscreen() {
      if (thankVideo.requestFullscreen) {
        thankVideo.requestFullscreen();
      } else if (thankVideo.webkitRequestFullscreen) { /* Safari / iOS */
        thankVideo.webkitRequestFullscreen();
      } else if (thankVideo.msRequestFullscreen) { /* IE11 */
        thankVideo.msRequestFullscreen();
      }
    }

    function exitFullscreen() {
      if (document.fullscreenElement === thankVideo || document.webkitFullscreenElement === thankVideo) {
        if (document.exitFullscreen) {
          document.exitFullscreen();
        } else if (document.webkitExitFullscreen) {
          document.webkitExitFullscreen();
        }
      }
    }

    function toggleVideoPlay() {
      if (thankVideo.paused) {
        enterFullscreen();
        thankVideo.play();
        thankVideoContainer.classList.add("playing");
      } else {
        thankVideo.pause();
        thankVideoContainer.classList.remove("playing");
        exitFullscreen();
      }
    }

    videoPlayBtn.addEventListener("click", function(e) {
      e.stopPropagation();
      toggleVideoPlay();
    });
    
    thankVideo.addEventListener("click", toggleVideoPlay);

    // If user exits fullscreen manually (e.g. Escape key), pause the video
    function handleFullscreenChange() {
      var isFullscreen = document.fullscreenElement === thankVideo || 
                         document.webkitFullscreenElement === thankVideo;
      if (!isFullscreen && !thankVideo.paused) {
        thankVideo.pause();
        thankVideoContainer.classList.remove("playing");
      }
    }

    document.addEventListener("fullscreenchange", handleFullscreenChange);
    document.addEventListener("webkitfullscreenchange", handleFullscreenChange);

    thankVideo.addEventListener("ended", function () {
      thankVideoContainer.classList.remove("playing");
      exitFullscreen();
    });
  }

})();
