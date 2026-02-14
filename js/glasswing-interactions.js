/* ═══════════════════════════════════════════════════════════
   GLASSWING INTERACTIONS — Bynde
   JavaScript for scroll reveal, specular highlights,
   nav behavior, and interactive effects
   ═══════════════════════════════════════════════════════════ */

(function () {
  'use strict';

  /* ─────────────────────────────────────
     Scroll Reveal (IntersectionObserver)
     Triggers .is-visible on .animate-on-scroll elements
     ───────────────────────────────────── */
  function initScrollReveal() {
    const elements = document.querySelectorAll('.animate-on-scroll');
    if (!elements.length) return;

    // Respect reduced motion preference
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      elements.forEach(function (el) {
        el.classList.add('is-visible');
      });
      return;
    }

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.15, rootMargin: '0px 0px -40px 0px' }
    );

    elements.forEach(function (el) {
      observer.observe(el);
    });
  }

  /* ─────────────────────────────────────
     Nav Scroll Behavior
     Shrinks on scroll down, expands on scroll up
     ───────────────────────────────────── */
  function initNavScroll() {
    var nav = document.querySelector('.glass-nav');
    if (!nav) return;

    var lastScrollY = 0;
    var scrollThreshold = 100;
    var ticking = false;

    function updateNav() {
      var currentScrollY = window.scrollY;

      if (currentScrollY > scrollThreshold) {
        nav.classList.add('is-scrolled');
      } else {
        nav.classList.remove('is-scrolled');
      }

      lastScrollY = currentScrollY;
      ticking = false;
    }

    window.addEventListener('scroll', function () {
      if (!ticking) {
        requestAnimationFrame(updateNav);
        ticking = true;
      }
    }, { passive: true });
  }

  /* ─────────────────────────────────────
     Specular Highlight Mouse Tracking
     Tracks mouse position on .glass-card-interactive
     ───────────────────────────────────── */
  function initSpecularHighlight() {
    var cards = document.querySelectorAll('.glass-card-interactive');
    if (!cards.length) return;

    cards.forEach(function (card) {
      card.addEventListener('mousemove', function (e) {
        var rect = card.getBoundingClientRect();
        var x = ((e.clientX - rect.left) / rect.width) * 100;
        var y = ((e.clientY - rect.top) / rect.height) * 100;
        card.style.setProperty('--mouse-x', x + '%');
        card.style.setProperty('--mouse-y', y + '%');
      });

      card.addEventListener('mouseleave', function () {
        card.style.setProperty('--mouse-x', '50%');
        card.style.setProperty('--mouse-y', '-20%');
      });
    });
  }

  /* ─────────────────────────────────────
     Number Count Up Animation
     Usage: countUp(element, start, end, duration)
     ───────────────────────────────────── */
  function countUp(el, start, end, duration) {
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      el.textContent = end.toLocaleString();
      return;
    }

    var startTime = null;
    var isDecimal = String(end).includes('.') || end % 1 !== 0;
    var decimalPlaces = isDecimal ? (String(end).split('.')[1] || '').length || 1 : 0;

    function step(timestamp) {
      if (!startTime) startTime = timestamp;
      var progress = Math.min((timestamp - startTime) / duration, 1);

      // Ease out cubic
      var eased = 1 - Math.pow(1 - progress, 3);
      var current = start + (end - start) * eased;

      if (isDecimal) {
        el.textContent = current.toFixed(decimalPlaces);
      } else {
        el.textContent = Math.floor(current).toLocaleString();
      }

      if (progress < 1) {
        requestAnimationFrame(step);
      }
    }

    requestAnimationFrame(step);
  }

  // Auto-init count up on elements with data-count-to attribute
  function initCountUp() {
    var elements = document.querySelectorAll('[data-count-to]');
    if (!elements.length) return;

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            var el = entry.target;
            var end = parseFloat(el.getAttribute('data-count-to'));
            var start = parseFloat(el.getAttribute('data-count-from') || '0');
            var duration = parseInt(el.getAttribute('data-count-duration') || '1500', 10);
            countUp(el, start, end, duration);
            observer.unobserve(el);
          }
        });
      },
      { threshold: 0.5 }
    );

    elements.forEach(function (el) {
      observer.observe(el);
    });
  }

  /* ─────────────────────────────────────
     Smooth Anchor Scrolling
     ───────────────────────────────────── */
  function initSmoothScroll() {
    document.addEventListener('click', function (e) {
      var link = e.target.closest('a[href^="#"]');
      if (!link) return;

      var targetId = link.getAttribute('href');
      if (targetId === '#') return;

      var target = document.querySelector(targetId);
      if (!target) return;

      e.preventDefault();

      var navHeight = 80; // approximate nav height
      var nav = document.querySelector('.glass-nav');
      if (nav) navHeight = nav.offsetHeight + 24;

      var top = target.getBoundingClientRect().top + window.scrollY - navHeight;

      window.scrollTo({
        top: top,
        behavior: window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 'auto' : 'smooth'
      });
    });
  }

  /* ─────────────────────────────────────
     Mobile Hamburger Menu Toggle
     ───────────────────────────────────── */
  function initMobileMenu() {
    var toggle = document.querySelector('.glass-nav-toggle');
    var menu = document.querySelector('.glass-nav-menu');
    if (!toggle || !menu) return;

    toggle.addEventListener('click', function () {
      var isOpen = menu.classList.toggle('is-open');
      toggle.classList.toggle('is-open', isOpen);
      toggle.setAttribute('aria-expanded', String(isOpen));

      // Prevent body scroll when menu is open
      document.body.style.overflow = isOpen ? 'hidden' : '';
    });

    // Close menu on link click
    menu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        menu.classList.remove('is-open');
        toggle.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
        document.body.style.overflow = '';
      });
    });

    // Close on escape key
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && menu.classList.contains('is-open')) {
        menu.classList.remove('is-open');
        toggle.classList.remove('is-open');
        toggle.setAttribute('aria-expanded', 'false');
        document.body.style.overflow = '';
      }
    });
  }

  /* ─────────────────────────────────────
     Initialize Everything on DOMContentLoaded
     ───────────────────────────────────── */
  function init() {
    initScrollReveal();
    initNavScroll();
    initSpecularHighlight();
    initCountUp();
    initSmoothScroll();
    initMobileMenu();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  // Expose countUp globally for manual use
  window.glasswing = {
    countUp: countUp
  };
})();
