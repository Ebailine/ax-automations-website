/* ========================================
   AX AUTOMATIONS — MAIN JS
   ======================================== */

// === IntersectionObserver for fade-in ===
const fadeObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

document.querySelectorAll('.fade-in').forEach(el => fadeObserver.observe(el));

// === Mobile Nav ===
const toggle = document.getElementById('navToggle');
const links = document.getElementById('navLinks');
if (toggle && links) {
  toggle.addEventListener('click', () => links.classList.toggle('open'));
  links.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => links.classList.remove('open'));
  });
}

// === Nav scroll state ===
window.addEventListener('scroll', () => {
  const nav = document.getElementById('nav');
  if (nav) nav.classList.toggle('scrolled', window.scrollY > 10);
}, { passive: true });

// === Hero Chat Animation ===
(function initHeroChat() {
  const container = document.getElementById('heroChatMessages');
  const missedCall = document.getElementById('heroMissedCall');
  const typing = document.getElementById('heroTyping');
  if (!container || !missedCall) return;

  const messages = [
    { type: 'incoming', text: "Hi! Thanks for calling Mike's Plumbing. We missed your call. How can we help?", time: '9:41 AM' },
    { type: 'outgoing', text: 'I have a leak in my kitchen, need someone ASAP', time: '9:42 AM' },
    { type: 'incoming', text: 'We can have someone there today. Does 2 PM work?', time: '9:42 AM' },
    { type: 'outgoing', text: 'Perfect, 2 PM works great!', time: '9:43 AM' },
    { type: 'incoming', text: "You're all set! Mike will be there at 2 PM. We'll send a confirmation text.", time: '9:43 AM' },
  ];

  function runHeroChat() {
    container.innerHTML = '';
    missedCall.classList.remove('visible');
    if (typing) typing.classList.remove('visible');

    // Show missed call first
    setTimeout(() => missedCall.classList.add('visible'), 400);

    let delay = 1800;
    messages.forEach((msg, i) => {
      delay += (msg.type === 'incoming') ? 1200 : 800;
      const showAt = delay;

      // Show typing before incoming
      if (msg.type === 'incoming' && typing) {
        setTimeout(() => typing.classList.add('visible'), showAt - 800);
      }

      setTimeout(() => {
        if (typing) typing.classList.remove('visible');
        const bubble = document.createElement('div');
        bubble.className = `chat-bubble ${msg.type}`;
        bubble.innerHTML = `<div class="chat-text">${msg.text}</div><div class="chat-time">${msg.time}</div>`;
        container.appendChild(bubble);
        requestAnimationFrame(() => {
          requestAnimationFrame(() => bubble.classList.add('visible'));
        });
      }, showAt);

      delay += 600;
    });

    // Loop
    setTimeout(runHeroChat, delay + 3000);
  }

  // Start when hero is visible
  const heroObs = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      heroObs.disconnect();
      runHeroChat();
    }
  }, { threshold: 0.2 });
  heroObs.observe(document.querySelector('.hero'));
})();

// === Demo Tabs ===
(function initDemoTabs() {
  const tabs = document.querySelectorAll('.demo-tab');
  const panels = document.querySelectorAll('.demo-panel');
  if (!tabs.length) return;

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      panels.forEach(p => p.classList.remove('active'));
      tab.classList.add('active');
      const panel = document.getElementById('panel-' + tab.dataset.tab);
      if (panel) {
        panel.classList.add('active');
        // Trigger specific demo
        if (tab.dataset.tab === 'missed-call') startMissedCallDemo();
        if (tab.dataset.tab === 'review') startReviewDemo();
        if (tab.dataset.tab === 'ai-phone') startAIPhoneDemo();
      }
    });
  });

  // Auto-start first demo when visible
  const demoObs = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      demoObs.disconnect();
      startMissedCallDemo();
    }
  }, { threshold: 0.2 });
  const demoSection = document.getElementById('demo');
  if (demoSection) demoObs.observe(demoSection);
})();

// Missed Call Demo
let missedCallTimer = null;
function startMissedCallDemo() {
  if (missedCallTimer) clearTimeout(missedCallTimer);
  const steps = document.querySelectorAll('#panel-missed-call .demo-step-item');
  if (!steps.length) return;

  steps.forEach(s => s.classList.remove('active'));
  let current = 0;

  function advance() {
    steps.forEach(s => s.classList.remove('active'));
    if (current < steps.length) {
      steps[current].classList.add('active');
      current++;
      missedCallTimer = setTimeout(advance, 1800);
    } else {
      current = 0;
      missedCallTimer = setTimeout(advance, 2500);
    }
  }
  advance();
}

// Review Demo
let reviewTimer = null;
function startReviewDemo() {
  if (reviewTimer) clearTimeout(reviewTimer);
  const steps = document.querySelectorAll('#panel-review .review-step');
  if (!steps.length) return;

  steps.forEach(s => s.classList.remove('active'));
  let current = 0;

  function advanceReview() {
    steps.forEach(s => s.classList.remove('active'));

    if (current === 0) {
      steps[0].classList.add('active');
      current++;
      reviewTimer = setTimeout(advanceReview, 2500);
    } else if (current === 1) {
      steps[1].classList.add('active');
      // Animate stars
      const stars = document.querySelectorAll('.review-star');
      stars.forEach((s, i) => {
        setTimeout(() => s.classList.add('lit'), i * 200);
      });
      current++;
      reviewTimer = setTimeout(advanceReview, 2000);
    } else if (current === 2) {
      steps[2].classList.add('active');
      // Animate counter
      const counter = document.getElementById('reviewCounter');
      const countEl = document.getElementById('reviewCount');
      if (counter) animateValue(counter, 4.2, 4.3, 1500, 1);
      if (countEl) animateValue(countEl, 47, 48, 1500, 0);
      current++;
      reviewTimer = setTimeout(advanceReview, 3000);
    } else {
      // Reset
      const stars = document.querySelectorAll('.review-star');
      stars.forEach(s => s.classList.remove('lit'));
      current = 0;
      advanceReview();
    }
  }
  advanceReview();
}

// AI Phone Demo
let aiPhoneTimer = null;
function startAIPhoneDemo() {
  if (aiPhoneTimer) clearTimeout(aiPhoneTimer);
  const transcript = document.getElementById('aiTranscript');
  const timerEl = document.getElementById('aiCallTimer');
  if (!transcript) return;

  transcript.innerHTML = '';
  let seconds = 0;

  const lines = [
    { speaker: 'ai', text: "Thank you for calling Mike's Plumbing. How can I help you today?" },
    { speaker: 'caller', text: "Hi, I have a leak under my kitchen sink. Is anyone available today?" },
    { speaker: 'ai', text: "I'm sorry to hear that. Let me check today's schedule for you." },
    { speaker: 'ai', text: "We have an opening at 2:00 PM today. Would that work for you?" },
    { speaker: 'caller', text: "Yes, 2 PM is perfect." },
    { speaker: 'ai', text: "Great. I've booked you for 2 PM. Mike will be there. Is there anything else?" },
    { speaker: 'caller', text: "No, that's it. Thanks!" },
    { speaker: 'ai', text: "You're all set! We'll send a confirmation text shortly. Have a great day." },
  ];

  // Timer
  const timerInterval = setInterval(() => {
    seconds++;
    if (timerEl) {
      const m = Math.floor(seconds / 60);
      const s = seconds % 60;
      timerEl.textContent = `${m}:${s.toString().padStart(2, '0')}`;
    }
  }, 1000);

  let delay = 1000;
  lines.forEach((line, i) => {
    setTimeout(() => {
      const div = document.createElement('div');
      div.className = 'ai-transcript-line';
      div.innerHTML = `<span class="speaker ${line.speaker}">${line.speaker === 'ai' ? 'AI' : 'Caller'}</span>${line.text}`;
      transcript.appendChild(div);
      requestAnimationFrame(() => {
        requestAnimationFrame(() => div.classList.add('visible'));
      });
      transcript.scrollTop = transcript.scrollHeight;
    }, delay);
    delay += 2200;
  });

  aiPhoneTimer = setTimeout(() => {
    clearInterval(timerInterval);
    // Restart after pause
    aiPhoneTimer = setTimeout(() => startAIPhoneDemo(), 3000);
  }, delay + 1000);
}

// === Animated Counters ===
function animateValue(el, start, end, duration, decimals) {
  const range = end - start;
  const startTime = performance.now();
  const prefix = el.dataset ? (el.dataset.prefix || '') : '';
  const suffix = el.dataset ? (el.dataset.suffix || '') : '';

  function update(now) {
    const elapsed = now - startTime;
    const progress = Math.min(elapsed / duration, 1);
    // Ease out
    const eased = 1 - Math.pow(1 - progress, 3);
    const current = start + range * eased;
    el.textContent = prefix + current.toFixed(decimals) + suffix;
    if (progress < 1) requestAnimationFrame(update);
  }
  requestAnimationFrame(update);
}

(function initCounters() {
  const counters = document.querySelectorAll('.stat-number[data-target]');
  if (!counters.length) return;

  const counterObs = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = parseFloat(el.dataset.target);
        const suffix = el.dataset.suffix || '';
        const prefix = el.dataset.prefix || '';
        el.dataset.prefix = prefix;
        el.dataset.suffix = suffix;
        animateValue(el, 0, target, 2000, 0);
        counterObs.unobserve(el);
      }
    });
  }, { threshold: 0.3 });

  counters.forEach(c => counterObs.observe(c));
})();
