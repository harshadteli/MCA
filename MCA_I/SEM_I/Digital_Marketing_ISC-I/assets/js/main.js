/* ═══════════════════════════════════════════════════════════════════
   main.js  –  AI-Powered Digital Marketing Assistant Presentation
═══════════════════════════════════════════════════════════════════ */

// ── Credentials ───────────────────────────────────────────────────
const CREDS = { email: 'harshtech417@gmail.com', pass: 'harsh1' };

// ── DOM refs ──────────────────────────────────────────────────────
const loginScreen    = document.getElementById('login-screen');
const pptShell       = document.getElementById('ppt-shell');
const inpEmail       = document.getElementById('inp-email');
const inpPass        = document.getElementById('inp-pass');
const loginError     = document.getElementById('login-error');
const slideCounter   = document.getElementById('slide-counter');
const btnPrev        = document.getElementById('btn-prev');
const btnNext        = document.getElementById('btn-next');
const drawer         = document.getElementById('drawer');
const drawerOverlay  = document.getElementById('drawer-overlay');

// ── Auth & Session ────────────────────────────────────────────────
function checkAuth() {
  if (localStorage.getItem('dyp_ppt_logged_in') === 'true') {
    loginScreen.classList.add('hidden');
    pptShell.classList.remove('hidden');
  }
}

function doLogin() {
  const email = inpEmail.value.trim();
  const pass  = inpPass.value;

  if (email === CREDS.email && pass === CREDS.pass) {
    localStorage.setItem('dyp_ppt_logged_in', 'true');
    loginError.style.display = 'none';
    loginScreen.style.opacity = '0';
    setTimeout(() => {
      loginScreen.classList.add('hidden');
      pptShell.classList.remove('hidden');
    }, 400);
  } else {
    loginError.style.display = 'block';
    inpPass.value = '';
    inpPass.focus();
    inpPass.classList.remove('shake');
    void inpPass.offsetWidth;
    inpPass.classList.add('shake');
    setTimeout(() => inpPass.classList.remove('shake'), 500);
  }
}

function doLogout() {
  localStorage.removeItem('dyp_ppt_logged_in');
  pptShell.classList.add('hidden');
  loginScreen.classList.remove('hidden');
  loginScreen.style.opacity = '1';
  inpEmail.value = '';
  inpPass.value = '';
  loginError.style.display = 'none';
}

inpEmail.addEventListener('keydown', e => { if (e.key === 'Enter') inpPass.focus(); });
inpPass.addEventListener('keydown',  e => { if (e.key === 'Enter') doLogin(); });

// ── Video Controller ──────────────────────────────────────────────
const openingVideo      = document.getElementById('opening-video');
const soundIconMuted    = document.getElementById('sound-icon-muted');
const soundIconUnmuted  = document.getElementById('sound-icon-unmuted');
const soundBtnText      = document.getElementById('sound-btn-text');
const btnUnmute         = document.getElementById('btn-unmute');

const chatbotVideo      = document.getElementById('chatbot-video');
const cbSoundIconMuted  = document.getElementById('cb-sound-icon-muted');
const cbSoundIconUnmuted= document.getElementById('cb-sound-icon-unmuted');
const cbSoundBtnText    = document.getElementById('cb-sound-btn-text');
const cbBtnUnmute       = document.getElementById('cb-btn-unmute');

const devishVideo       = document.getElementById('devish-video');
const devSoundIconMuted  = document.getElementById('dev-sound-icon-muted');
const devSoundIconUnmuted= document.getElementById('dev-sound-icon-unmuted');
const devSoundBtnText    = document.getElementById('dev-sound-btn-text');
const devBtnUnmute       = document.getElementById('dev-btn-unmute');

const lastVideo         = document.getElementById('last-video');
const lastSoundIconMuted= document.getElementById('last-sound-icon-muted');
const lastSoundIconUnmuted= document.getElementById('last-sound-icon-unmuted');
const lastSoundBtnText  = document.getElementById('last-sound-btn-text');
const lastBtnUnmute     = document.getElementById('last-btn-unmute');

/* ── Safe video play/pause helpers ─────────────────────────────────
   The AbortError happens when pause() is called while a play()
   promise is still pending. We fix this by:
   1. Storing the pending promise on the element (_playPromise)
   2. In safePause(), waiting for that promise to settle first
   3. Never calling play() if the element is already playing
──────────────────────────────────────────────────────────────────── */

function safePause(videoEl, updateFn) {
  if (!videoEl) return;
  const pending = videoEl._playPromise;
  if (pending !== undefined) {
    pending.then(() => {
      videoEl.pause();
      videoEl.muted = true;
      if (updateFn) updateFn(false);
    }).catch(() => {
      // promise already rejected – safe to ignore
    });
    videoEl._playPromise = undefined;
  } else {
    if (!videoEl.paused) videoEl.pause();
    videoEl.muted = true;
    if (updateFn) updateFn(false);
  }
}

function safePlay(videoEl, updateFn) {
  if (!videoEl) return;
  // Don't start a new play if one is already in flight
  if (videoEl._playPromise !== undefined) return;

  videoEl.muted = false;
  const p = videoEl.play();
  if (p !== undefined) {
    videoEl._playPromise = p;
    p.then(() => {
      videoEl._playPromise = undefined;
      if (updateFn) updateFn(true);
    }).catch(err => {
      videoEl._playPromise = undefined;
      // AbortError = interrupted before playback started – not a real problem
      if (err.name !== 'AbortError') {
        console.warn('Playback error:', err.name, err.message);
      }
      videoEl.muted = true;
      if (updateFn) updateFn(false);
    });
  }
}

function setupVideoElement(videoEl, slideIndex, updateFn) {
  if (!videoEl) return;

  videoEl._playPromise = undefined;

  // Find the sibling loading overlay (next element after the video)
  const spinner = videoEl.parentElement
    ? videoEl.parentElement.querySelector('.video-loading-overlay')
    : null;

  const showSpinner = () => { if (spinner) spinner.classList.add('visible'); };
  const hideSpinner = () => { if (spinner) spinner.classList.remove('visible'); };

  videoEl.addEventListener('waiting',  showSpinner);   // buffering
  videoEl.addEventListener('canplay',  hideSpinner);   // ready to play
  videoEl.addEventListener('playing',  hideSpinner);   // actually playing
  videoEl.addEventListener('pause',    hideSpinner);
  videoEl.addEventListener('ended', () => {
    hideSpinner();
    if (current === slideIndex) changeSlide(1);
  });
  videoEl.addEventListener('error', () => {
    hideSpinner();
    videoEl._playPromise = undefined;
    updateFn(false);
  });

  // Start fully paused – no network request until user clicks Play
  videoEl.pause();
}

function initVideoController() {
  setupVideoElement(openingVideo, 0,  updateVideoButtonUI);
  setupVideoElement(chatbotVideo, 8,  updateChatbotVideoButtonUI);
  setupVideoElement(devishVideo,  11, updateDevishVideoButtonUI);
  setupVideoElement(lastVideo,    16, updateLastVideoButtonUI);
}

function handleVideoOnSlideChange(newIndex) {
  if (openingVideo && newIndex !== 0)  safePause(openingVideo, updateVideoButtonUI);
  if (chatbotVideo && newIndex !== 8)  safePause(chatbotVideo, updateChatbotVideoButtonUI);
  if (devishVideo  && newIndex !== 11) safePause(devishVideo,  updateDevishVideoButtonUI);
  if (lastVideo    && newIndex !== 16) safePause(lastVideo,    updateLastVideoButtonUI);
}

function toggleVideoPlay(videoEl, updateFn) {
  if (!videoEl) return;
  if (videoEl.paused || videoEl.muted) {
    safePlay(videoEl, updateFn);
  } else {
    safePause(videoEl, updateFn);
  }
}

function toggleVideoSound()        { toggleVideoPlay(openingVideo, updateVideoButtonUI); }
function toggleChatbotVideoSound() { toggleVideoPlay(chatbotVideo, updateChatbotVideoButtonUI); }
function toggleDevishVideoSound()  { toggleVideoPlay(devishVideo,  updateDevishVideoButtonUI); }
function toggleLastVideoSound()    { toggleVideoPlay(lastVideo,    updateLastVideoButtonUI); }

function updateVideoButtonUI(isPlaying) {
  if (isPlaying) {
    if (soundIconMuted) soundIconMuted.classList.add('hidden');
    if (soundIconUnmuted) soundIconUnmuted.classList.remove('hidden');
    if (soundBtnText) soundBtnText.textContent = 'Pause Video';
    if (btnUnmute) btnUnmute.classList.add('active-sound');
  } else {
    if (soundIconMuted) soundIconMuted.classList.remove('hidden');
    if (soundIconUnmuted) soundIconUnmuted.classList.add('hidden');
    if (soundBtnText) soundBtnText.textContent = 'Play Video';
    if (btnUnmute) btnUnmute.classList.remove('active-sound');
  }
}

function updateChatbotVideoButtonUI(isPlaying) {
  if (isPlaying) {
    if (cbSoundIconMuted) cbSoundIconMuted.classList.add('hidden');
    if (cbSoundIconUnmuted) cbSoundIconUnmuted.classList.remove('hidden');
    if (cbSoundBtnText) cbSoundBtnText.textContent = 'Pause Video';
    if (cbBtnUnmute) cbBtnUnmute.classList.add('active-sound');
  } else {
    if (cbSoundIconMuted) cbSoundIconMuted.classList.remove('hidden');
    if (cbSoundIconUnmuted) cbSoundIconUnmuted.classList.add('hidden');
    if (cbSoundBtnText) cbSoundBtnText.textContent = 'Play Video';
    if (cbBtnUnmute) cbBtnUnmute.classList.remove('active-sound');
  }
}

function updateDevishVideoButtonUI(isPlaying) {
  if (isPlaying) {
    if (devSoundIconMuted) devSoundIconMuted.classList.add('hidden');
    if (devSoundIconUnmuted) devSoundIconUnmuted.classList.remove('hidden');
    if (devSoundBtnText) devSoundBtnText.textContent = 'Pause Video';
    if (devBtnUnmute) devBtnUnmute.classList.add('active-sound');
  } else {
    if (devSoundIconMuted) devSoundIconMuted.classList.remove('hidden');
    if (devSoundIconUnmuted) devSoundIconUnmuted.classList.add('hidden');
    if (devSoundBtnText) devSoundBtnText.textContent = 'Play Video';
    if (devBtnUnmute) devBtnUnmute.classList.remove('active-sound');
  }
}

function updateLastVideoButtonUI(isPlaying) {
  if (isPlaying) {
    if (lastSoundIconMuted) lastSoundIconMuted.classList.add('hidden');
    if (lastSoundIconUnmuted) lastSoundIconUnmuted.classList.remove('hidden');
    if (lastSoundBtnText) lastSoundBtnText.textContent = 'Pause Video';
    if (lastBtnUnmute) lastBtnUnmute.classList.add('active-sound');
  } else {
    if (lastSoundIconMuted) lastSoundIconMuted.classList.remove('hidden');
    if (lastSoundIconUnmuted) lastSoundIconUnmuted.classList.add('hidden');
    if (lastSoundBtnText) lastSoundBtnText.textContent = 'Play Video';
    if (lastBtnUnmute) lastBtnUnmute.classList.remove('active-sound');
  }
}

// ── Slide engine ──────────────────────────────────────────────────
const slides  = document.querySelectorAll('.slide');
const TOTAL   = slides.length;
let   current = 0;

function updateUI() {
  slideCounter.textContent = `Slide ${current + 1} / ${TOTAL}`;
  btnPrev.disabled = current === 0;
  btnNext.disabled = current === TOTAL - 1;
  document.querySelectorAll('.drawer-item').forEach((el, i) => {
    el.classList.toggle('active', i === current);
  });
}

function animateSlide(from, to, dir) {
  const sf = slides[from];
  const st = slides[to];

  // Exit current
  sf.style.transition = 'opacity .55s cubic-bezier(.4,0,.2,1),transform .55s cubic-bezier(.4,0,.2,1)';
  sf.style.transform  = dir > 0 ? 'translateX(-100%)' : 'translateX(100%)';
  sf.style.opacity    = '0';

  // Snap next off-screen, then animate in
  st.style.transition = 'none';
  st.style.transform  = dir > 0 ? 'translateX(100%)' : 'translateX(-100%)';
  st.style.opacity    = '0';
  void st.offsetWidth;

  st.style.transition = 'opacity .55s cubic-bezier(.4,0,.2,1),transform .55s cubic-bezier(.4,0,.2,1)';
  st.style.transform  = 'translateX(0)';
  st.style.opacity    = '1';
  st.classList.add('active');

  setTimeout(() => {
    sf.classList.remove('active');
    sf.style.transition = '';
    sf.style.transform  = '';
    sf.style.opacity    = '';
  }, 570);

  current = to;
  handleVideoOnSlideChange(to);
  updateUI();
  closeDrawer();
}

function changeSlide(dir) {
  const next = current + dir;
  if (next < 0 || next >= TOTAL) return;
  animateSlide(current, next, dir);
}

function goToSlide(index) {
  if (index === current) { closeDrawer(); return; }
  animateSlide(current, index, index > current ? 1 : -1);
}

// ── Keyboard navigation ───────────────────────────────────────────
document.addEventListener('keydown', e => {
  if (loginScreen.classList.contains('hidden')) {
    if (e.key === 'ArrowRight' || e.key === 'ArrowDown') changeSlide(1);
    if (e.key === 'ArrowLeft'  || e.key === 'ArrowUp')   changeSlide(-1);
  }
});

// ── Touch / Swipe navigation for touch screens ─────────────────────
let touchStartX = 0;
let touchStartY = 0;

document.addEventListener('touchstart', e => {
  if (loginScreen.classList.contains('hidden')) {
    touchStartX = e.touches[0].clientX;
    touchStartY = e.touches[0].clientY;
  }
}, { passive: true });

document.addEventListener('touchend', e => {
  if (!loginScreen.classList.contains('hidden')) return;

  const touchEndX = e.changedTouches[0].clientX;
  const touchEndY = e.changedTouches[0].clientY;

  const diffX = touchStartX - touchEndX;
  const diffY = touchStartY - touchEndY;

  // Trigger horizontal swipe if horizontal distance > vertical distance and > 40px threshold
  if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 40) {
    if (diffX > 0) {
      changeSlide(1);  // Swipe Left -> Next Slide
    } else {
      changeSlide(-1); // Swipe Right -> Previous Slide
    }
  }
}, { passive: true });

// ── Drawer ────────────────────────────────────────────────────────
function toggleDrawer() {
  drawer.classList.contains('open') ? closeDrawer() : openDrawer();
}
function openDrawer() {
  drawer.classList.add('open');
  drawerOverlay.classList.add('open');
}
function closeDrawer() {
  drawer.classList.remove('open');
  drawerOverlay.classList.remove('open');
}

// ── Fullscreen Controller ─────────────────────────────────────────
function toggleFullscreen() {
  if (!document.fullscreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement) {
    const elem = document.documentElement;
    if (elem.requestFullscreen) {
      elem.requestFullscreen();
    } else if (elem.webkitRequestFullscreen) {
      elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) {
      elem.msRequestFullscreen();
    }
  } else {
    if (document.exitFullscreen) {
      document.exitFullscreen();
    } else if (document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) {
      document.msExitFullscreen();
    }
  }
}

function updateFullscreenUI() {
  const isFS = !!(document.fullscreenElement || document.webkitFullscreenElement || document.msFullscreenElement);
  const iconExpand   = document.getElementById('fs-icon-expand');
  const iconCompress = document.getElementById('fs-icon-compress');
  const btnFS        = document.getElementById('btn-fullscreen');

  if (iconExpand && iconCompress) {
    if (isFS) {
      iconExpand.classList.add('hidden');
      iconCompress.classList.remove('hidden');
      if (btnFS) btnFS.setAttribute('title', 'Exit Fullscreen');
    } else {
      iconExpand.classList.remove('hidden');
      iconCompress.classList.add('hidden');
      if (btnFS) btnFS.setAttribute('title', 'Enter Fullscreen');
    }
  }
}

document.addEventListener('fullscreenchange', updateFullscreenUI);
document.addEventListener('webkitfullscreenchange', updateFullscreenUI);
document.addEventListener('msfullscreenchange', updateFullscreenUI);

// ── Image Modal Popup Controller ──────────────────────────────────
function openImageModal(imgSrc, captionText) {
  const overlay = document.getElementById('image-modal-overlay');
  const modalImg = document.getElementById('modal-img');
  const caption = document.getElementById('modal-caption');

  if (overlay && modalImg) {
    modalImg.src = imgSrc;
    if (caption) caption.textContent = captionText || 'Image Preview';
    overlay.classList.add('open');
  }
}

function closeImageModal() {
  const overlay = document.getElementById('image-modal-overlay');
  if (overlay) {
    overlay.classList.remove('open');
  }
}

document.addEventListener('keydown', e => {
  if (e.key === 'Escape') closeImageModal();
});

// ── Init ──────────────────────────────────────────────────────────
initVideoController();
checkAuth();
updateUI();